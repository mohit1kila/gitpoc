@isTest
private class TestVerifyDate{

  @isTest static void testdate1()
  {
  date dt1=system.today();
  date dt2=system.today();
  dt2=dt2.adddays(30);
      VerifyDate.CheckDates(dt1,dt2);
      
  }
@isTest static void testdate2()
  {
   date dt1=system.today();
  date dt2=system.today();
     dt1 = dt1.adddays(30);
     dt2 = system.today();
     dt2 = dt2.adddays(-30);
     VerifyDate.CheckDates(dt2,dt1);
  }
}