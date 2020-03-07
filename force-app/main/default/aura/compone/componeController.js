({
	fireApplicationEvent : function(component, event, helper) {
       
       
       // Application Event
         var appEvent = $A.get("e.c:levent");
        appEvent.setParams({
            "message" : "An application event fired me. " +
            "It all happened so fast. Now, I'm everywhere!" });
        appEvent.fire();
        
        /*var cmpEvent = component.getEvent("cmpEvent");
        appEvent.setParams({
            "message" : "An application event fired me. " +
            "It all happened so fast. Now, I'm everywhere!" });
        appEvent.fire();*/
        
	}
})