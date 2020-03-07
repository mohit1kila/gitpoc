@isTest
private class UserConverterUtilsTest {

    @isTest static void test_userConverterUtils() {
        List<User> usrs = [
            SELECT Id, FirstName, LastName, Username, Email 
            FROM USER 
            LIMIT 10
        ];

        List<AgentsRegister> res = UserConverterUtils.prepareUsersForCallout(usrs);
        System.assertNotEquals(res, null);
    }
    
}