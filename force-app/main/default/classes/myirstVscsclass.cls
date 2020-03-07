public with sharing class myirstVscsclass {
    @AuraEnabled(cacheable=true)
    public static list<contact> lwcmethod(){
        List<contact> contacts = new List<contact>();
    return contacts=[select id,lastName,firstName from contact limit 10];
    }
    public myirstVscsclass() {
    List<account> accc = new List<account>();
    accc=[select id,name from account where Name='test'];


    }
}