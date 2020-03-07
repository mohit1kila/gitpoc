public class RandomContactFactory
{
    public static list<contact> generateRandomContacts( integer n,string strLastName)
    {
    list<contact> lstContact = new list<contact>();
    
    for(integer i=0;i< n;i++)
    {
    contact ct=new contact(lastname=strLastName ,firstname=strLastName+string.valueof(i));
    lstContact .add(ct);
    }
    
    return lstContact ;
    }
}