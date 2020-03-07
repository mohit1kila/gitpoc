public class AgentsRegister { 

    public String username {get; private set;}
    public String password {get; private set;}
    public String email {get; private set;}
    public String name {get; private set;}
    public Errors errors {get; set;}

    public AgentsRegister() {

    }

    public AgentsRegister(String username, String email, String name, String password) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.name = name;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }


    public class Errors {

        public List<String>email{get;set;}
        public List<String>password{get;set;}
        public String error_msg {set;
            get {
                String err_tmp='';
                if (email != null && !email.isEmpty()) {
                    err_tmp  += String.join(email, ',')+'\n';
                }

                if (password != null && !password.isEmpty()) {
                    err_tmp  += String.join(password,',')+'\n';
                }

                return err_tmp;
            }
        }
        
    }

}