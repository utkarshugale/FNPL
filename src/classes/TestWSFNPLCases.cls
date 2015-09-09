@isTest
public class TestWSFNPLCases {

    static testMethod void testGetcase() {

        RestRequest req 		= new RestRequest(); 
        RestResponse res 		= new RestResponse();
		req.requestURI 			= '/services/apexrest/v1/cases';  
        req.addParameter('Cid', '00325000003i29qs');
        req.httpMethod 			= 'GET';
        RestContext.request 	= req;
        RestContext.response	= res;
		case caseobj= new case();
        case[] caseobjq			= null;
            contact conobj 		= new contact();
            conobj.LastName		='Test';
            conobj.Email		='Test@Flynowpaylater.com';
            insert conobj;
            caseobj.Subject		='Test Subject';
            caseobj.Description	='Test Description';
            caseobj.ContactId	='00325000003i29q';//conobj.Id;
            insert  caseobj;
        	system.debug('caseobj'+caseobj);
                caseobjq=[select Subject,Description,status from case where contact.id=:caseobj.ContactId ];
                string casenum		='100';
                ResponseCase results=new ResponseCase ();
                results.openCase('message', 'status', 'Errmessage', 'Errcode', caseobjq);
                results.noOpenCase('message',' status',' Errmessage',' Errcode');
                results.noValidEmail('message', 'status', 'Errmessage', 'Errcode');
                results.postCaseError('message', 'status', 'Errmessage', 'Errcode');
                results.postCaseBlankInputError('message', 'status', 'Errmessage', 'Errcode');
                results.postCaseSuccess('message', 'status', 'Errmessage', 'Errcode', casenum);
                ResponseCase r = WSFNPLCases.getCases();
          
                //HTTP POST Method Invoke        
                RestRequest req1 			= new RestRequest(); 
                RestResponse res1			= new RestResponse();
                req.requestURI 				= '/services/apexrest/v1/cases';  
                req.httpMethod 				= 'POST';
                RestContext.request 		= req1;
                RestContext.response 		= res1;

        		Contact conoobj				= new contact(Lastname='test',email='k@gmail.com');
        		list <contact> con			=new list<contact>();
   		 	 	con.add(conoobj);
        		insert conoobj;
                system.debug('conoobj'+conoobj);
                system.debug('ccon'+con);
        		
        		case casepost				=new case();
   				casepost.Subject 			= 'Subject' ;
                casepost.Description 		= 'Description' ;
                casepost.ContactId 			= conoobj.id;
                casepost.Origin				='Web';
                casepost.Status				='Open';
       			insert casepost;
        		System.assert(con.size()!=0);
	     
                ResponseCase rr=WSFNPLCases.createCase('', '', conobj.id);
                ResponseCase rr1=WSFNPLCases.createCase('', 'Description',conobj.id);
                ResponseCase rr3=WSFNPLCases.createCase('Subject', '',conobj.id);
                ResponseCase rr4=WSFNPLCases.createCase('Subject', 'Description', conobj.id);
                ResponseCase rr5=WSFNPLCases.createCase('Subject', 'Description', conobj.id);
              
    }

}