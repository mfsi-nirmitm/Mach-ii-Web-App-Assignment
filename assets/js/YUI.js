
var oPanel2 = "";
var oPanel3 = "";
var editProfilePanel = "";
var addArt = "";
			(function () {
		
			var Event = YAHOO.util.Event,
				Dom = YAHOO.util.Dom;


			Event.onDOMReady(function () {


				oPanel2 = new YAHOO.widget.Dialog("panel-2", {
					
					modal: true,
					visible: false,
					fixedcenter: true,
					constraintoviewport: true,
					width: "400px",
					postmethod: "form"
				
				});	

				oPanel2.render(document.body);

				Event.on("show-dialog-2", "click", function(){ oPanel2.show(); });	


				/*var oTooltip2 = new YAHOO.widget.Tooltip("tooltip-2", { 
					context:"show-dialog-2", 
					text:"Shows a Modal Dialog built using Dialog from existing markup.",
					iframe: true,
					showDelay:500 } );
				*/

				var handleOK = function() {
					this.cancel();
				};				
				
				oPanel3 = new YAHOO.widget.Dialog("signup-panel",{
				
					modal : true,
					visible:false,
					fixedcenter: true,
					constraintoviewport: true,
					width: "400px",
					postmethod: "form"
				});
				
				oPanel3.render(document.body);
				Event.on("signup","click",function(){oPanel3.show(); oPanel2.hide();  });
				
				editProfilePanel = new YAHOO.widget.Dialog("edit-panel",{
					modal   :  true,
					visible : false ,
					fixedcenter: true,
					constraintoviewport : true,
					width: "800px",
					postmethod : "form"
				});
				
				editProfilePanel.render(document.body);
				Event.on("edit_profile_panel","click",function(){ editProfilePanel.show(); });
				
				addArt = new YAHOO.widget.Dialog("add_art",{
					modal               : true,
					visible             : false,
					fixedcenter         : true,
					constraintoviewport : true,
					width               : "400px",
					postmethod          : "form"
				});
				
				addArt.render(document.body);
				Event.on("addingArt","click",function(){ addArt.show(); });
			});
		
		}());	
		
function body_load_loginError()
{
	oPanel2.show();
}
		
function body_load_signupError()
{
	oPanel3.show();
}
function body_load_updateError()
{
	editProfilePanel.show();
}
function body_load_addArtError()
{
	addArt.show();
}