@isTest
private class Test_WSSnailMail {
	
	@isTest static void test_method_WSSnailMail() {
		// Implement test code
		Contact dummyClient = new Contact(LastName = 'Test Contact');
        insert dummyClient;

        String blobStr = 'test';
        Blob b = Blob.valueOf(blobStr);
        Test.setMock(WebServiceMock.class, new WebServiceMockWSSnail());
        Test.startTest();
        WSSnailMail wssObj = new WSSnailMail();
        wssObj.sendMail(b,dummyClient,'test');
        Test.stopTest();
	}
	
}