@isTest
private class PromtsServiceResponseTest {

    @isTest static void test_promtsServiceResponse() {
        PromtsServiceResponse.Message mes = new PromtsServiceResponse.Message();
        mes.text = '';
        mes.title = '';
        mes.probability = 10;
        mes.id = 1;

        PromtsServiceResponse.Post post = new PromtsServiceResponse.Post();
        post.id = '1';

        PromtsServiceResponse.ConfidenceLevel conf = new PromtsServiceResponse.ConfidenceLevel();
        conf.confidence_level = 10;

        String er1; 
        String er2;

        PromtsServiceResponse resp = new PromtsServiceResponse();
        resp.setSuggestions(new List<PromtsServiceResponse.Message>{mes});
        resp.setMeta(conf);
        resp.setTemplates(new List<PromtsServiceResponse.Message>{mes});
        resp.setMessage(post);
        resp.setErrors(new List<String>{er1, er2});
        System.assertNotEquals(null, resp);
    }
    
}