global with sharing class FlowCreateContact    {
 public FlowCreateContact () {

    }
    public class FlowActionException extends Exception {}
     @InvocableMethod
    public static list<Results> filter(List<Requests> request)
    {
    
    system.debug('@@@@'+request);
     list<contact> lstContact=new list<contact>();
     contact ct=new contact();
     ct.lastName=request[0].Pname;
     ct.Phone=request[0].Phone;
     ct.email=request[0].email;
     ct.recordtypeid=request[0].recordtypeId;
     insert ct;
   /* User[] filteredCollection;
    list<string> stContactid=request[0].targetValuesStringCollection;
    
    list<contact> lstContact=new list<contact>();
    
    
    
    list<User> lstUser= [select id,contactid,Contact.HasOptedOutOfEmail,Contact.LastName,Email,Contact.Email  from user where contactid IN:request[0].targetValuesStringCollection AND Contact.HasOptedOutOfEmail=False];
    
    List<Results> var=new List<Results>();
    Results varrs=new Results();
    varrs.filteredUserCollection= lstUser;
    var.add(varrs);
    
    return var;*/
    return null;
    
    }

    global class Requests {
        @InvocableVariable
        global String Pname;
        
        @InvocableVariable
        global String[] targetValuesStringCollection;
        
        @InvocableVariable
        global String email;
        
        @InvocableVariable
        global String phone;
        
        
        @InvocableVariable
        global String recordtypeId;



    }
    global class Results {
        @InvocableVariable
        global User[] filteredUserCollection;
    }
 
 
 }