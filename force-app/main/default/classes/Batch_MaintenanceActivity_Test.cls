@isTest
public class Batch_MaintenanceActivity_Test
{
    static testmethod void test() {
        // The query used by the batch job.
        String strq = 'SELECT Id,Profileid,Profile.Name FROM User';
        Test.startTest();
 		Batch_MaintenanceWindowActivation c = new Batch_MaintenanceWindowActivation(strq);
       	Database.executeBatch(c);
        Test.stopTest();


    }

}