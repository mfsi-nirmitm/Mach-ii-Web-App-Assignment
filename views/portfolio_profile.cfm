
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
      </div>
      <div class="about_profile padding">
        <h1 class="hs_page_heading"> #variables.artist.getName()# </h1>
        <p>#variables.artist.getCity()#, <b>#variables.artist.getCountry()#</b></p>
        <p>#variables.artist.getAbout()# </p>
      </div>
  </div>
</cfoutput>