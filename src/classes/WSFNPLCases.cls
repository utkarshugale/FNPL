@RestResource(urlMapping='/v1/cases')
global class WSFNPLCases {

    @HTTPGET
    global static ResponseCase getCases(){
        RestRequest req			 = RestContext.request;
        RestResponse res		 = RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        string Cid = RestContext.request.params.get('Cid');
        List<contact> Contactid	 = new List<contact>();
        Case[] Caseobj			 =null;
        ResponseCase resCase = new ResponseCase();
        
        //[Utk] - Please fetch cases using ContactId. In case, if Cusotmer changes his email, your code will fail.
        //Query all fields on Case requested by FNPL.
        Contactid=[select id from contact where id=:Cid];
        if(Contactid.size() == 0){
           return resCase.noValidEmail('No Customer Account  found for given ID.','Error','ID Not Present in the system','400');

        }
        
        Caseobj=[select casenumber,subject,Description,status,Createddate from case where contact.id=:Contactid AND Status !='Closed' ORDER BY createddate ASC];


        if(Caseobj.size()==0){        
                res.statusCode = 200;
                resCase.noOpenCase('No Active Case',' Success','Null','200');
        }
        else{
                //resCase.openCase(message, status, Errmessage, Errcode, casepara)
                resCase.openCase('Áctive Case', ' Success', 'Null','200', Caseobj);
        }
        
        return resCase;
    }

    @HTTPPOST
    global static ResponseCase createCase(String subject,string description,string Cid) {
        RestRequest req 			= RestContext.request;
        RestResponse res 			= RestContext.response;
        res.addHeader('Content-Type', 'application/json');
        ResponseCase resCase 		= new ResponseCase();
        List<Contact> Listcontact	= new List<Contact>();
        string casenum;
        Case caseobj 				= new Case();
           
        //String.isEmpty(description) && String.isEmpty(Cid)
        if( String.isEmpty(subject))  {
            res.statusCode = 400;
            return resCase.postCaseBlankInputError('Please Enter Mandatory Fields (Missing Subject)', 'Error', 'Null Value on Subject Field', '400');
            
        }
        
        else if( String.isEmpty(description) ){
            res.statusCode = 400;
            return resCase.postCaseBlankInputError('Please Enter Mandatory Fields (Missing Description)', 'Error', 'Null Value on Description Field', '400');

           }
        
        else{
        
        listcontact = [select id,name,email from contact where id=: Cid];
           
            //[utk] - better condition would be to check if list if not empty & not null.
            //comparing with size 1 seems not good to me.
            if(listcontact.size() !=0 )  {
                contact contactobj 		= listcontact.get(0);
                caseobj.Subject 		= subject ;
                caseobj.Description 	= description ;
                caseobj.ContactId 		= contactobj.id;
                caseobj.Origin			='Web';
                caseobj.Status			='Open';
                
                Database.DMLOptions dmlOpts = new Database.DMLOptions();
                dmlOpts.assignmentRuleHeader.useDefaultRule = true;
                caseobj.setOptions(dmlOpts);
                
                insert caseobj ;
                
                Case cFromDB=[select id, CaseNumber from Case where id=:caseobj.id];               
                casenum = cFromDB.CaseNumber;
                
                //Sending a Acknowledgement to that particular mail-id
        
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setSubject(subject);
                email.setToAddresses(new String[]{contactobj.Email});
                email.setSenderDisplayName('Support@Travelfund.com');
                email.setPlainTextBody(
                'Hi  \n\n' +contactobj.Name+
                'Thank you for your interest!  Your case Number is  '+ casenum+'\n\n');
                // Sends the email
                Messaging.SendEmailResult [] r = 
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});   
                return resCase.postCaseSuccess('Case Created Successfully','Success','Null', '200',casenum) ;
  
        }
            
        else{
            
            res.statusCode = 400;
            return resCase.postCaseError('No Customer Account found for given ID .','Error','ID Does not match in the system', '400');
        
        }
        
    }
        
    }
}