({
	doInit : function(component, event, helper) {
		var action = component.get("c.getIcon");
	        action.setCallback(this, function(a) {
                if(a.getState()=="SUCCESS")
                {
                    
                     var status = a.getReturnValue();
                    component.set("v.status",status);
                }
           
                });
         $A.enqueueAction(action);
	}
})