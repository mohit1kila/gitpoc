public class showicon
{
 @AuraEnabled public static string getIcon()
     {
     //Logged In User : 
     string strIconName='';
        list<User> lstUser= new list<User>();
        string strUserId= UserInfo.getUserId();
        lstUser= [select id, UserName, Name,contactId from user where id =:strUserId];
        contact ct= new contact();
        if(lstUser[0].contactId !=null)
        {
        ct= [select id, lastName from contact where Id=:lstUser[0].contactId];
        
        }
        if(ct.lastname =='DFL')
        {
        strIconName ='DFL';
        }else
        {
        strIconName ='NONDFL';
        }
        return strIconName ;
     }



}