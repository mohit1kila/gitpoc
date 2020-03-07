public interface IPromtsRemoteService { 

    Boolean logInUserAndUpdateToken();
    Boolean requestPromptDataByQuery(String query, String network_type, Type class_type, String message_id);
    Boolean updateCustomSettingsObject();
    //String getMostRatedPromt(Type class_type);

}