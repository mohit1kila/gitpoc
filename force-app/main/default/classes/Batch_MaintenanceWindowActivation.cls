global class Batch_MaintenanceWindowActivation implements Database.Batchable<sobject>
{
    global final String Query;
    global Batch_MaintenanceWindowActivation(string q)
    {
    // Query=q;
    }
     global Database.QueryLocator start(Database.BatchableContext BC)
     {
         return Database.getQueryLocator(query);
        
     
     }
     global void execute(Database.BatchableContext BC, List<sObject>scope)
     {/*  list<User> lstUser=new list<User>();
        String profileID=[select id from profile where Name =: Label.ProfileName][0].id; // Getting the profile ID for the Maintenance 
        for(Sobject sobj : scope)
         {
             User objUSR=(User)sobj;
             if(objUSR.Profile.Name !='System Administrator' && objUSR.Profile.Name!='Chatter Free User')
             {
                 objUSR.profileId=profileID;
                 lstUser.add(objUSR);
             }
         }   
        if(lstUser.size()>0)
        {   System.debug('aebug'+lstUser);
           // Update lstUser;
        }*/
     }
     
       global void finish(Database.BatchableContext BC)
       {
            
       }
}