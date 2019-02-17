public class StringArrayTest {
  // public static  List<String> lstStringArray;
 // public static List<String> lstStringArray;
   // String generateText;
    //public static String s;
    public static List<String> generateStringArray(Integer num){
       List<String> lstStringArray=new List<String>();
        
        
        for(Integer i=0;i<num;i++){
          String s= 'Test '+ i;
            lstStringArray.add(s);
            system.debug('Display'+lstStringArray);
        
         
    }
        return lstStringArray;
    }
}