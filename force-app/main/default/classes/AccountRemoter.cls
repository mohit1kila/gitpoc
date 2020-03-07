global with sharing class AccountRemoter {
 
    public String accountName { get; set; }
    public static List<Account> accountList{ get; set; }
     
    //Remote Function
    @RemoteAction
    global static List<Account> getAccount(String accountName) {
     
        string tempName = '\'%' + accountName + '%\' ';
        String query = 'SELECT Id, Name, Phone, Active__c FROM Account WHERE Name like' + tempName;
        accountList = Database.Query(query);
         
        return accountList;
    }
}