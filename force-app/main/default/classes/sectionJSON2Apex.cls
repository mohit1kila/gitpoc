public class sectionJSON2Apex {

    public Section section;

    public class Section {
        public Integer id{get;set;}
        public String url{get;set;}
        public String html_url{get;set;}
        public Integer category_id{get;set;}
        public Integer position{get;set;}
        public String sorting{get;set;}
        public String created_at{get;set;}
        public String updated_at{get;set;}
        public String name{get;set;}
        public String description{get;set;}
        public String locale{get;set;}
        public String source_locale{get;set;}
        public Boolean outdated{get;set;}
    }

    
    public static sectionJSON2Apex parse(String json) {
        return (sectionJSON2Apex) System.JSON.deserialize(json, sectionJSON2Apex.class);
    }
}