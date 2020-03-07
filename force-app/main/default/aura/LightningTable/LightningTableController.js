({
	doInit : function(component, event, helper) {
        helper.getsObjectRecords(component);
	},
    pageChange: function(component, event, helper) {
         var page = component.get("v.page") || 1;
         var direction = event.getParam("direction");
         page = direction === "previous" ? (page - 1) : (page + 1);
         helper.getsObjectRecords(component,page);
    },
    myPDF: function(component, event, helper) {
    
        var doc = new jsPDF();


	var specialElementHandlers = {
	'#editor': function(element, renderer){
		return true;
	}
	};


doc.fromHTML($('#render_me').get(0), 15, 15, {
	'width': 170, 
	'elementHandlers': specialElementHandlers
});

    }
})