<cfoutput>

<form method="post" action="#cgi.script_name#">

	<fieldset>
	
		<legend>General Settings</legend>
		
		<p>
			<label for="socialLinksTitle">Social Links Title:</label>
			<span class="hint">leave blank to remove title</span>
			<span class="field">
				<input type="text" id="socialLinksTitle" name="socialLinksTitle" value="#getSetting("socialLinksTitle")#" size="20"/>
			</span>
		</p>
		
		<p>
			<label for="socialLinksShowTitle">Show Social Links Title:</label>
			<span class="hint">Enable/Disable the pod title</span>
			<span class="field">
				<input type="checkbox" id="socialLinksShowTitle" name="socialLinksShowTitle" value="true" <cfif getSetting("socialLinksShowTitle")>checked="checked"</cfif> />
			</span>
		</p>
		
		<p>
			<label for="socialLinksIconSet">Icon set:</label>
			<span class="hint">Select witch icons to use</span>
			<span class="field">
				<select id="socialLinksIconSet" name="socialLinksIconSet">
					<option value="socialMedia" <cfif getSetting("socialLinksIconSet") EQ "socialMedia">selected="selected"</cfif>>socialMedia</option>
					<option value="socialMediaWhite" <cfif getSetting("socialLinksIconSet") EQ "socialMediaWhite">selected="selected"</cfif>>socialMediaWhite</option>
				</select>
				<br />
				Icons by <a href="http://www.plechi.cz/" target="_blank">Tom Plech&aacute;&##269;ek</a>
			</span>
		</p>
		
		<p>
			<label for="socialLinksIconSize">Icon size:</label>
			<span class="hint">Size of the icons in pixels</span>
			<span class="field">
				<input type="text" id="socialLinksIconSize" name="socialLinksIconSize" value="#getSetting("socialLinksIconSize")#" size="5"/>px
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowDelicious" name="socialLinksShowDelicious" value="true"<cfif getSetting("socialLinksShowDelicious")> checked="checked"</cfif>/>
				Delicious
			</label>
		</legend>
		
		<p>
			<label for="socialLinksDeliciousUsername">Delicious username:</label>
			<span class="hint"><a href="http://delicious.com/user/#getSetting("socialLinksDeliciousUsername")#" target="_blank" >http://delicious.com/user/#getSetting("socialLinksDeliciousUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksDeliciousUsername" name="socialLinksDeliciousUsername" value="#getSetting("socialLinksDeliciousUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowDigg" name="socialLinksShowDigg" value="true"<cfif getSetting("socialLinksShowDigg")> checked="checked"</cfif>/>
				Digg
			</label>
		</legend>
		
		<p>
			<label for="socialLinksDiggUsername">Digg username:</label>
			<span class="hint"><a href="http://digg.com/users/#this.getSetting("socialLinksDiggUsername")#" target="_blank" >http://digg.com/users/#this.getSetting("socialLinksDiggUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksDiggUsername" name="socialLinksDiggUsername" value="#getSetting("socialLinksDiggUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowFacebook" name="socialLinksShowFacebook" value="true"<cfif getSetting("socialLinksShowFacebook")> checked="checked"</cfif>/>
				Facebook
			</label>
		</legend>
		
		<p>
			<label for="socialLinksFacebookUsername">Facebook username:</label>
			<span class="hint"><a href="http://www.facebook.com/#this.getSetting("socialLinksFacebookUsername")#" target="_blank" >http://www.facebook.com/#this.getSetting("socialLinksFacebookUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksFacebookUsername" name="socialLinksFacebookUsername" value="#getSetting("socialLinksFacebookUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowFlickr" name="socialLinksShowFlickr" value="true"<cfif getSetting("socialLinksShowFlickr")> checked="checked"</cfif>/>
				Flickr
			</label>
		</legend>
		
		<p>
			<label for="socialLinksFlickrUsername">Flickr username:</label>
			<span class="hint"><a href="http://flickr.com/photos/#this.getSetting("socialLinksFlickrUsername")#" target="_blank">http://flickr.com/photos/#this.getSetting("socialLinksFlickrUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksFlickrUsername" name="socialLinksFlickrUsername" value="#getSetting("socialLinksFlickrUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowLastfm" name="socialLinksShowLastfm" value="true"<cfif getSetting("socialLinksShowLastfm")> checked="checked"</cfif>/>
				LastFM
			</label>
		</legend>
		
		<p>
			<label for="socialLinksLastfmUsername">LastFM username:</label>
			<span class="hint"><a href="http://www.last.fm/user/#this.getSetting("socialLinksLastfmUsername")#" target="_blank" >http://www.last.fm/user/#this.getSetting("socialLinksLastfmUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksLastfmUsername" name="socialLinksLastfmUsername" value="#getSetting("socialLinksLastfmUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowLinkedin" name="socialLinksShowLinkedin" value="true"<cfif getSetting("socialLinksShowLinkedin")> checked="checked"</cfif>/>
				LinkedIn
			</label>
		</legend>
		
		<p>
			<label for="socialLinksLinkedinUsername">LinkedIn username:</label>
			<span class="hint"><a href="http://www.linkedin.com/in/#this.getSetting("socialLinksLinkedinUsername")#" target="_blank" >http://www.linkedin.com/in/#this.getSetting("socialLinksLinkedinUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksLinkedinUsername" name="socialLinksLinkedinUsername" value="#getSetting("socialLinksLinkedinUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowMyspace" name="socialLinksShowMyspace" value="true"<cfif getSetting("socialLinksShowMyspace")> checked="checked"</cfif>/>
				MySpace
			</label>
		</legend>
		
		<p>
			<label for="socialLinksMyspaceUsername">MySpace username:</label>
			<span class="hint"><a href="http://www.myspace.com/#this.getSetting("socialLinksMyspaceUsername")#" target="_blank" >http://www.myspace.com/#this.getSetting("socialLinksMyspaceUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksMyspaceUsername" name="socialLinksMyspaceUsername" value="#getSetting("socialLinksMyspaceUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowReddit" name="socialLinksShowReddit" value="true"<cfif getSetting("socialLinksShowReddit")> checked="checked"</cfif>/>
				Reddit
			</label>
		</legend>
		
		<p>
			<label for="socialLinksRedditUsername">Reddit username:</label>
			<span class="hint"><a href="http://www.reddit.com/user/#this.getSetting("socialLinksRedditUsername")#" target="_blank" >http://www.reddit.com/user/#this.getSetting("socialLinksRedditUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksRedditUsername" name="socialLinksRedditUsername" value="#getSetting("socialLinksRedditUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowStumbleupon" name="socialLinksShowStumbleupon" value="true"<cfif getSetting("socialLinksShowStumbleupon")> checked="checked"</cfif>/>
				Stumble Upon
			</label>
		</legend>
		
		<p>
			<label for="socialLinksStumbleuponUsername">Stumble Upon username:</label>
			<span class="hint"><a href="http://www.stumbleupon.com/stumbler/#this.getSetting("socialLinksStumbleuponUsername")#" target="_blank" >http://www.stumbleupon.com/stumbler/#this.getSetting("socialLinksStumbleuponUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksStumbleuponUsername" name="socialLinksStumbleuponUsername" value="#getSetting("socialLinksStumbleuponUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowTechnorati" name="socialLinksShowTechnorati" value="true"<cfif getSetting("socialLinksShowTechnorati")> checked="checked"</cfif>/>
				Technorati
			</label>
		</legend>
		
		<p>
			<label for="socialLinksTechnoratiUsername">Technorati username:</label>
			<span class="hint"><a href="http://technorati.com/people/#this.getSetting("socialLinksTechnoratiUsername")#" target="_blank" >http://technorati.com/people/#this.getSetting("socialLinksTechnoratiUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksTechnoratiUsername" name="socialLinksTechnoratiUsername" value="#getSetting("socialLinksTechnoratiUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowTwitter" name="socialLinksShowTwitter" value="true"<cfif getSetting("socialLinksShowTwitter")> checked="checked"</cfif>/>
				Twitter
			</label>
		</legend>
		
		<p>
			<label for="socialLinksTwitterUsername">Twitter username:</label>
			<span class="hint"><a href="http://twitter.com/#getSetting("socialLinksTwitterUsername")#" target="http://twitter.com/#getSetting("socialLinksTwitterUsername")#" >http://twitter.com/#getSetting("socialLinksTwitterUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksTwitterUsername" name="socialLinksTwitterUsername" value="#getSetting("socialLinksTwitterUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowVimeo" name="socialLinksShowVimeo" value="true"<cfif getSetting("socialLinksShowVimeo")> checked="checked"</cfif>/>
				Vimeo
			</label>
		</legend>
		
		<p>
			<label for="socialLinksVimeoUsername">Vimeo username:</label>
			<span class="hint"><a href="http://www.vimeo.com/#this.getSetting("socialLinksVimeoUsername")#" target="_blank" >http://www.vimeo.com/#this.getSetting("socialLinksVimeoUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksVimeoUsername" name="socialLinksVimeoUsername" value="#getSetting("socialLinksVimeoUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>

	<fieldset>
	
		<legend>
			<label>
				<input type="checkbox" id="socialLinksShowYoutube" name="socialLinksShowYoutube" value="true"<cfif getSetting("socialLinksShowYoutube")> checked="checked"</cfif>/>
				YouTube
			</label>
		</legend>
		
		<p>
			<label for="socialLinksYouTubeUsername">YouTube username:</label>
			<span class="hint"><a href="http://www.youtube.com/user/#this.getSetting("socialLinksYoutubeUsername")#" target="_blank" >http://www.youtube.com/user/#this.getSetting("socialLinksYoutubeUsername")#</a></span>
			<span class="field">
				<input type="text" id="socialLinksYouTubeUsername" name="socialLinksYouTubeUsername" value="#getSetting("socialLinksYouTubeUsername")#" size="20"/>
			</span>
		</p>
		
	</fieldset>
		
	<p class="actions">
		<input type="submit" class="primaryAction" value="Submit"/>
		<input type="hidden" value="event" name="action" />
		<input type="hidden" value="showSocialLinksSettings" name="event" />
		<input type="hidden" value="true" name="apply" />
		<input type="hidden" value="socialLinks" name="selected" />
	</p>

</form>

</cfoutput>