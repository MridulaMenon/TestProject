public class RandomContactFactory {
	public static List<Contact> generateRandomContacts(Integer contactnos,String lstname){
        String consize;
        String lastName;
        
        List<Contact> contacts=new List<Contact>();
        for(Integer i=0;i<contactnos;i++){
            String FN='Test'+i;
            Contact c=new Contact(FirstName=FN,LastName=lstname);
             contacts.add(c);
        }
            system.debug('Contact c'+contacts);
            return contacts;
    }
}