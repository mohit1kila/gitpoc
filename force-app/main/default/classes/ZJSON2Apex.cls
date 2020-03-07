public class ZJSON2Apex {
    public Access_policy policy{get;set;}

    public class Restricted_to_group_ids {
    }

    public Access_policy access_policy;

    public class Access_policy {
        public String viewable_by{get;set;} 
        public String manageable_by{get;set;} 
        public List<Restricted_to_group_ids> restricted_to_group_ids;
        public List<Restricted_to_group_ids> restricted_to_organization_ids{get;set;} 
        public List<Restricted_to_group_ids> required_tags{get;set;} 
    }

    
    public static ZJSON2Apex parse(String json) {
        return (ZJSON2Apex) System.JSON.deserialize(json, ZJSON2Apex.class);
    }
}