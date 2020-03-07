public class ZendDeskSearch_clone1
{
    public string zendeskUserName{get;set;}
    public String zendDeskPassword{get;set;}
    public string zendeskSubDomain{get;set;}
    public String SearchStiring{get;set;}
    public Boolean isdiaplyResult {get;set;}
    public ZendDeskWrapperClass.ArticleSearchWrapper objArticleSearchWrapper{get;set;}
    
    /**
     * will be used to store section ids of result
     */
     public map<Integer,ZJSON2Apex.Access_policy> mapAccessPolicy {get;set;}
    
    public ZendDeskSearch_clone1()
    {
        zendeskUserName='mohit1kila@gmail.com';
        zendDeskPassword='hooper001#$';
        zendeskSubDomain='cloudhooper';
        
        mapAccessPolicy = new map<Integer,ZJSON2Apex.Access_policy>();
    }
    
    public void SearchZenDesk()
    {
        if(SearchStiring!='' && SearchStiring.trim()!='')
        {
           
            String encodedString = '"'+SearchStiring+'"';
            encodedString = EncodingUtil.urlEncode(encodedString,'UTF-8');
            objArticleSearchWrapper = new ZendDeskWrapperClass.ArticleSearchWrapper ();
            string strUser=zendeskUserName+':'+zendDeskPassword;
            
            Http h = new Http();
            HttpRequest webReq = new HttpRequest();
            webReq.setMethod('GET');
            string Endpointurl='https://'+zendeskSubDomain+'.zendesk.com/api/v2/help_center/articles/search.json?query='+encodedString;
            webReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueof(strUser)));
            webReq.setEndpoint(Endpointurl);
            httpresponse res1=h.send(webReq);
            system.debug('aa>>'+res1.getbody());   
            
            objArticleSearchWrapper = ZendDeskWrapperClass.parseArticleSearch(res1.getbody());
            for(ZendDeskWrapperClass.ArticleWrapper objArticleWrapper :objArticleSearchWrapper.results)
            {
                string longbody = objArticleWrapper.body;
                longbody = longbody.replace('\u003cp\u003e','');
                longbody = longbody.replace('\u003c/p\u003e','');
                if(longbody.length() > 100){
                    objArticleWrapper.shortdesc = longbody.substring(0,100)+'...';
                }
                else{
                    objArticleWrapper.shortdesc = longbody;
                }
            }
            if(objArticleSearchWrapper.Count > 0){
                isdiaplyResult = true;
                
                /**
                 * loop for getting setiond ids
                 */
                 for(ZendDeskWrapperClass.ArticleWrapper aw : objArticleSearchWrapper.results){
                     mapAccessPolicy.put(aw.section_id,null);
                 }
                 system.debug('\n--mapAccessPolicy--'+mapAccessPolicy);
                 
                 /**
                  * if we have section ids making callout for each section id
                  */
                 if(!mapAccessPolicy.isEmpty()){
                    for(integer sectionid : mapAccessPolicy.keySet()){
                        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/sections/' + sectionid + '/access_policy.json');
                        httpresponse resSection = h.send(webReq); 
                        ZJSON2Apex sectionprivacyJason = (ZJSON2Apex) Json.deserialize(string.valueof(resSection.getbody()), ZJSON2Apex.class);
                        
                        // saving Access_policy
                        mapAccessPolicy.put(sectionid,sectionprivacyJason.Access_policy);
                    }
                 }
                 system.debug('\n--mapAccessPolicy-79-'+mapAccessPolicy);
                
                
            }
            else {
                isdiaplyResult = false;
            }
            
        }
    }
}