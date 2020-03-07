public class UserConverterUtils { 

    public static List<AgentsRegister> prepareUsersForCallout(List<User> item_list) {
        List<AgentsRegister> transfer_list = new List<AgentsRegister>();

        if (item_list == null) {
            return transfer_list;
        }

        String name = '';
        for (User item : item_list) {
            name = '';
            if (!String.isBlank(item.FirstName)) {
                name = item.FirstName+' ';
            }

            if (!String.isBlank(item.LastName)) {
                name += item.LastName;
            }

            AgentsRegister tmp_obj = new AgentsRegister(item.Username, UserInfo.getOrganizationId() + '_' + item.Email, name, null);
            transfer_list.add(tmp_obj);
        }

        return transfer_list;
    }

}