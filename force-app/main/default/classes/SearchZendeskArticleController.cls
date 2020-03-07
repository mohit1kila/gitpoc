public class SearchZendeskArticleController {

    public string strSearhData{get;set;}
    public JSON2Apex ZendeskData{get;set;}
    public list<Object> lstArticleData{get;set;}
    public list<clsData> lstData{get;set;}
    public string searchString{get;set;}
    public SearchZendeskArticleController ()
    {
        ZendeskData = new JSON2Apex ();
        lstData = new list<clsData>();
        lstArticleData= new list<JSON2Apex.Results>();
    }
    public PageReference calldata() 
    {
        if(strSearhData!= null && strSearhData!='')
        {
            lstData = new list<clsData>();
            Http h = new Http();
            HttpRequest webReq = new HttpRequest();
            webReq.setMethod('GET');
            string strUser='mohit1kila@gmail.com:hooper001#$';
            webReq.setHeader('Authorization','Basic '+EncodingUtil.base64Encode(Blob.valueof(strUser)));
            //webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/search.json?query=AC');
            webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/search.json?query='+strSearhData);
  
            httpresponse res1=h.send(webReq);
            system.debug('aa>>'+res1.getbody());
            Map<string,Object> MapJsonParseMap = (Map<string,Object>)Json.deserializeUntyped(res1.getbody());
    
            System.debug('@@@++'+MapJsonParseMap.keyset());
            System.debug('@@@++'+MapJsonParseMap.Values());    
            //   list<object>lstResult=MapJsonParseMap.get('results');
    
            Object aa = MapJsonParseMap.get('results');
            list<Object> lst = (list<Object>)aa ;
    
            for( Object var : lst )
            { 
                map<string,object>dataMap=(map<string,object>)var;
                clsData objclsData=new clsData();
                objclsData.strTitle=string.valueof(dataMap.get('title'));
                objclsData.Name=string.valueof(dataMap.get('Name'));
                objclsData.body=string.valueof(dataMap.get('body'));
                objclsData.html_url=string.valueof(dataMap.get('html_url'));
                objclsData.articleId=string.valueof(dataMap.get('id'));
                //lstArticleData.add((JSON2Apex.Results)var);
                lstData.add(objclsData);
            }
            System.debug('>>>>FinalList'+lstData);
            //ZendeskData.results =(list<JSON2Apex.Results>) MapJsonParseMap.get('results');


        }
    return null;
    }
    public  PageReference resetdata()
    {
        lstData= new list<clsData>();
        strSearhData=null;
        return null;
    }
    public class clsData
    {
        public clsData()
        {
        }
        public string Id{get;set;}
        public string strTitle{get;set;}
        public string Name{get;set;}
        public string Body{get;set;}
        public string html_url{get;set;}
        public string articleId{get;set;}

    }
}