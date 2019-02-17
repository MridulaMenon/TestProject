public class AccountProcessor {

    
    @future
    public static void countContacts(Set<Id> acctIDs){
       
        List<Account> lstAccts =new List<Account>();
        lstAccts=[select id,Number_of_Contacts__c ,(select Id from contacts)from Account where Id IN :acctIDs];
            for(Account acc :lstAccts){
                List<Contact> lstcont = acc.contacts;
                acc.Number_of_Contacts__c=lstcont.size();
            }
        	update lstAccts;
            }
}