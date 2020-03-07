public class AccountHandler
{
public static account  insertNewAccount(string str)
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