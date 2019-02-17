@isTest
private class TestVerifyDate {

    @isTest static void testDate2Past30Days(){
        Date testDate1 =VerifyDate.CheckDates(System.today(),System.today()-2);
        //Boolean testValue=  VerifyDate.DateWithin30Days(System.today(),System.today()-2);
       // System.assertEquals(false, testValue);
    }
     @isTest static void testDateGreaterthan30Days(){
         Date testDate2= VerifyDate.CheckDates(System.today(),System.today()+30);
       // Boolean testDate2= VerifyDate.DateWithin30Days(System.today(),System.today()+30);
        //System.assertEquals(false, testValue2);
    }
     @isTest static void testDateLessthan30Days(){
         Date testDate2= VerifyDate.CheckDates(System.today(),System.today()+20);
        //Boolean testValue3= VerifyDate.DateWithin30Days(System.today(),System.today()+20);
        //System.assertEquals(true, testValue3);
    }
     @isTest static void testSetEndOfMonthDate(){
         // Date setDate =Date.newInstance(2016, 12, 9);
          Date testDate2= VerifyDate.CheckDates(System.today(),System.today()+40);
      
       // Date testValue3= VerifyDate.SetEndOfMonthDate(setDate);
        //System.assertEquals(true, testValue3);
    }
    
}