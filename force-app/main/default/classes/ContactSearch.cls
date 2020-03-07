public class ContactSearch
{
public static list<contact> searchForContacts(string strlstname,string strpostalcode)
{

list<contact> lstcontact=new list<contact>();
lstcontact=[select id,name from contact where (lastname=:strlstname and MailingPostalCode=:strpostalcode)];

return lstcontact;
}


}