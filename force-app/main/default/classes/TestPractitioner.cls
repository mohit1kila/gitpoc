@RestResource(urlMapping='/TestPractitioner/*')
global class TestPractitioner  
{
    @HttpPost
    global static ResponseWrapper doPost() 
    {
       ResponseWrapper objRes=new ResponseWrapper();
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('req -->'+req);
        system.debug('res -->'+res);
       objRes.statusCode='200';
       objRes.Message='Request Process Successfully';
       return objRes;
       
       
        
    }
    global class ResponseWrapper
    {
        public string statusCode{get;set;}
        public string Message{get;set;}
    }
}