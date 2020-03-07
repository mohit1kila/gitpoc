({
	doaction : function(component, event, helper) {
		
        var inputCmp = component.find("UserName");
        var value = inputCmp.get("v.value");
       if(value.length>8)
       {inputCmp.set("v.errors", [{message:"Password must be 8 characters long. <br/>"+ value}]);
        } else {
            inputCmp.set("v.errors", null);
        }
        
    
	}
})