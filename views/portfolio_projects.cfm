<cfset variables.qPainting = event.getArg("qPainting") />


<!-- Single-Info-End -->
  <!--Similar-project-Start -->
  <div id="arts" class="row-fluid">
    <div class="span12 hs_similar_meta">
      <h1 class="lined"> Art Galleries </h1>
    </div>
	<cfif structKeyExists(session,'loggedIn') AND session.loggedIn['artistID'] EQ event.getArg('ArtistID')  >
	<div class="span6 hs_see_more offset5 right"> <a id="addingArt"  class="hs_more_btn signin"> Add Art </a> </div>
    </cfif>
	<div class="span12">
		<cfoutput query="variables.qPainting">
			<cfif ( (!structKeyExists(session,'loggedIn')) AND variables.qPainting.ISPUBLIC EQ 1 ) OR ( structKeyExists(session,'loggedIn') AND variables.qPainting.ISPUBLIC EQ 1 ) OR ( structKeyExists(session,'loggedIn') AND variables.qPainting.ISPUBLIC EQ 0 AND session.loggedIn['artistID'] EQ event.getArg('ArtistID') )  >
				<div class="span4 hs_main_latest">
					<div class="span12 center">
						<div class="span12 hs_latest">
							<img class="image_size" src="#variables.qPainting.IMAGEURL#" alt="Art Gallery"/>
						</div>
			        </div>
		       		<div class="span12 text-center">
						<p>
							#variables.qPainting.PAINTINGNAME#
							<cfif structKeyExists(session,'loggedIn') AND session.loggedIn['artistID'] EQ event.getArg('ArtistID') >
							<span class="float_right"><input type="checkbox"  name="public" value="1" id="#variables.qPainting.PAINTINGID#" <cfif variables.qPainting.ISPUBLIC EQ 1 > checked="checked" </cfif> onclick="makepublic(this)" ></span>
							</cfif>
						</p>
					</div>
				</div>
			</cfif>
		</cfoutput>
    </div>

  </div>

		<div id="add_art">
			<div class="hd"> Add Art </div>
			<div class="bd">
				<cfoutput>
				<form class="upload_profileimage_form" name="addPaintingForm" enctype="multipart/form-data" method="post" action="/index.cfm?event=addPainting">
					<div>
						<input type="hidden" name="ArtistID" value="<cfif structKeyExists(session,'loggedIn')>#session.loggedIn['artistID']#</cfif>">
					</div>
					<div>
						<input class="file" type="file" name="UploadPainting" >
					</div>
					<div >
						<span class="error"><cfif event.isArgDefined('addArtError')>#event.getArg('addArtError')#</cfif></span>
						<!---<input  type="submit"  name="submit" value="Upload"/>
						--->
						<button class="submit" type="submit" >Upload</button>
					</div>
				</form>
				</cfoutput>
			</div>
		</div>
