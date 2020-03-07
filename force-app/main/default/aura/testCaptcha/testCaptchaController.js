({
	doInit : function(component, event, helper) {
         var s = document.createElement("script");
        s.type = "text/javascript";
        //s.src = 'https://www.google.com/recaptcha/api.js';
        s.src = "/resource/api"; 
        s.type = 'text/javascript';
        (document.getElementsByTagName("head")[0] || document.documentElement).appendChild(s);
		
	}
})