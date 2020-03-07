global class examplehdata  implements Database.Batchable<sobject>,Schedulable
{
    global final String Query;
    global examplehdata(string q)
    {
     Query=q;
    }
     global Database.QueryLocator start(Database.BatchableContext BC)
     {
         return Database.getQueryLocator(query);
        
     
     }
     global void execute(Database.BatchableContext BC, List<sObject>scope)
     {  list<User> lstUser=new list<User>();
       list<account> lstAcc= new List<account>();
        for(Sobject sobj : scope)
         {
            if(sobj instanceOf Case)
            {
                system.debug('Case');
            }
            if(sobj instanceOf icoder__Expense__c)
            {
                system.debug('Expanses');
            }
         }   
       
     }global void execute(schedulablecontext sc)
    {
       database.executeBatch(new batch6()) ;
    }
     
       global void finish(Database.BatchableContext BC)
       {
            
       }
}