@isTest
private class TestRestrictContactByName {

    
    @isTest static void testContactInvalidLstName(){
       
        Contact c= new Contact(FirstName='Mridula',LastName='INVALIDNAME');
        insert c;
        Test.startTest();
        Database.SaveResult res =Database.insert(c,false);
        Test.stopTest();
        
        System.assert(!res.success);
        System.assert(res.getErrors().size() > 0);
    }
    @isTest static void testContactInvalidLstNameCaseSen(){
       
        Contact c= new Contact(FirstName='Mridula1',LastName='InvalidName');
        insert c;
        Test.startTest();
        Database.SaveResult res =Database.insert(c,false);
        Test.stopTest();
        
        System.assert(!res.success);
        System.assert(res.getErrors().size() > 0);
    }
    @isTest static void testContactInvalidLstNameValid(){
       
        Contact c= new Contact(FirstName='Mridula11',LastName='Menon');
        insert c;
        Test.startTest();
        Database.SaveResult res =Database.insert(c,true);
        Test.stopTest();
        
        System.assert(res.success);
        System.assert(res.getErrors().size() > 0);
    }
     @isTest static void testContactInvalidLstNameupdate(){
       
        Contact c= new Contact(FirstName='Mridula12',LastName='INVALIDNAME');
        insert c;
        Test.startTest();
        Database.SaveResult res =Database.update(c,false);
        Test.stopTest();
        
        System.assert(res.success);
        System.assert(res.getErrors().size() > 0);
    }
}