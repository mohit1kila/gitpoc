/**
 * @File Name          : AccountHandler.cls
 * @Description        : 
 * @Author             : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Group              : 
 * @Last Modified By   : ChangeMeIn@UserSettingsUnder.SFDoc
 * @Last Modified On   : 7/4/2020, 4:48:25 pm
 * @Modification Log   : 
 * Ver       Date            Author      		    Modification
 * 1.0    7/4/2020   ChangeMeIn@UserSettingsUnder.SFDoc     Initial Version
**/
public class AccountHandler
{
public static account  insertNewAccount(string str)//dummy
{

account act=new account ();

try
{
act.name=str;

insert act;
return act;
}
catch(exception e)
{
system.debug('exception'+e);
return null;
}


}


}