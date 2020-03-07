public class MyPageController1 {

    public string pageHTML{get;set;}
    public string strSearhData{get;set;}
    public JSON2Apex ZendeskData{get;set;}
    public list<Object> lstArticleData{get;set;}
    public fromJSON objJason {get;set;}
    public ZJSON2Apex sectionprivacyJason {get;set;}
    public sectionJSON2Apex sectionJason {get;set;}
    public sectionJSON2Apex.Section sectionDescriptionJason {get;set;}
    public ZJSON2Apex.Access_policy teststring{get;set;}
    public fromJSON.cls_article aart{get;set;}
    public string searchString{get;set;}
    public categoryJSON2Apex categoryJason {get;set;}
    public categoryJSON2Apex.Category categoryDescriptionJason {get;set;}
    public string strTitle{get;set;}
    public string Name{get;set;}
    public string Body{get;set;}
    public string  parameterValue{get;set;}
    public Integer sectionid{get;set;}
    
    public list<account> getAccounts()
    {
        
        list<account> lstacc=new list<account>();
        lstacc = [select id,Name from account];
        
        
        return lstacc;
        
    }
    public MyPageController1 ()
    {/*
        pageHTML = '';
        parameterValue = ApexPages.currentPage().getParameters().get('code');
        system.debug('parameterValue -->'+parameterValue );
        ZendeskData = new JSON2Apex ();
        lstArticleData= new list<JSON2Apex.Results>();
        Http h = new Http();
        HttpRequest webReq = new HttpRequest();
        webReq.setMethod('GET');
        string strUser='mohit1kila@gmail.com:hooper001#$';
        webReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueof(strUser)));    
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/'+parameterValue +'.json');
        httpresponse res1=h.send(webReq);
        system.debug('aa>>'+res1.getbody());    
        objJason = (fromJSON )Json.deserialize(string.valueof(res1.getbody()),fromJSON.class );
        aart = objJason.article;
        sectionid = objJason.article.section_id;
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/sections/'+sectionid+'/access_policy.json');
        httpresponse res12=h.send(webReq);
        sectionprivacyJason = (ZJSON2Apex)Json.deserialize(string.valueof(res12.getbody()),ZJSON2Apex.class );
        teststring = sectionprivacyJason.Access_policy;
        
        // Fetch section name 
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/sections/'+sectionid+'.json');
        httpresponse sectiondetails=h.send(webReq);     
        sectionJason = (sectionJSON2Apex)Json.deserialize(string.valueof(sectiondetails.getbody()),sectionJSON2Apex.class );
        sectionDescriptionJason = sectionJason.Section;
        
        // Fetch category information
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/categories/201258089.json');
        httpresponse categorydetails=h.send(webReq);    
        categoryJason = (categoryJSON2Apex)Json.deserialize(string.valueof(categorydetails.getbody()),categoryJSON2Apex.class );
        categoryDescriptionJason = categoryJason.Category;
    
        // Categories structer
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/categories.json');
        httpresponse categorylist=h.send(webReq);
        strTitle = categorylist.getbody();
        
        
        // code to get html url     
        webReq.setEndpoint(aart.url);
        httpresponse articleDetails = h.send(webReq); 
        system.debug('\n--aart--'+aart);
        ResponseClass objWrapper = (ResponseClass)Json.deserialize(string.valueof(articleDetails.getbody()),ResponseClass.class );
        system.debug('\n--objWrapper--'+objWrapper);
        
        // get html
        webReq.setEndpoint(objWrapper.article.html_url);
        httpresponse arcticlehtml = h.send(webReq);  
        pageHTML = arcticlehtml.getbody();
        
        */
    }
    
    public class ResponseClass{
        public ResponseChild article{get;set;}
    }
    
    public class ResponseChild{
        public string html_url{get;set;}
    }


}