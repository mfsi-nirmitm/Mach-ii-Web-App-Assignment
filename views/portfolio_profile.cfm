
<cfset variables.artist = event.getArg("artistBean") />

  <div class="row-fluid">
    <div class="span12">
      <div class="span12 hs_left hs_heading_part"> <img src="/assets/img/seprator.png" alt="seprator"/> </div>
      <div class="span12 hs_left">
        <div class="span8 hs_inner_heading">
          <h1> We are Creating Beautiful World </h1>
        </div>
        <div class="span4 hs_breadcrumb_part hs_left">
          <ul class="hs_breadcrumb">
            <li> <a href="/index.cfm?event=home"> home </a> </li>
            <li> <a href="#arts"> Art Galleries </a> </li>
          </ul>
        </div>
      </div>
      <div class="span12 hs_left hs_heading_part"> <img src="/assets/img/seprator.png" alt="seprator"/> </div>
    </div>
  </div>
  <!-- Portfolio-Slide-End -->
  <!-- Single-Info-Start -->
<cfoutput>

  <div class="row-fluid">
      <div class="profile_image">
        <div class="span12 hs_portfolio_inner center">
          <img class="image_size" src="#variables.artist.getProfileImage()#" alt="latest_Portfolio"/>
        </div>
		<cfif structKeyExists(session,'loggedIn') AND session.loggedIn['artistID'] EQ event.getArg('ArtistID') >
		<div>
			<cfoutput>
			<form class="upload_profileimage_form" name="UploadForm" method="post" enctype="multipart/form-data" action="/index.cfm?event=uploadProfileImage">
				<div>
					<input type="hidden" id="uploadprofile_artistid" name="ArtistID" value="<cfif structKeyExists(session,'loggedIn')>#session.loggedIn['artistID']#</cfif>">
				</div>
				<div>
					<input class="file" type="file" name="UploadFile" >
				</div>
				<div >
					<span class="error"><cfif event.isArgDefined('uploadprofileError')>#event.getArg('uploadprofileError')#</cfif></span>
					<input class="submit" type="submit"  name="submit" value="Upload"/>
				</div>
			</form>
			</cfoutput>
		</div>
		</cfif>
      </div>
      <div class="about_profile padding">
        <h1 class="hs_page_heading"> #variables.artist.getName()# </h1>
        <p>#variables.artist.getCity()#, <b>#variables.artist.getCountry()#</b></p>
        <p>#variables.artist.getAbout()# </p>
		<p class="right_text" ><span>#variables.artist.getEmail()#</span> | <span>#variables.artist.getPhone()#</span></p>
      </div>
  </div>
	<cfif structKeyExists(session,'loggedIn') AND session.loggedIn['artistID'] EQ event.getArg('ArtistID')  >
	<div class="row-fluid">
		<div  class="span6 hs_see_more offset5 right" > <a id = "edit_profile_panel" class="hs_more_btn signin"> Edit </a> </div>
	</div>
	</cfif>
</cfoutput>
		<div id="edit-panel">
			<div class="hd">Edit Profile</div>
			<div class="bd">
				<cfoutput>
				<form name="myEditForm" id="editform" class="form" method="post" action="/index.cfm?event=processUpdateData" >
					<div class="edit_profile_form">
						<div>
							<input type="hidden" id="edit_artistid" name="ArtistID" value="<cfif structKeyExists(session,'loggedIn')>#session.loggedIn['artistID']#</cfif>">
						</div>
						<div>
							<span class="error" id="edit_name_error"></span>
							<input type="text" id="edit_name" name="edit_name" placeholder="Name" value="#variables.artist.getName()#" >
						</div>
						<div>
							<span class="error" id="edit_email_error"><cfif event.isArgDefined('errorInUpdate')>#event.getArg('errorInUpdate')['edit_email_error']#</cfif></span>
							<input type="text" id="edit_email" name="edit_email" placeholder="Email" value="#variables.artist.getEmail()#" >
						</div>
						<div>
							<span class="error" id="edit_number_error"></span>
							<input type="text" id="edit_number" name="edit_number" placeholder="Phone" maxlength="10" value="#variables.artist.getPhone()#" >
						</div>
						<div>
							<span class="error" id="edit_city_error"></span>
							<input type="text" id="edit_city" name="edit_city" placeholder="City" value="#variables.artist.getCity()#" >
						</div>
						<div>
							<span class="error" id="edit_country_error"></span>
							<input type="text" id="edit_country" name="edit_country" placeholder="country" value="#variables.artist.getCountry()#" >
						</div>
						<div>
							<span class="error" id="edit_username_error"><cfif event.isArgDefined('errorInUpdate')>#event.getArg('errorInUpdate')['edit_username_error']#</cfif></span>
							<input type="text" id="edit_username" name="edit_username" placeholder="UserName" value="#variables.artist.getUserName()#" >
						</div>
						<div>
							<span class="error" id="edit_password_error"></span>
							<input type="Password" id="edit_password" name="edit_password" placeholder="New Password" >
						</div>
						<div>
							<span class="error" id="edit_confirm_password_error"></span>
							<input type="password" id="edit_confirm_password" name="edit_confirm_password" placeholder="Confirm Password" >
						</div>
					</div>
					<div class="edit_profile_form" >
						<div>
							<span class="error" id="edit_about_error"></span>
							<textarea name="edit_about" class="form_text_area" rows="13" id="edit_about" >#variables.artist.getAbout()#</textarea>
						</div>
					</div>
					<div class="edit_profile_form clear_both"  >
						<input class="submit" type="submit" id="edit_submit" name="edit_submit" value="Submit" >
					</div>
					<div class="edit_profile_form">
						<input class="submit cancle_button" type="button" id="cancle_button" name="cancle_button" value="Cancle">
					</div>
				</form>
				</cfoutput>
			</div>
		</div>

