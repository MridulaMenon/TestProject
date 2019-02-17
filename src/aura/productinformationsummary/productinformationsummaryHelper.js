({
	createPIS : function(component,event,callback) {
        debugger;
		 var action = component.get("c.createProductDB");
        
         action.setParams({
                          "product":component.get("v.productinformation")
                         });
                         
     
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                console.log("Race successfully saved");
                alert('Saved');
            } else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.log("Error message: " + errors[0].message);
                    }
                } else {
                    console.log("Unknown error");
                }
            } else {
                console.log("Action State returned was: " + state);
            }

        });
        $A.enqueueAction(action);
        
	
	}
})