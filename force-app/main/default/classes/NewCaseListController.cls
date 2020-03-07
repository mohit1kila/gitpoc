public class NewCaseListController {
public list<Case> getNewCases()
{
list<case> lstCase=new list<Case>();
lstCase=[select id, Casenumber from Case where status='new'];
return lstCase;
}
}