public with sharing class KBController {    
   public List<FAQ__kav> articles {get; set;}       

    public KBController() {       
       articles = [select knowledgearticleid, id, title, icoder__Content__c from FAQ__kav where 
      publishstatus = 'Online' and language='en_US' order by lastpublisheddate];    
   }
}