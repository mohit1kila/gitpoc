public class ContactAndLeadSearch
{
public static list<list<sobject>> searchContactsAndLeads(string str1)
{
   
    contact objct=new contact();
    objct.lastname='smith';
    objct.firstname=str1;
    objct.email='test@gmail.com';

    insert objct;

   lead objlead=new lead();
   objlead.lastname='smith';
    objlead.Company='abc';
    objlead.firstname=str1;
    insert  objlead;
    
    string str2=str1;
    list<list<sobject>> lst=new list<list<sobject>> ();
   lst=[find  'smith'  IN ALL FIELDS
                               RETURNING contact(lastName,firstname),lead(firstname,LastName)];
    
   
   

return lst;
}
}