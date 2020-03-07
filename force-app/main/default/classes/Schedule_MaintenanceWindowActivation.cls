global class Schedule_MaintenanceWindowActivation implements Schedulable{
 
   global void execute(SchedulableContext sc) {
    
   
       string str='select id , profileId,Profile.Name from user ';
       Batch_MaintenanceWindowActivation b =new Batch_MaintenanceWindowActivation(str); 
       database.executebatch(b);
   }

    
    
    
}