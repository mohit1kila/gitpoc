public class RollupUtills {

  @InvocableMethod(label='Calculate Order Rollup' description='Returns the list of account names corresponding to the specified account IDs.')
  public static List<String> updateconTotalNumberofOrder(list<id> ids) {
    List<Order> lstCon=[select id,BillToContactId from Order where BillToContactId=:ids limit 1];
    list<contact> lstContoUpdate= new list<contact>();
   for(Order ct:lstCon)
   {
       if(ct.BillToContactId!=null)
       {  contact cot=new contact(id=ct.BillToContactId);
           cot.Languages__c ='english';
           lstContoUpdate.add(cot);
       }
       
       if(lstContoUpdate.size()>0)
       {
           update lstContoUpdate;
       }
   }
  return new list<string>{ 'success'};
    }
   
  }