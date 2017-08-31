<cfset variables.qPainting = event.getArg("qPainting") />


<!-- Single-Info-End -->
  <!--Similar-project-Start -->
  <div id="arts" class="row-fluid">
    <div class="span12 hs_similar_meta">
      <h1 class="lined"> Art Galleries </h1>
    </div>

    <div class="span12">
		<cfoutput query="variables.qPainting">
		<div class="span4 hs_main_latest">
			<div class="span12 center">
				<div class="span12 hs_latest">
					<img class="image_size" src="#variables.qPainting.IMAGEURL#" alt="Art Gallery"/>
				</div>
	        </div>
       		<div class="span12 text-center">
				<p>
					#variables.qPainting.PAINTINGNAME#
					<span class="float_right"><input type="checkbox" name="public" value="1" <cfif variables.qPainting.ISPUBLIC EQ 1 > checked="checked" </cfif> ></span>
				</p>
			</div>
		</div>
		</cfoutput>
    </div>

  </div>
