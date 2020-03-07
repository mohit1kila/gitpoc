({
	fireChildEvent : function(component, event, helper) {
        
        var cmpEvent = component.getEvent("compevent");
        cmpEvent.setParams({
            "message" : "An application event fired me. " +
            "Called from Parent Child" });
     
        cmpEvent.fire();
	},
   
    handlechild : function(component, event, helper) {
         var message = event.getParam("message");
          
        // set the handler attributes based on event data
        component.set("v.variableInChild", message);
    }
})