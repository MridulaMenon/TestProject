global class CreateLeadEmailService implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {

        Lead lead;

        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult(); 
     

        try {
            //Look for lead whos name is the email and create it if necessary

          //  List<Lead> leadList = new List<Lead>();


            String tempLead = email.FromAddress;
           
            String [] ccAddress=email.ccAddresses;
            
            System.debug('ToAddress'+email.toAddresses);
            System.debug('FROMADDRESS = '+email.FromAddress);
            System.debug('FROMADDRESS TEMPLEAD = '+tempLead);

            

          /*  String leadQuery = 'select id, LastName from Lead where LastName = \'' + tempLead +'\'';
            System.debug('QUEEEEEEEEEEEEEEE'+leadQuery);
            leadList = Database.Query(leadQuery);
            System.debug('LISSSSSST'+leadList);
            Integer leadCount = leadList.size();
            System.debug('LEAD COUNT FROM THE QUERY -'+leadCount);
              
            if (leadCount == 0) { */
            
            
             for (String address : email.ccAddresses)
               {
                
                System.Debug('INSIDE IF for LEAD COUNT EQUAL TO 0');
                system.debug('EmailAddress'+ email.ccAddresses);
                lead = new Lead();
                lead.Status = 'New';
                lead.LastName = email.FromName;
                lead.Company = (email.FromAddress.split('@').get(1));
                lead.Email = email.FromAddress;
                system.debug(address);
                lead.Description='Subject:'+ email.subject  + '/n' + email.plainTextBody;
                
                }
                 
                insert lead;
                
                
            //Save any text attachments, if any
            if (email.textAttachments != null)
            {
            for (integer i = 0 ; i < email.textAttachments.size() ; i++) {
            Attachment attachment = new Attachment();
            // attach to the newly created contact record
            attachment.ParentId = lead.Id;
            attachment.Name = email.textAttachments[i].filename;
            attachment.Body = Blob.valueof(email.textAttachments[i].body);
            insert attachment;
            }
            
            }

            //Save any Binary Attachment
            
             if (email.binaryAttachments != null && email.binaryAttachments.size() > 0) {
          for (integer i = 0 ; i < email.binaryAttachments.size() ; i++) {
            Attachment attachment = new Attachment();
            // attach to the newly created contact record
            attachment.ParentId = lead.Id;
            attachment.Name = email.binaryAttachments[i].filename;
            attachment.Body = email.binaryAttachments[i].body;
            insert attachment;
          }
       }
          
            
            
                   
            result.success = true;
            
        } catch (Exception e) {
            result.success = false;
            result.message = 'Error processing email...';
        }
        return result;
    }
}