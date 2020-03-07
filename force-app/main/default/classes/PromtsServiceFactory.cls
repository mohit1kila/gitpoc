global class PromtsServiceFactory { 

    global static Object create(String className) {
        Type t = Type.forName(className);
        return t.newInstance();
    }

}