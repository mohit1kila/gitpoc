public class myapicalingcontroller {
    
    @future(callout=true)
    public static void callapi(string idd)
    { if(!system.isFuture())
        {
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
         system.debug('>>>>>'+system.isFuture());
       
                //sif (response.getstatus() == 'OK') 
                {
                    // Deserialize the JSON string into collections of primitive data types.
                    Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
                    // Cast the values in the 'animals' key as a list
                    List<Object> animals = (List<Object>) results.get('animals');
                    System.debug('Received the following animals:');
                    for (Object animal: animals) {
                        System.debug(animal);   
                    }
                   
                     system.debug('>>>>>Idd'+Idd);
                  
                    account act= new account(id=idd);
                    system.debug('@@@'+string.valueof(animals[0]));
                    act.name = string.valueof(animals[0]);
                    update act;
             }
            }
      }
    

}