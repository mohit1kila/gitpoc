public class accountctrl 
{
@AuraEnabled
public static list<account> getaccounts() 
{
    list<account> lstact=[SELECT id, name FROM account];
    return lstact;
}
}