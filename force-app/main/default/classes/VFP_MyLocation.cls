public with sharing class VFP_MyLocation {

public list<contact> lstContacts{get;set;}
public list<account> lstAccount{get;set;}
    public VFP_MyLocation(ApexPages.StandardController controller) {
    account accid=(account)controller.getRecord() ;
    lstContacts =new list<contact>();
    lstAccount= [select id, name,(select id, mailingcity,Mailingaddress,mailingstreet,mailingcountry,mailingpostalcode from contacts) from account limit 10 ];
    }



}