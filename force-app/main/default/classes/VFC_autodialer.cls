public class VFC_autodialer 
{
public case objCS{get;set;}
Map<string,string> mapParam=new Map<string,string>();
public VFC_autodialer()
{   objCS=new case();
    mapParam=ApexPages.currentPage().getParameters();
    if(mapParam.containskey('id'))
    {
    objCS.accountid=mapParam.get('id');// Setting Customer Id to Case
    }
}

}