global class LeadProcessor implements Database.Batchable<SObject> ,  Database.Stateful{   

     global Integer recordsProcessed = 0;
    global database.querylocator start(Database.BatchableContext BC){      
        
        return Database.getQueryLocator('SELECT ID, Name,LeadSource,Status FROM Lead '+' where Status = \'Open\'');        
    }
	
    
    global void execute(Database.BatchableContext BC, List<Lead> listData){ 
		List<Lead> leads = new List<Lead>();
        for(Lead l:listData){
            l.LeadSource ='DreamForce';
             leads.add(l);
            recordsProcessed =recordsProcessed +1;
        }
           update leads;
    }
    
     global void finish(Database.BatchableContext BC){
         
          System.debug(recordsProcessed + ' records processed successfully!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :BC.getJobId()];
        // call some utility to send email
       // EmailUtils.sendMessage(a, recordsProcessed);
         
     }
}