global class PromtsServiceResponse { 

    global List<Message> suggestions {get; private set;}
    public List<Message> templates {get; private set;}
    public Post message {get; private set;}
    public ConfidenceLevel meta {get; private set;}
    public List<String> errors { get; private set; }

    public PromtsServiceResponse() {
        suggestions = new List<Message>();
        templates = new List<Message>();
    }

    public void setSuggestions(List<Message> message_list) {
        suggestions = message_list;
    }

    public void setMeta(ConfidenceLevel level) {
        this.meta = level;
    }

    public void setTemplates(List<Message> message_list) {
        templates = message_list;
    }

    public void setMessage(Post aMessage) {
        message = aMessage;
    }

    public void setErrors(List<String> errors) {
        this.errors = errors;
    }

    public class ConfidenceLevel {
    
        public Decimal confidence_level{get;set;}

    }

    global class Message {

        global String text {get; set;}
        global String title {get; set;}
        public Integer id {get; set;}
        public Integer sid {get; set;}
        global Decimal probability {
            get;
            set{
                if (value == null) {
                    probability = null;
                } else {
                    probability = Integer.valueOf(Double.valueOf(value) * 100);
                }
            }
        }
    }

    public class Post {

        public String id {get; set;}

    }
  
}