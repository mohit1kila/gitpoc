/**
 * @File Name          : accountctrl.cls
 * @Description        : 
 * @Author             : Mohitsharma.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 1/4/2020, 10:11:38 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    1/4/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class accountctrl 
{
@AuraEnabled
public static list<account> getaccounts() // get list of all accounts
{
    list<account> lstact=[SELECT id, name FROM account];
    return lstact;
}
}