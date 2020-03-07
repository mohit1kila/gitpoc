({
	getaccounts : function(component) {
        var action = component.get("c.getaccounts");
		      
        action.setCallback(this,function(a){
          
            component.set("v.accounts",a.getReturnValue());
        });
        $A.enqueueAction(action);
		$A.log();
       $A.run();
            
	}
})