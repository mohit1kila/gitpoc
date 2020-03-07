({
  createItem : function(component, item) {
        var theitems = component.get("v.items");
 
        var newitem = JSON.parse(JSON.stringify(item));
 
        theitems.push(newitem);
        component.set("v.items", theitems);
        
        component.set("v.newItem",{ 'sobjectType': 'Camping_Item__c','Name': '','Quantity__c': 0,
                    'Price__c': 0,'Packed__c': false });
    }
    	/*getCampingItem : function() {
        
         // Load all contact data
        var action = cmp.get("c.getCamping");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (cmp.isValid() && state === "SUCCESS") {
                cmp.set("v.contacts", response.getReturnValue());
            }

            // Display toast message to indicate load status
            var toastEvent = $A.get("e.force:showToast");
            if (state === 'SUCCESS'){
                toastEvent.setParams({
                    "title": "Success!",
                    "message": " Your contacts have been loaded successfully."
                });
            }
            else {
                toastEvent.setParams({
                        "title": "Error!",
                        "message": " Something has gone wrong."
                });
            }
            toastEvent.fire();
        });
         $A.enqueueAction(action);
		
	}*/
})