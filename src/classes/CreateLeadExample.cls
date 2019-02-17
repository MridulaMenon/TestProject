global class CreateLeadExample implements Messaging.InboundEmailHandler {

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {

      

        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();      
                
            String tempLead = email.FromAddress;
            String subToCompare = 'Create Lead';

        if(email.subject.equalsIgnoreCase(subToCompare))
        {
             Lead  l = new Lead();
                l.Status = 'New';
                l.LastName = email.FromName;
                l.Company  ='TestEmail';
                l.Email = email.FromAddress;
                l.Description='Subject:'+ email.subject + '\n' + email.plainTextBody;
                insert l;
                
                
            //Save any text attachments, if any
            if (email.textAttachments != null)
            {
            for (integer i = 0 ; i < email.textAttachments.size() ; i++) {
            Attachment attachment = new Attachment();
            // attach to the newly created contact record
            attachment.ParentId = l.Id;
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
            attachment.ParentId = l.Id;
            attachment.Name = email.binaryAttachments[i].filename;
            attachment.Body = email.binaryAttachments[i].body;
            insert attachment;
          }
       }
          
         }  
                     
            result.success = true;
        
        return result;
    }
}