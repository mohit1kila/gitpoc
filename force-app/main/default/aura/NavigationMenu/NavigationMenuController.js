({
    selected : function(component, event, helper) {
        var selected = event.getParam("selectedItem");
        component.set("v.selected",selected);
        // returns label of selected item
        var selectedLabel = selected.get("v.label"); 
    },
    
    doSomething : function(component, event, helper) {
        console.log("do something");
    },
    navigateToMyComponent : function(component, event, helper) {
        //var evt = $A.get("e.force:navigateToComponent");
        var evt = $A.get("e.force:navigateToURL");
        evt.setParams({
            componentDef : "c:ViewdataComponent",
            componentAttributes: {
                PageName : component.get("v.selected")
            }
        });
        evt.fire();
    }
})