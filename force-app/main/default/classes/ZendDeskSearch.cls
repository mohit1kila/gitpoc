public class ZendDeskSearch
{
    public string zendeskUserName{get;set;}
    public String zendDeskPassword{get;set;}
    public string zendeskSubDomain{get;set;}
    public String SearchStiring{get;set;}
    public Boolean isdiaplyResult {get;set;}
    public ZendDeskWrapperClass.ArticleSearchWrapper objArticleSearchWrapper{get;set;}
    public string searchtringResponse{get;set;}
    public ParseXMLBody objParseXMLBody{get;set;}
    
    /**
     * will be used to store section ids of result
     */
     public map<Integer,ZJSON2Apex.Access_policy> mapAccessPolicy {get;set;}
    
    //public ZendDeskSearch()
   // {
   //    zendeskUserName='mohit1kila@gmail.com';
   //    zendDeskPassword='hooper001#$';
   //    zendeskSubDomain='cloudhooper';
        
     //   zendeskUserName='http://zendesk@indinero.com';
      //  zendDeskPassword='0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';
     //   zendeskSubDomain='https://support.indinero.com/';
        
     //   mapAccessPolicy = new map<Integer,ZJSON2Apex.Access_policy>();
   // }
    // mapAccessPolicy = new map<Integer,ZJSON2Apex.Access_policy>();
    public void SearchZenDesk()
    {
        if(SearchStiring!='' && SearchStiring.trim()!='')
        {
           
            String encodedString = '"'+SearchStiring+'"';
            encodedString = EncodingUtil.urlEncode(encodedString,'UTF-8');
            set<string>setSectionId=new  set<string>();
            
            objArticleSearchWrapper = new ZendDeskWrapperClass.ArticleSearchWrapper ();
           // string strUser=zendeskUserName+':'+zendDeskPassword;
            string strUser = 'zendesk@indinero.com' + '%2Ftoken:' + '0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';
            Http h = new Http();
            HttpRequest webReq = new HttpRequest();
            webReq.setMethod('GET');
            // string Endpointurl='https://'+zendeskSubDomain+'.zendesk.com/api/v2/help_center/articles/search.json?query='+encodedString;
           string Endpointurl='https://support.indinero.com/api/v2/help_center/articles/search.json?query='+encodedString+'&order_by=created_at&sort=desc';
           //  string Endpointurl='https://support.indinero.com/api/v2/search.json?query='+encodedString+'&type=article&order_by=updated_at&sort=desc&per_page=5';
            webReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueof(strUser)));
            webReq.setEndpoint(Endpointurl);
            httpresponse res1=h.send(webReq);
            system.debug('aa>>'+res1.getbody());   
            searchtringResponse=res1.getbody();
            
            system.debug('searchtringResponse-->'+searchtringResponse);
            objArticleSearchWrapper = ZendDeskWrapperClass.parseArticleSearch(res1.getbody());
            for(ZendDeskWrapperClass.ArticleWrapper objArticleWrapper :objArticleSearchWrapper.results)
            {
                ParseXMLBody objParseXMLBody=new ParseXMLBody();
                setSectionId.add(objArticleWrapper.section_id);
                string longbody = objArticleWrapper.body;
                longbody=longbody.replace('\u003c','<').replace('\u003e','>').replace('\n','').replace('\"','"');
                longbody='<html>'+longbody+'</html>';
                system.debug('longbody=='+longbody);
                string parsebody=objParseXMLBody.ParseXML(SearchStiring,longbody);
                system.debug('parsebody-->'+parsebody);
                if(parsebody.length() > 100){
                    objArticleWrapper.shortdesc = parsebody.substring(0,100)+'...';
                }
                else{
                    objArticleWrapper.shortdesc = parsebody;
                }
                
                // condition to remove space from start
                 objArticleWrapper.shortdesc = objArticleWrapper.shortdesc.trim();
                 
                 // code to remove "." from begnining
                 system.debug('\n--objArticleWrapper.shortdesc.charAt(0)--'+objArticleWrapper.shortdesc.charAt(0)+'\n----'+objArticleWrapper.shortdesc);
                 if(objArticleWrapper.shortdesc.charAt(0) == 46){
                     objArticleWrapper.shortdesc = objArticleWrapper.shortdesc.substring(1,objArticleWrapper.shortdesc.length());
                 }
            }
            if(objArticleSearchWrapper.count > 0){
                
                 map<string,ZendDeskWrapperClass.Access_policyWrapper>mapAccessPolicy=getSectionAccess(setSectionId);
                 for(ZendDeskWrapperClass.ArticleWrapper objArticleWrapper :objArticleSearchWrapper.results)
                 {
                     if(mapAccessPolicy!=null && mapAccessPolicy.containskey(objArticleWrapper.section_id))
                     {
                         objArticleWrapper.objAccessPolicyWrapper = mapAccessPolicy.get(objArticleWrapper.section_id);
                     }
                 }
                 
                 
                isdiaplyResult = true;
                
            
            }
            else {
            isdiaplyResult = false;
            
        }
    }
    }
    
    public void zendeskonload()
    {
        set<string>setSectionId_onload=new  set<string>();
            
            objArticleSearchWrapper = new ZendDeskWrapperClass.ArticleSearchWrapper ();
           // string strUser=zendeskUserName+':'+zendDeskPassword;
            string strUser_onload = 'zendesk@indinero.com' + '%2Ftoken:' + '0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';
            Http h_onload = new Http();
            HttpRequest webReq_onload = new HttpRequest();
            webReq_onload.setMethod('GET');
            // string Endpointurl='https://'+zendeskSubDomain+'.zendesk.com/api/v2/help_center/articles/search.json?query='+encodedString;
           string Endpointurl_onload='https://support.indinero.com/api/v2/help_center/articles/search.json?query=*&order_by=created_at&sort=desc&per_page=5';
           //  string Endpointurl='https://support.indinero.com/api/v2/search.json?query='+encodedString+'&type=article&order_by=updated_at&sort=desc&per_page=5';
            webReq_onload.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueof(strUser_onload)));
            webReq_onload.setEndpoint(Endpointurl_onload);
            httpresponse res1_onload=h_onload.send(webReq_onload);
            system.debug('aa>>'+res1_onload.getbody());   
            searchtringResponse=res1_onload.getbody();
            
            system.debug('searchtringResponse-->'+searchtringResponse);
            objArticleSearchWrapper = ZendDeskWrapperClass.parseArticleSearch(res1_onload.getbody());
            for(ZendDeskWrapperClass.ArticleWrapper objArticleWrapper :objArticleSearchWrapper.results)
            {
                ParseXMLBody objParseXMLBody=new ParseXMLBody();
                setSectionId_onload.add(objArticleWrapper.section_id);
                string longbody = objArticleWrapper.body;
                longbody=longbody.replace('\u003c','<').replace('\u003e','>').replace('\n','').replace('\"','"');
                longbody='<html>'+longbody+'</html>';
                system.debug('longbody=='+longbody);
                string parsebody_load=objParseXMLBody.ParseXML('*',longbody);
                system.debug('parsebody-->'+parsebody_load);
                if(parsebody_load.length() > 100){
                    objArticleWrapper.shortdesc = parsebody_load.substring(0,100)+'...';
                }
                else{
                    objArticleWrapper.shortdesc = parsebody_load;
                }
                
                // condition to remove space from start
                 objArticleWrapper.shortdesc = objArticleWrapper.shortdesc.trim();
                 
                 // code to remove "." from begnining
                 system.debug('\n--objArticleWrapper.shortdesc.charAt(0)--'+objArticleWrapper.shortdesc.charAt(0)+'\n----'+objArticleWrapper.shortdesc);
                 if(objArticleWrapper.shortdesc.charAt(0) == 46){
                     objArticleWrapper.shortdesc = objArticleWrapper.shortdesc.substring(1,objArticleWrapper.shortdesc.length());
                 }
            }
            if(objArticleSearchWrapper.count > 0){
                
                 map<string,ZendDeskWrapperClass.Access_policyWrapper>mapAccessPolicy=getSectionAccess(setSectionId_onload);
                 for(ZendDeskWrapperClass.ArticleWrapper objArticleWrapper :objArticleSearchWrapper.results)
                 {
                     if(mapAccessPolicy!=null && mapAccessPolicy.containskey(objArticleWrapper.section_id))
                     {
                         objArticleWrapper.objAccessPolicyWrapper = mapAccessPolicy.get(objArticleWrapper.section_id);
                     }
                 }
                 
                 
                isdiaplyResult = true;
                
            
            }
            }
    
    public map<string,ZendDeskWrapperClass.Access_policyWrapper> getSectionAccess(set<string>setSectionId)
    {
        
         map<string,ZendDeskWrapperClass.Access_policyWrapper> mapAccessPolicy=new map<string,ZendDeskWrapperClass.Access_policyWrapper>();
        string strUser = 'zendesk@indinero.com' + '/token:' + '0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';
        Http h = new Http();
        HttpRequest webReq = new HttpRequest();
        webReq.setMethod('GET');
        webReq.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(strUser)));
        for(string sectionid:  setSectionId)
        {
            webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/sections/' + sectionid + '/access_policy.json');
            httpresponse res12 = h.send(webReq);
            ZendDeskWrapperClass.Access_policyWrapper objAccess_policyWrapper =ZendDeskWrapperClass.parseAccessPolicy(res12.getbody());
            mapAccessPolicy.put(sectionid,objAccess_policyWrapper);

        }
        
        return mapAccessPolicy;
              

    }
}