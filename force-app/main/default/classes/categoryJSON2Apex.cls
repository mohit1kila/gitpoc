public class categoryJSON2Apex {

    public class Category {
        public Integer id{get;set;}
        public String url{get;set;}
        public String html_url{get;set;}
        public Integer position{get;set;}
        public String created_at{get;set;}
        public String updated_at{get;set;}
        public String name{get;set;}
        public String description{get;set;}
        public String locale{get;set;}
        public String source_locale{get;set;}
        public Boolean outdated{get;set;}
    }

    public Category category;

    
    public static categoryJSON2Apex parse(String json) {
        return (categoryJSON2Apex) System.JSON.deserialize(json, categoryJSON2Apex.class);
    }
}