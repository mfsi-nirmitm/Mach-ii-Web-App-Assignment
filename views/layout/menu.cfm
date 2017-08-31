  <div class="row-fluid">
    <div class="span12">
      <div class="span3 logo"> <a href="/index.cfm?event=home"> <img src="/assets/img/logo.png" alt="logo"/> </a> </div>
      <!-- Desktop-Main-Menu-Start  -->
      <div class="span6 hs_see_more offset5"> <a id="show-dialog-2" class="hs_more_btn signin"> Sign In </a> </div>
    </div>
  </div>


		<div id="panel-2">
			<div class="hd">Login</div>
			<div class="bd">
				<form class="form" id="form" method="post" onsubmit="return login_submit();" action="">
					<div>
						<span class="error" id="login_user_error"></span>
						<input type="text" id="login_user" name="login_user" placeholder="Email Or Username">
					</div>
					<div>
						<span class="error" id="login_password_error" ></span>
						<input type="password" id="login_password" name="login_password" placeholder="Password" >
					</div>
					<div>
						<input class="submit" type="submit" id="login_submit" name="login_submit" value="Submit">
					</div>
				</form>
				<p class="message">Not registered? <a id="signup" >Create an account</a></p>
			</div>
		</div>

		<div id="signup-panel">
			<div class="hd">Sign Up</div>
			<div class="bd">
				<form name="mySignForm" class="form" method="post"  >
					<div>
						<input type="text" id="signup_name" name="signup_name" placeholder="Name"  >
					</div>
					<div>
						<input type="text" id="signup_email" name="signup_email" placeholder="Email"  >
					</div>
					<div>
						<input type="text" id="signup_number" name="signup_number" placeholder="Phone" >
					</div>
					<div>
						<input type="text" id="signup_city" name="signup_city" placeholder="City" >
					</div>
					<div>
						<input type="text" id="signup_country" name="signup_country" placeholder="country" >
					</div>
					<div>
						<input type="text" id="signup_username" name="signup_username" placeholder="UserName" >
					</div>
					<div>
						<input type="Password" id="signup_password" name="signup_password" placeholder="Password" >
					</div>
					<div>
						<input type="password" id="confirm_password" name="confirm_password" placeholder="Confirm Password" >
					</div>
					<div>
						<input class="submit" type="submit" id="signup_submit" name="signup_submit" value="Submit" >
					</div>
				</form>
			</div>
		</div>
