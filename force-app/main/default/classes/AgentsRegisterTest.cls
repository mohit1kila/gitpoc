@isTest
private class AgentsRegisterTest {

    @isTest
    static void test() {
        AgentsRegister.Errors ers = new AgentsRegister.Errors();
        ers.email = new List<String>{'email@test.com', 'email2@test.com'};
        ers.password = new List<String>{'pass1', 'pass2'};
        ers.error_msg = 'Test';
        String tmp = ers.error_msg;

        AgentsRegister agetsDTO = new AgentsRegister('username', 'email', 'name', 'password');
        agetsDTO.setUsername('username');
        agetsDTO.setName('name');
        agetsDTO.setEmail('email');
        agetsDTO.setPassword('password');
        agetsDTO.Errors = ers;
        
        AgentsRegister agetsDTO1 = new AgentsRegister();
        System.assertNotEquals(tmp, '');
    }
    
}