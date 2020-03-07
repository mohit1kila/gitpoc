public class MycaseCTRl {
   public case objSC{get;set;}
    public MycaseCTRl(ApexPages.StandardController controller) 
    {
        case idd = (Case)controller.getRecord();
        objSC= [select id , recordtypeid,contactid, accountid  from case where id=:idd.id  ];
    }

}