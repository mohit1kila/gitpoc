({
	handleComponentEvent : function(component, event, helper) {
       
         var message = event.getParam("message");
          alert(message);
        // set the handler attributes based on event data
        component.set("v.component_event_message", message);
       /* var numEventsHandled = parseInt(component.get("v.numEvents")) + 1;
        component.set("v.numEvents", numEventsHandled);*/
		
	}
})