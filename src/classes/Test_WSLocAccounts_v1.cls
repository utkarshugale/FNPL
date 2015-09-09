@isTest
public class Test_WSLocAccounts_v1 {
  
   public static Contact objCon(){
    Contact  objContact = new Contact();
    objContact.FirstName = 'testContact1';
    objContact.LastName  = 'TestContact2';
    insert objContact ;
    return objContact;
   }
   
  @isTest static void test_method_WSLocAccounts_v1_1() {
        // Implement test code
        Contact objCon = Test_WSLocAccounts_v1.objCon();
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
        Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }

    @isTest static void test_method_WSLocAccounts_v1_2() {
        // Implement test code
       Contact objCon = Test_WSLocAccounts_v1.objCon();
       
        Map<String,Object> reqBodyMap = new Map<String,Object>();
        reqBodyMap.put('borrowerId', objCon.id);
        reqBodyMap.put('loanAmount', 1200);
        reqBodyMap.put('term',3);
        reqBodyMap.put('interestRate',3);
        reqBodyMap.put('purpose','testing');
        reqBodyMap.put('expectedDisbursalDate',date.today());
        reqBodyMap.put('firstInstallmentDate',date.today());
        reqBodyMap.put('frequencyOfPayment', '2');
        reqBodyMap.put('interestOnlyPeriod', 3);
        reqBodyMap.put('balloonPayment', 123);
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        req.requestBody = Blob.valueOf(JSON.serialize(reqBodyMap));
//        req.(JSON.serializePretty('contractId:'+loanId));
//        req.addParameter('contractId', loanAccount.Id);
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
         Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }

    
    @isTest static void test_method_WSLocAccounts_v1_3() {
        // Implement test code
        Contact objCon = Test_WSLocAccounts_v1.objCon();
        Map<String,Object> reqBodyMap = new Map<String,Object>();
        reqBodyMap.put('borrowerId', null);
        reqBodyMap.put('loanProductId',objCon.id);
        reqBodyMap.put('loanAmount', 1200);
        reqBodyMap.put('term',3);
        reqBodyMap.put('interestRate',3);
        reqBodyMap.put('purpose','testing');
        reqBodyMap.put('expectedDisbursalDate',date.today());
        reqBodyMap.put('firstInstallmentDate',date.today());
        reqBodyMap.put('frequencyOfPayment', '2');
        reqBodyMap.put('interestOnlyPeriod', 3);
        reqBodyMap.put('balloonPayment', 123);
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        req.requestBody = Blob.valueOf(JSON.serialize(reqBodyMap));
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
         Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }


    @isTest static void test_method_WSLocAccounts_v1_4() {
        // Implement test code
         Contact objCon = Test_WSLocAccounts_v1.objCon();
        Map<String,Object> reqBodyMap = new Map<String,Object>();
        reqBodyMap.put('borrowerId',objCon.id);
        reqBodyMap.put('loanProductId',string.valueOf(objCon.id));
        reqBodyMap.put('loanAmount', null);
        reqBodyMap.put('term',3);
        reqBodyMap.put('interestRate',3);
        reqBodyMap.put('purpose','testing');
        reqBodyMap.put('expectedDisbursalDate',date.today());
        reqBodyMap.put('firstInstallmentDate',date.today());
        reqBodyMap.put('frequencyOfPayment', '2');
        reqBodyMap.put('interestOnlyPeriod', 3);
        reqBodyMap.put('balloonPayment', 123);
        reqBodyMap.put('term',3);
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        req.requestBody = Blob.valueOf(JSON.serialize(reqBodyMap));
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
         Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }

    @isTest static void test_method_WSLocAccounts_v1_5() {
        // Implement test code
        Contact objCon = Test_WSLocAccounts_v1.objCon();
        Map<String,Object> reqBodyMap = new Map<String,Object>();
        reqBodyMap.put('borrowerId', objCon.id);
        reqBodyMap.put('loanProductId',string.valueOf(objCon.id));
        reqBodyMap.put('loanAmount', 2000);
        reqBodyMap.put('term',null);
        reqBodyMap.put('interestRate',3);
        reqBodyMap.put('purpose','testing');
        reqBodyMap.put('expectedDisbursalDate',date.today());
        reqBodyMap.put('firstInstallmentDate',date.today());
        reqBodyMap.put('frequencyOfPayment', '2');
        reqBodyMap.put('interestOnlyPeriod', 3);
        reqBodyMap.put('balloonPayment', 123);
        reqBodyMap.put('term',3);
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        req.requestBody = Blob.valueOf(JSON.serialize(reqBodyMap));
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
         Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }

   
    @isTest static void test_method_WSLocAccounts_v1_6() {
        // Implement test code
       Contact objCon = Test_WSLocAccounts_v1.objCon();
        Map<String,Object> reqBodyMap = new Map<String,Object>();
        reqBodyMap.put('borrowerId',objCon.id);
        reqBodyMap.put('loanProductId',string.valueOf(objCon.id));
        reqBodyMap.put('loanAmount', 2000);
        reqBodyMap.put('term',2);
        reqBodyMap.put('interestRate',2);
        reqBodyMap.put('purpose','test');
        reqBodyMap.put('expectedDisbursalDate',date.today());
        reqBodyMap.put('firstInstallmentDate',date.today());
        reqBodyMap.put('frequencyOfPayment', '1');
        reqBodyMap.put('interestOnlyPeriod', 1);
        reqBodyMap.put('balloonPayment',2);
        reqBodyMap.put('term',null);
        RestRequest req  = new RestRequest(); 
        RestResponse res = new RestResponse();
        req.requestURI = '/services/apexrest/v1/lineofcredit';
        req.requestBody = Blob.valueOf(JSON.serialize(reqBodyMap));
//        req.(JSON.serializePretty('contractId:'+loanId));
//        req.addParameter('contractId', loanAccount.Id);
        req.httpMethod = 'POST';
        RestContext.request = req;
        RestContext.response = res;

        Test.startTest();
         Response results = WSLocAccounts_v1.createLoanAccount();
        Test.stopTest();
    }
}