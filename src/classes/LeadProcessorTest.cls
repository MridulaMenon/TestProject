@isTest
private class LeadProcessorTest {

    @isTest static void testLeadRec(){
        List<Lead> leads =new List<Lead>();
         Test.startTest();
        for (Integer i=0;i<10;i++){
            
             Lead l = new Lead(Company = 'Test Lead',
                      LastName = 'Lead Last Name'+i,
                      Status = 'Open',LeadSource='DreamForce');
             leads.add(l);
            
        }
        insert leads;
        
       
        LeadProcessor l=new LeadProcessor();
        Id batchId = Database.executeBatch(l);
        Test.stopTest();
        
    }
}