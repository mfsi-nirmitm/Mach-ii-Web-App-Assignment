<!---
<cfset variables.startingUrl = "https://192.168.1.4:99"  />
--->
	<!--- list of artists getting from listener ArtistListener --->
	<cfset variables.artistList = event.getArg("qArtists") />

	<div class="row-fluid">
    	<div class="span12">
        	<div class="span12 hs_left hs_top_fifty">
            	<h1 class="lined"> Our Artists</h1>
      		</div>

			<cfoutput query="variables.artistList" >
			<div class="span4 hs_main_latest">
				<a href="/index.cfm?event=ShowPortfolio&ArtistID=#variables.artistList.ARTISTID#">
	        		<div class="span12 hs_port_thumb center">
	          			<div class="span12 hs_latest">
		          			<img class="image_size" src="#variables.artistList.PROFILEIMAGE#" height="170px" width="166px" alt="latest_Portfolio"/>
						</div>
	        		</div>
        		</a>
        		<div class="span12 text-center">
					<a href="/index.cfm?event=ShowPortfolio&ArtistID=#variables.artistList.ARTISTID#"> #variables.artistList.NAME# </a>
				</div>
			</div>
			</cfoutput>

		</div>
		<!---
    	<div class="span6 hs_see_more offset5"> <a href="" class="hs_more_btn"> See More </a> </div>
		--->
	</div>