({
doInit: function(component, event, helper) {
    var action = component.get("c.getItems");
    action.setCallback(this, function(response) {
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            component.set("v.items", response.getReturnValue());
        }
        else {  console.log("Failed with state: " + state);  }
    });
    $A.enqueueAction(action);
},
    
    
    CreateItem : function(component, event, helper) {
alert('mohit');
        // Simplistic error checking
        var validItem = true;

        // Name must not be blank
        var nameField = component.find("campname");
        var itemname = nameField.get("v.value");
        if ($A.util.isEmpty(itemname)){
            validItem = false;
            nameField.set("v.errors", [{message:"Item name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }        
         // Quantity must be set, must be a positive number
    var quantityField = component.find("campQty");
    var quantity = quantityField.get("v.value");
    if ($A.util.isEmpty(quantity) || isNaN(quantity) || (quantity <= 0.0)){
        validExpense = false;
        quantityField.set("v.errors", [{message:"Enter a valid quantity."}]);
    }
    else {
        // If the amount looks good, unset any errors...
        quantityField.set("v.errors", null);
    }
         // Price must be set, must be a positive number
    var priceField = component.find("campPrice");
    var price = priceField.get("v.value");
    if ($A.util.isEmpty(price) || isNaN(price) || (price <= 0.0)){
        validExpense = false;
        priceField.set("v.errors", [{message:"Enter a valid price."}]);
    }
    else {
        // If the amount looks good, unset any errors...
        priceField.set("v.errors", null);
    }               
        // If we pass error checking, do some real work
        if(validItem){
            helper.createItem (component,component.get("v.newItem"))
            // Create the new expense
            var newItem = component.get("v.newItem");
            console.log("Create item: " + JSON.stringify(newItem));
                var action = component.get("c.saveItem");
    action.setParams({
        "item": newItem
    });
    action.setCallback(this, function(response){
        var state = response.getState();
        if (component.isValid() && state === "SUCCESS") {
            var campingArray = component.get("v.items");
            campingArray.push(response.getReturnValue());
            component.set("v.items", campingArray);
            component.set("v.newItem",{ 'sobjectType': 
                                               'Camping_Item__c',
                                                          'Name': '',
                                                   'Quantity__c': 0,
                                                      'Price__c': 0,
                                                     'Packed__c': false });
        }
    });
    $A.enqueueAction(action);
        }
    }           
})