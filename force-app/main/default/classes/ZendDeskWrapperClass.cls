public class ZendDeskWrapperClass {
    
    
    ///////////// Parse AccessPolicy ///////////////
    
    public class Access_policyWrapper
    {
        public Access_policy access_policy{get;set;}
        
      
    }
    
    public class Restricted_to_group_ids {
    }

    public class Access_policy {
        public String viewable_by{get;set;} 
        public String manageable_by{get;set;} 
        public List<Restricted_to_group_ids> restricted_to_group_ids;
        public List<Restricted_to_group_ids> restricted_to_organization_ids{get;set;} 
        public List<Restricted_to_group_ids> required_tags{get;set;} 
    }
     public static Access_policyWrapper parseAccessPolicy(String json) {
        return (Access_policyWrapper) System.JSON.deserialize(json, Access_policyWrapper.class);
    }
    
    
    /////////////////// Parse category //////////////////////
    public class categoriesWrapper
    {
        public cls_categories[] categories{get;set;}
        public Integer page{get;set;}   //
        public Integer per_page{get;set;}   //30
        public Integer page_count{get;set;} //1
        public Integer count{get;set;}  //3
        public String sort_by{get;set;} //position
        public String sort_order{get;set;}  //asc
        public string previous_page{get;set;}
        public string next_page{get;set;}
    }
    class cls_categories {
        public Integer id{get;set;} //201258089
        public String url{get;set;} //https://cloudhooper.zendesk.com/api/v2/help_center/en-us/categories/201258089-General.json
        public String html_url{get;set;}    //https://cloudhooper.zendesk.com/hc/en-us/categories/201258089-General
        public Integer position{get;set;}   //0
        public String created_at{get;set;}  //2016-08-20T19:25:54Z
        public String updated_at{get;set;}  //2016-09-24T13:44:58Z
        public String name{get;set;}    //General
        public String description{get;set;} //
        public String locale{get;set;}  //en-us
        public String source_locale{get;set;}   //en-us
        public boolean outdated{get;set;}
    }

    
    public static categoriesWrapper parseCategoires(String jsonResponse)
    {
        categoriesWrapper objcategoriesWrapper=new categoriesWrapper();
        objcategoriesWrapper= (categoriesWrapper) System.JSON.deserialize(jsonResponse, categoriesWrapper.class);
        return objcategoriesWrapper;
    }
    
    
    
    ///////////////////////////// Section Parsing //////////////
    
    public class SectionWrapper
    {
    public cls_sections[] sections{get;set;}
    public Integer page{get;set;}   //1
    public Integer previous_page{get;set;}
    public string next_page{get;set;}
    public string per_page{get;set;}   //30
    public Integer page_count{get;set;} //1
    public Integer count{get;set;}  //6
    public String sort_by{get;set;} //position
    public String sort_order{get;set;}  //asc
    }
        class cls_sections {
        public Integer id{get;set;} //202683469
        public String url{get;set;} //https://cloudhooper.zendesk.com/api/v2/help_center/en-us/sections/202683469-Cooling-Issue.json
        public String html_url{get;set;}    //https://cloudhooper.zendesk.com/hc/en-us/sections/202683469-Cooling-Issue
        public Integer category_id{get;set;}    //201258089
        public Integer position{get;set;}   //0
        public String sorting{get;set;} //manual
        public String created_at{get;set;}  //2016-09-24T13:44:32Z
        public String updated_at{get;set;}  //2016-09-24T13:44:58Z
        public String name{get;set;}    //Cooling Issue
        public String description{get;set;} //Cooling Issue
        public String locale{get;set;}  //en-us
        public String source_locale{get;set;}   //en-us
        public boolean outdated{get;set;}
    }
    
    
    public static SectionWrapper parseSections(String jsonResponse)
    {
        SectionWrapper objSectionWrapper=new SectionWrapper();
        objSectionWrapper= (SectionWrapper) System.JSON.deserialize(jsonResponse, SectionWrapper.class);
        return objSectionWrapper;
    }


///////////// Article Search Class /////////////////

public class ArticleSearchWrapper
{
    public ArticleWrapper[] results{get;set;}
    public Integer page{get;set;}   //1
    public string previous_page{get;set;}
    public string next_page{get;set;}
    public Integer per_page{get;set;}   //25
    public Integer page_count{get;set;} //1
    public Integer count{get;set;}  //4
    
    
   // public Object previous_page{get;set;}
  //  public Object next_page{get;set;}
   
    
    
}

public  class ArticleWrapper {
        public Integer id{get;set;} //210668929
        public String url{get;set;} //https://cloudhooper.zendesk.com/api/v2/help_center/en-us/articles/210668929-AC-Is-working.json
        public String html_url{get;set;}    //https://cloudhooper.zendesk.com/hc/en-us/articles/210668929-AC-Is-working
        public string author_id{get;set;}   //3791961425
        public boolean comments_disabled{get;set;}
        public String[] label_names{get;set;}
        public boolean draft{get;set;}
        public boolean promoted{get;set;}
        public Integer position{get;set;}   //0
        public Integer vote_sum{get;set;}   //0
        public Integer vote_count{get;set;} //0
        public string section_id{get;set;} //202468069
        public String created_at{get;set;}  //2016-08-20T19:31:29Z
        public datetime updated_at{get;set;}    //2016-08-20T19:31:29Z
        public String name{get;set;}    //AC Is working
        public String title{get;set;}   //AC Is working
        public String body{get;set;}    //<p>When Cabel is unplugged AC is not working.</p>
        public String source_locale{get;set;}   //en-us
        public String locale{get;set;}  //en-us
        public boolean outdated{get;set;}
        public String result_type{get;set;} //article
        public string sortbody{get;set;}
        public String shortdesc{get;set;}
        public Access_policyWrapper objAccessPolicyWrapper{get;set;}
        
    }
    
    public class Label_names {
    }
    
    public static ArticleSearchWrapper parseArticleSearch(String jsonResponse)
    {
        ArticleSearchWrapper objArticleSearchWrapper=new ArticleSearchWrapper();
        objArticleSearchWrapper= (ArticleSearchWrapper) System.JSON.deserialize(jsonResponse, ArticleSearchWrapper.class);
        return objArticleSearchWrapper;
    }
}