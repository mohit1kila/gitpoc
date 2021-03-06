//
// Generated by JSON2Apex http://json2apex.herokuapp.com/
//

public class voteJSON2Apex {

    public List<Votes> votes;
    public Integer page;
    public Object previous_page;
    public Object next_page;
    public Integer per_page;
    public Integer page_count;
    public Integer count{get;set;}

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

    
    public static voteJSON2Apex parse(String json) {
        return (voteJSON2Apex) System.JSON.deserialize(json, voteJSON2Apex.class);
    }
}