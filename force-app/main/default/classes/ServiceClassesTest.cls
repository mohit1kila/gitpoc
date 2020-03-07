@isTest
private class ServiceClassesTest {

    @isTest static void jsonParserUtilTest() {
        String js = '{"obj1":[{"name":"test","lastname":"test"}, {"name":"test1","lastname":"test1"}], "obj2":"test"}';
        Map<String,Object> objs = JSONParserUtil.jsonToMap(js);
        System.assertNotEquals(objs, null);
    }

    @isTest static void restResponseTest() {
        RestResponse res1 = new RestResponse('test.com', '{"field1":"test1", "field2":"test2", "code":"40", "more_info":"test", "status":"100"}', 400);
        RestResponse res2 = new RestResponse('{"field1":"test1", "field2":"test2", "code":"40", "more_info":"test", "status":"100"}', 400);

        String tmp = res1.responseBody;
        res1.setResponseText('{"field1":"test1", "field2":"test2", "code":"40", "more_info":"test", "status":"100"}');

        Integer tmpInt = res1.getHttpStatus();
        res1.setHttpStatus(400);

        tmp = res1.getUrl();
        res1.setUrl('test.com');

        res1.setQueryString('query');
        tmp = res1.getQueryString();

        Boolean b = res1.isError();
        res1.setError(true);
        b = res1.isClientError();
        b = res1.isServerError();
        res1.setContentType('application/json');
        b = res1.isJson();
        b = res1.isXml();

        Map<String, Object> tmpMap = res1.toMap();
        System.assertNotEquals(tmpMap, null);
    }

    @isTest static void restExceptionTest() {
        RestException ex = new RestException('testMessag', 404);
        ex = new RestException('testMessag', 404, 'more info');

        RestResponse res = new RestResponse('test.com', '{"field1":"test1", "field2":"test2", "code":"40", "more_info":"test", "status":"100"}', 400);
        res.setContentType('application/json');
        ex = new RestException(res);
        System.assertNotEquals(ex, null);
    }

}