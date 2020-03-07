public class CampingListController{
    @auraenabled public static list<Camping_Item__c> getItems()
    {
        
        list<Camping_Item__c> lst=new list<Camping_Item__c>();
        lst= [select id, Name from Camping_Item__c];
        return lst;
    }
    @auraenabled public static void saveItem(Camping_Item__c Item)
    {
        
        insert Item;
    }
}