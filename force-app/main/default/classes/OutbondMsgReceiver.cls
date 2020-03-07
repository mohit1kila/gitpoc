@RestResource(urlMapping='/OutbondMsgReceiver/*')
global class OutbondMsgReceiver
{
    @HttpPost
    global static void doPost() 
    {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        system.debug('req -->'+req.requestbody.tostring().replace('sf:',''));
        system.debug('res -->'+res);
       System.debug('Params: ' + req.params);
        string strResponse='<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Body>'+
                      '<notificationsResponse xmlns="http://soap.sforce.com/2005/09/outbound"><Ack>true</Ack>'+
                      '</notificationsResponse></soapenv:Body></soapenv:Envelope>';
        
        res.responsebody=blob.valueof(strResponse);
        Dom.Document doc = new Dom.Document();
       doc.load(req.requestBody.toString());
      list<Dom.XMLNode> ordDtls = doc.getRootElement().getChildElement('Body','http://schemas.xmlsoap.org/soap/envelope/').getChildElements()[0].getChildElements();
     System.debug('@@@@'+ordDtls[0]);
     string strsessionId='';
     string straccountid='';
    for(Dom.XMLNode var:ordDtls )
     {
     if('SessionId'==var.getName())
     {
     strsessionId= var.getText();
     system.debug('>>>>>'+strsessionId);
     }
     if('Notification'==var.getName())
     {
       //for(Dom.XMLNode varxml:var.getChildElements()[0])
        
         system.debug('>>>>>aa'+var.getChildElements()[0].getName());
         system.debug('>>>>>aa'+var.getChildElements()[1].getChildElements()[0]);
           //for(Dom.XMLNode varxml:var.getChildElements()[1].getChildElements()[0].getChildElements()[0])
           {
               system.debug('>>>>>Accountid'+var.getChildElements()[1].getChildElements()[0].getName());
    straccountid= var.getChildElements()[1].getChildElements()[0].getText();
    
             
             //if('Id' == varxml.getName())
             {
            // straccountid= var.getText();
             }
           }
       
    
   
    }
     
     
     
     }
     system.debug('>>>>>Accountid'+straccountid);
    system.debug('>>>>>sessionId'+strsessionId);
    
    Http h = new Http();
    HttpRequest webReq = new HttpRequest();
    webReq.setMethod('GET');
    webReq.setHeader('Authorization','Bearer '+strsessionId);
    webReq.setEndpoint('https://cs18.salesforce.com/services/apexrest/getAccount?AccountId='+straccountid);
  
    httpresponse res1=h.send(webReq);
    /*Map<string,Object> MapJsonParseMap= (Map<string,Object>)Json.deserializeUntyped(res1.getbody());
    
    System.debug('@@@++'+MapJsonParseMap.keyset());
    System.debug('@@@++'+MapJsonParseMap.Values());*/
    System.debug('444'+res1.getbody());
    JSON2Apex PatientData= (JSON2Apex )JSON.deserialize(res1.getbody(), JSON2Apex.class);
    System.debug('@@@@@PatientData'+PatientData.accountDetails[0].AccountDetail);
    
    
    Account actPatient= New account();
    actPatient.accountNumber=PatientData.accountDetails[0].AccountDetail.SFDCID;
    actPatient.Name=PatientData.accountDetails[0].AccountDetail.Name;
    actPatient.description=res1.getbody();
    Insert actPatient;
    list<contact> ContactList= new List<Contact>();
   if(PatientData.accountDetails[0].ListChild.size()>0)
    {
        
        
        for(integer i=0;i<PatientData.accountDetails[0].ListChild.size();i++)
        {
            
            for(integer j=0;j<PatientData.accountDetails[0].ListChild[i].ListChildDetails.size();j++)
            {
                Contact ct= new contact();
                ct.accountid =actPatient.id;
                ct.LastName =PatientData.accountDetails[0].ListChild[i].ListChildDetails[j].ChildDetails.LastName;
                   if(ct.LastName !=null)
                    {
                      
                      ContactList.add(ct);
                    }
            }
        }
        
    }
    
   
   if(ContactList.size()>0)
   {   Http httpSuccessFailure = new Http();
       try
       {
             insert ContactList;
             sendresponse('Success',straccountid,strsessionId);
             /*HttpRequest SuccessService = new HttpRequest();
            
             SuccessService.setHeader('Authorization','Bearer '+strsessionId);
             SuccessService.setEndpoint('https://cs18.salesforce.com/services/apexrest/getAccount');
             
             SuccessService.setBody('{"AccountStatus":{"AccountId":"'+straccountid+'","Status":"Success","ErrorDescription":""}}' );*/
            // httpresponse SuccessResponse= httpSuccessFailure.send(SuccessService ) ;
             //system.debug('ErrorResponse >>>'+SuccessResponse.getbody());
         }
         catch(exception e)
         {
         
           sendresponse('Error',straccountid,strsessionId);
             /*HttpRequest ErrorService = new HttpRequest();
             ErrorService.setMethod('Post');
             ErrorService.setHeader('Authorization','Bearer '+strsessionId);
             ErrorService.setEndpoint('https://cs18.salesforce.com/services/apexrest/getAccount');
             ErrorService.setBody('{"AccountStatus":{"AccountId":"'+straccountid+'","Status":"Error","ErrorDescription":""}}' );
            // httpresponse ErrorResponse = httpSuccessFailure.send(ErrorService) ;*/
         //system.debug('ErrorResponse >>>'+ErrorResponse.getbody());
         }
   }
       
}
@Future(callout=true)
public static void sendresponse(string strMessage,string strACCID,String strsessionId)
{ Http httpSuccessFailure = new Http();
           HttpRequest ErrorService = new HttpRequest();
             ErrorService.setMethod('POST');
             ErrorService.setHeader('Content-Type', 'application/json'); 
             ErrorService.setHeader('Authorization','Bearer '+strsessionId);
             ErrorService.setEndpoint('https://cs18.salesforce.com/services/apexrest/getAccount');
             ErrorService.setBody('{"AccountStatus":{"AccountId":"'+strACCID+'","Status":"'+strMessage+'","ErrorDescription":""}}' );
            httpresponse ErrorResponse = httpSuccessFailure.send(ErrorService) ;
         system.debug('ErrorResponse >>>'+ErrorResponse.getbody());

}
}