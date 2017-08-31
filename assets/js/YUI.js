		(function () {
		
			var Event = YAHOO.util.Event,
				Dom = YAHOO.util.Dom;


			Event.onDOMReady(function () {


				var oPanel2 = new YAHOO.widget.Dialog("panel-2", {
					
					modal: true,
					visible: false,
					fixedcenter: true,
					constraintoviewport: true,
					width: "400px",
					postmethod: "form"
				
				});	

				oPanel2.render(document.body);

				Event.on("show-dialog-2", "click", function(){ oPanel2.show();});	


				/*var oTooltip2 = new YAHOO.widget.Tooltip("tooltip-2", { 
					context:"show-dialog-2", 
					text:"Shows a Modal Dialog built using Dialog from existing markup.",
					iframe: true,
					showDelay:500 } );
				*/

				var handleOK = function() {
					this.cancel();
				};				
				
				var oPanel3 = new YAHOO.widget.Dialog("signup-panel",{
				
					modal : true,
					visible:false,
					fixedcenter : true,
					constraintoviewport: true,
					width: "400px",
					postmethod: "form"
				});
				
				oPanel3.render(document.body);
				Event.on("signup","click",function(){oPanel3.show(); oPanel2.hide();});
				
				
			});
		
		}());	