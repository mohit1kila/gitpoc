@isTest
public class MockHttpTestResponseGenerator implements HttpCalloutMock {

    protected Integer code;
    protected String status;
    protected String bodyAsString;
    protected Map<String, String> header;


    public MockHttpTestResponseGenerator(Integer code, String status, String body) {
        this.code = code;
        this.status = status;
        this.bodyAsString = body;
    }

    public MockHttpTestResponseGenerator(Integer code, String status, String body, Map<String, String> headerMap) {
        this.code = code;
        this.status = status;
        this.bodyAsString = body;
        this.header = headerMap;
    }

    public HTTPResponse respond(HTTPRequest req) {
        HttpResponse resp = new HttpResponse();
        resp.setStatusCode(code);
        resp.setStatus(status);
        resp.setBody(bodyAsString);
        
        if (header != null && !header.isEmpty()) {
            for (String headerKey : header.keySet()) {
                resp.setHeader(headerKey, header.get(headerKey));
            }
        }

        System.assertNotEquals(null, resp);
        return resp;
    }
    
}