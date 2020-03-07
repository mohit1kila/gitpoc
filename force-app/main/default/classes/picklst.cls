public class picklst {
public string strPicklist{get;set;}
public list<selectoption> lstSelectoption{get;set;}


@RemoteAction
public static list<selectoption> gtPicklist()
{
list<selectoption> lstSelectoption = new list<selectoption>();
for (account varact: [select id, name from account])
{
lstSelectoption.add(new selectoption(varact.name,varact.name));
}
return lstSelectoption;
}
}