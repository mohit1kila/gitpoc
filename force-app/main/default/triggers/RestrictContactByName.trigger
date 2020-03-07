trigger RestrictContactByName on Contact (before insert, before update) 
{
    
    //check contacts prior to insert or update for invalid data
    For (Contact c : Trigger.New)
     {
        if(c.LastName == 'INVALIDNAME') {   //invalidname is invalid
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }

    
    //Sending Email from Contact
    Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
email.setSubject('TEST');
email.settargetobjectid(c.id);
email.setPlainTextBody('TEST');
email.setSaveAsActivity(true);
Messaging.SendEmailResult[] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email},false);

List<EmailMessage> emailMessage = [SELECT Id, Subject, TextBody FROM EmailMessage ];

}


}