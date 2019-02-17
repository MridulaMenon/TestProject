/* 
Class Name  : CreateLeadExampleTest 
Created Date: 8/6/2018
Description : Test Class to create lead through email 
Created By  : Amritha A Menon
*/
@isTest
public class CreateLeadExampleTest  {

    public static testMethod void testinboundemail() {
       Messaging.InboundEmail email = new Messaging.InboundEmail() ;
        Messaging.InboundEnvelope env    = new Messaging.InboundEnvelope();

        email.subject = 'Create Lead';
        email.plainTextBody = 'FromEmail';
        env.fromAddress = 'ilovenagpur@gmail.com';
        email.FromName ='LastName';
        
          Messaging.InboundEmail.BinaryAttachment attachment =  utilityTestDataClass.createbinary();
          email.binaryAttachments = new Messaging.inboundEmail.BinaryAttachment[] { attachment };
         
         Messaging.Inboundemail.TextAttachment tAttachment = utilityTestDataClass.createtext();
         email.textAttachments = new Messaging.inboundEmail.TextAttachment[] { tattachment }; 
           
        CreateLeadExample creatC = new CreateLeadExample();
        creatC.handleInboundEmail(email, env );
 
       
    }
    }