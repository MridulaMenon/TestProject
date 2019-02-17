@isTest
public class utilityTestDataClass
{

 //private Messaging.InboundEmail.BinaryAttachment attachment;

 public Static Attachment createAttachment()
    {
        Attachment attach = new Attachment();
        attach.Body=blob.valueOf('my attachment text');
        attach.Name='textfile.txt';
        attach.ContentType= 'text/plain';
        return attach;
    }
    
        public Static Lead createLead()
    {
        Lead newLead = new Lead();
        newLead.LastName='TestName';
        newLead.Company = 'TestCompany';
        newLead.Email='hi@gmail.com';
        newLead.Status ='Open';
       // newLead.Cc__c='te23@gmail.com';
        newLead.Description='Subject:TextBody';
        return newLead;
    } 
    
    public Static Messaging.InboundEmail.BinaryAttachment createbinary()
    {
      Messaging.InboundEmail.BinaryAttachment attachment =new  Messaging.InboundEmail.BinaryAttachment();
         attachment.body = blob.valueOf('my attachment text');
         attachment.fileName = 'textfile.txt';
         attachment.mimeTypeSubType = 'text/plain';
              return attachment;
    }
    
     public Static Messaging.InboundEmail.TextAttachment createtext()
    {
        Messaging.InboundEmail.TextAttachment tattachment =new  Messaging.InboundEmail.TextAttachment();
         tattachment.fileName ='TEST.txt';
          tattachment.Body = String.valueOf('my text attachment ');
              return tattachment;
    }
     
     
   }