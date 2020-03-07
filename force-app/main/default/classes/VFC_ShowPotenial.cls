public class VFC_ShowPotenial {
    public string strname{get;set;}
	public Integer IntanualInvestment{get;set;}
    public Integer Int_Years{get;set;}
    public string strFrequency{get;set;}
    public list<selectoption> lstInvest_Tennure{get;set;}
    public VFC_ShowPotenial()
    {
        lstInvest_Tennure = new list<selectoption>();
        lstInvest_Tennure.add(new selectoption('None','None'));
        lstInvest_Tennure.add(new selectoption('Weekly','Weekly'));
        lstInvest_Tennure.add(new selectoption('Monthly','Monthly'));
        lstInvest_Tennure.add(new selectoption('Yearly','Yearly'));
    }
}