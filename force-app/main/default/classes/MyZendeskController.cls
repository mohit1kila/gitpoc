public class MyZendeskController {



    public string strSearhData{get;set;}
    public JSON2Apex ZendeskData{get;set;}
    public list < Object > lstArticleData{get;set;}
    public String myvote{get;set;}

    public MyVoteJSON2Apex votesj{get;set;}
    public list < MyVoteJSON2Apex.Votes > votesobj{get;set;}
    public list < Object > votes{get;set;}
    public voterwapper objvoterwapper{get;set;}

    public fromJSON objJason{get;set;}
    public ZJSON2Apex sectionprivacyJason{get;set;}
    public sectionJSON2Apex sectionJason{get;set;}
    public voteJSON2Apex Votesjson{get;set;}
    public voteJSON2Apex.Votes Votesreturn{get;set;}
    public Integer vote_count{get;set;}
    public Integer positive_vote{get;set;}

    public sectionJSON2Apex.Section sectionDescriptionJason{get;set;}
    public ZJSON2Apex.Access_policy teststring{get;set;}
    public fromJSON.cls_article aart{get;set;}
    public string searchString{get;set;}
    public categoryJSON2Apex categoryJason{get;set;}
    public categoryJSON2Apex.Category categoryDescriptionJason{get;set;}
    public string strTitle{get;set;}
    public string Name{get;set;}
    public string Body{get;set;}
    public string Url{get;set;}
    public string parameterValue{get;set;}
    public string vote{get;set;}
    public Integer sectionid{get;set;}
    public Integer id{get;set;}
    public Integer value{get;set;}
    public DateTime updated_date{get;set;}
    string username = System.Label.zendeskusername;
    string password = System.Label.zendeskpassword;
    //string strUser = username + ':' + password;
    string strUser = 'zendesk@indinero.com' + '/token:' + '0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';

    public map<long,integer>mapVotecount{get;set;}


    public MyZendeskController() {
        parameterValue = ApexPages.currentPage().getParameters().get('code');
        system.debug('parameterValue -->' + parameterValue);
        ZendeskData = new JSON2Apex();
        objvoterwapper = new voterwapper();
        mapVotecount=new  map<long,integer>();

        lstArticleData = new list < JSON2Apex.Results > ();
        /*Http h = new Http();
        HttpRequest webReq = new HttpRequest();
        webReq.setMethod('GET');

        webReq.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(strUser)));
        webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/' + parameterValue + '.json');



        httpresponse res1 = h.send(webReq);*/
        // string strUser = 'zendesk@indinero.com' + '/token:' + '0zfiTbhuoBj8lC2oxNZW4y7hiyTqcZcoM0EZ542m';
      Http h = new Http();
      HttpRequest webReq = new HttpRequest();
        webReq.setMethod('GET');

        webReq.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(strUser)));
        //webReq.setEndpoint('https://support.indinero.com/api/v2/users/me.json');
        webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/articles/' + parameterValue + '.json');
        httpresponse res1 = h.send(webReq);
        system.debug('aa>>' + res1.getbody());



        objJason = (fromJSON) Json.deserialize(string.valueof(res1.getbody()), fromJSON.class);
        aart = objJason.article;

        // Format date

        string dt1 = aart.updated_at;
        string dt2 = dt1.replace('T', ' ');
        string dt3 = dt2.replace('Z', ' ');
        updated_date = datetime.valueof(dt3);

        sectionid = objJason.article.section_id;

       // webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/sections/' + sectionid + '/access_policy.json');
       webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/sections/' + sectionid + '/access_policy.json');
        httpresponse res12 = h.send(webReq);

        sectionprivacyJason = (ZJSON2Apex) Json.deserialize(string.valueof(res12.getbody()), ZJSON2Apex.class);
        teststring = sectionprivacyJason.Access_policy;

        // Fetch section name 
       // webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/sections/' + sectionid + '.json');
       webReq.setEndpoint(' https://support.indinero.com/api/v2/help_center/sections/' + sectionid + '.json');
        
        httpresponse sectiondetails = h.send(webReq);

        sectionJason = (sectionJSON2Apex) Json.deserialize(string.valueof(sectiondetails.getbody()), sectionJSON2Apex.class);
        sectionDescriptionJason = sectionJason.Section;
        Integer cat_id =  sectionJason.Section.category_id;

        // Fetch category information
        //webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/categories/201258089.json');
        webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/categories/'+cat_id+'.json');
        httpresponse categorydetails = h.send(webReq);

        categoryJason = (categoryJSON2Apex) Json.deserialize(string.valueof(categorydetails.getbody()), categoryJSON2Apex.class);
        categoryDescriptionJason = categoryJason.Category;

        // Categories structer
       // webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/categories.json');
        webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/categories.json');
        httpresponse categorylist = h.send(webReq);
        strTitle = categorylist.getbody();
        // Url = 'https://cloudhooper.zendesk.com/hc/en-us/articles/210668929-AC-Is-working';
        // Blob abc = Url.getContent();  

        //Vote results
        //webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/' + parameterValue + '/votes.json');
        webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/articles/' + parameterValue + '/votes.json');
        httpresponse votelist1 = h.send(webReq);
        Votesjson = (voteJSON2Apex) Json.deserialize(string.valueof(votelist1.getbody()), voteJSON2Apex.class);
        vote_count = Votesjson.count;
        positive_vote = Votesjson.count;

        //Vote by me
        //webReq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/users/me/votes.json');
        webReq.setEndpoint('https://support.indinero.com/api/v2/help_center/users/me/votes.json');
        httpresponse votelist = h.send(webReq);
        system.debug('vote body' + votelist.getbody());
        objvoterwapper = (voterwapper) Json.deserialize(votelist.getbody(), voterwapper.class);
        system.debug('objvoterwapper-->' + objvoterwapper);
        if(objvoterwapper!=null && objvoterwapper.votes.size()>0)
        {
        for(votes objvotes: objvoterwapper.votes)
            
            mapVotecount.put(objvotes.user_id,objvotes.value);
        }
        
        myvote = votelist.getbody();

    }


    public PageReference doSearchup() {
        String para1 = objJason.article.id;
        //Post request for vote
        Http p = new Http();
        HttpRequest webReqp = new HttpRequest();
        webReqp.setMethod('POST');

        webReqp.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(strUser)));

        //webReqp.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/' + para1 + '/up.json');
        webReqp.setEndpoint('https://support.indinero.com/api/v2/help_center/articles/' + para1 + '/up.json');
        p.send(webReqp);
        //vote = votelist.getbody();
        return null;
    }

    public PageReference doSearchdown() {
        String para1 = objJason.article.id;

        //Post request for vote
        Http pq = new Http();
        HttpRequest webReqpq = new HttpRequest();
        webReqpq.setMethod('POST');

        webReqpq.setHeader('Authorization', 'Basic ' + EncodingUtil.base64Encode(Blob.valueof(strUser)));

        //webReqpq.setEndpoint('https://cloudhooper.zendesk.com/api/v2/help_center/articles/' + para1 + '/down.json');
        webReqpq.setEndpoint('https://support.indinero.com/api/v2/help_center/articles/' + para1 + '/down.json');
        pq.send(webReqpq);
        // vote = votelist.getbody();

        //vote =  'https://cloudhooper.zendesk.com/api/v2/help_center/articles/'+para1+'/down.json';    
        return null;
    }

    public class voterwapper {
        public List < Votes > votes{get;set;}
        public Integer page{get;set;}
        public Integer previous_page{get;set;}
        public Integer next_page{get;set;}
        public Integer per_page{get;set;}
        public Integer page_count{get;set;}
        public Integer count;
    }

    public class Votes {
        public Integer id{get;set;}
        public String url{get;set;}
        public Long user_id{get;set;}
        public Integer value{get;set;}
        public Integer item_id{get;set;}
        public String item_type{get;set;}
        public String created_at{get;set;}
        public String updated_at{get;set;}
    }

}