<cfcomponent extends="BasePlugin"> 
 
    <cffunction name="init" access="public" output="false" returntype="any"> 
        <cfargument name="mainManager" type="any" required="true" /> 
        <cfargument name="preferences" type="any" required="true" /> 
         
        <cfset setManager(arguments.mainManager) /> 
        <cfset setPreferencesManager(arguments.preferences) /> 
        <cfset setPackage("com/lagaffe/mango/plugins/sociallinks") /> 
         
        <!--- Default preferences --->
		<cfset variables.defaults = structnew() />
        <cfset variables.defaults.socialLinksTitle = "Connect..." />
		<cfset variables.defaults.socialLinksShowTitle = true />
		<cfset variables.defaults.socialLinksIconSet = "socialMedia" />
		<cfset variables.defaults.socialLinksIconSize = "25" />
		<cfset variables.defaults.socialLinksShowDelicious = false />
		<cfset variables.defaults.socialLinksDeliciousUsername = "" />
		<cfset variables.defaults.socialLinksShowDigg = false />
		<cfset variables.defaults.socialLinksDiggUsername = "" />
		<cfset variables.defaults.socialLinksShowFacebook = false />
		<cfset variables.defaults.socialLinksFacebookUsername = "" />
		<cfset variables.defaults.socialLinksShowFlickr = false />
		<cfset variables.defaults.socialLinksFlickrUsername = "" />
		<cfset variables.defaults.socialLinksShowLastfm = false />
		<cfset variables.defaults.socialLinksLastfmUsername = "" />
		<cfset variables.defaults.socialLinksShowLinkedin = false />
		<cfset variables.defaults.socialLinksLinkedinUsername = "" />
		<cfset variables.defaults.socialLinksShowMyspace = false />
		<cfset variables.defaults.socialLinksMyspaceUsername = "" />
		<cfset variables.defaults.socialLinksShowReddit = false />
		<cfset variables.defaults.socialLinksRedditUsername = "" />
		<cfset variables.defaults.socialLinksShowStumbleupon = false />
		<cfset variables.defaults.socialLinksStumbleuponUsername = "" />
		<cfset variables.defaults.socialLinksShowTechnorati = false />
		<cfset variables.defaults.socialLinksTechnoratiUsername = "" />
		<cfset variables.defaults.socialLinksShowTwitter = false /> 
		<cfset variables.defaults.socialLinksTwitterUsername = "" />
		<cfset variables.defaults.socialLinksShowVimeo = false />
		<cfset variables.defaults.socialLinksVimeoUsername = "" />
		<cfset variables.defaults.socialLinksShowYoutube = false />
		<cfset variables.defaults.socialLinksYoutubeUsername = "" />
		<cfset variables.defaults.socialLinksShowPosterous = false />
		<cfset variables.defaults.socialLinksPosterousUsername = "" />
		<cfset variables.defaults.socialLinksShowTumblr = false />
		<cfset variables.defaults.socialLinksTumblrUsername = "" />
		<cfset variables.defaults.socialLinksShowDeviantart = false />
		<cfset variables.defaults.socialLinksDeviantartUsername = "" />
		<cfset variables.defaults.socialLinksShowGoogleplus = false />
		<cfset variables.defaults.socialLinksGoogleplusUsername = "" />
		<cfset variables.defaults.socialLinksShowSkype = false />
		<cfset variables.defaults.socialLinksSkypeUsername = "" />
		<cfset variables.defaults.socialLinksShowPinterest = false />
		<cfset variables.defaults.socialLinksPinterestUsername = "" />
		
		<cfset initSettings(argumentCollection = variables.defaults) />
             
        <cfreturn this/> 
    </cffunction> 
 
    <cffunction name="setup" hint="This is run when a plugin is activated" access="public" output="false" returntype="any"> 
        <cfreturn "Plugin activated." /> 
    </cffunction> 
     
    <cffunction name="unsetup" hint="This is run when a plugin is de-activated" access="public" output="false" returntype="any"> 
        <cfreturn "Plugin deactivated." /> 
    </cffunction> 
 
    <cffunction name="handleEvent" hint="Asynchronous event handling" access="public" output="false" returntype="any"> 
        <cfargument name="event" type="any" required="true" />         
        <cfreturn /> 
    </cffunction> 
 
	<cffunction name="processEvent" hint="Synchronous event handling" access="public" output="false" returntype="any">
		<cfargument name="event" type="any" required="true" />

			<cfset var socialLinksContainer = "" />
			<cfset var socialLinksJS = "" />
			<cfset var data =  "" />
			<cfset var eventName = arguments.event.name />
			<cfset var pod = "" />
			<cfset var link = "" />
			<cfset var page = "" />
			
			<cfswitch expression="#eventName#">
				<cfcase value="getPods">
				
					<cfif event.allowedPodIds EQ "*" OR listfindnocase(event.allowedPodIds, "sociallinks")>
						
						<cfsavecontent variable="socialLinksContainer">
							<cfoutput>
								<cfif this.getSetting("socialLinksShowDelicious") >
									<a href="http://delicious.com/user/#this.getSetting("socialLinksDeliciousUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/delicious.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowDigg") >
									<a href="http://digg.com/users/#this.getSetting("socialLinksDiggUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/digg.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowFacebook") >
									<a href="http://www.facebook.com/#this.getSetting("socialLinksFacebookUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/facebook.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowFlickr") >
									<a href="http://flickr.com/photos/#this.getSetting("socialLinksFlickrUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/flickr.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowLastfm") >
									<a href="http://www.last.fm/user/#this.getSetting("socialLinksLastfmUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/lastfm.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowLinkedin") >
									<a href="http://www.linkedin.com/in/#this.getSetting("socialLinksLinkedinUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/linkedin.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowMyspace") >
									<a href="http://www.myspace.com/#this.getSetting("socialLinksMyspaceUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/myspace.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowReddit") >
									<a href="http://www.reddit.com/user/#this.getSetting("socialLinksRedditUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/reddit.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowStumbleupon") >
									<a href="http://www.stumbleupon.com/stumbler/#this.getSetting("socialLinksStumbleuponUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/stumbleupon.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowTechnorati") >
									<a href="http://technorati.com/people/#this.getSetting("socialLinksTechnoratiUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/technorati.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowTwitter") >
									<a href="http://twitter.com/#getSetting("socialLinksTwitterUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/twitter.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowVimeo") >
									<a href="http://www.vimeo.com/#this.getSetting("socialLinksVimeoUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/vimeo.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowYoutube") >
									<a href="http://www.youtube.com/user/#this.getSetting("socialLinksYoutubeUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/youtube.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>

								<cfif this.getSetting("socialLinksShowPosterous") >
									<a href="http://#this.getSetting("socialLinksPosterousUsername")#.posterous.com/" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/posterous.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowTumblr") >
									<a href="http://#this.getSetting("socialLinksTumblrUsername")#.tumblr.com/" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/tumblr.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowDeviantart") >
									<a href="http://#this.getSetting("socialLinksDeviantartUsername")#.deviantart.com/" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/deviantart.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowGoogleplus") >
									<a href="https://plus.google.com/#this.getSetting("socialLinksGoogleplusUsername")#/about" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/googleplus.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowSkype") >
									<a href="skype:#this.getSetting("socialLinksSkypeUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/skype.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
								<cfif this.getSetting("socialLinksShowPinterest") >
									<a href="http://pinterest.com/#this.getSetting("socialLinksPinterestUsername")#" target="_blank">
									<img src="#request.blogManager.getBlog().getUrl()#assets/plugins/sociallinks/images/icons/#getSetting("socialLinksIconSet")#/pinterest.png" width="#getSetting("socialLinksIconSize")#" height="#getSetting("socialLinksIconSize")#" />
									</a>
								</cfif>
							</cfoutput>
						</cfsavecontent>
						
						<cfdump var="#socialLinksContainer#" />
							
						<cfset pod = structnew() />
						<cfif getSetting("socialLinksShowTitle")>
							<cfset pod.title = getSetting("socialLinksTitle") />
						<cfelse>
							<cfset pod.title = "" />
						</cfif>
						<cfset pod.content = socialLinksContainer />
						<cfset pod.id = "sociallinks" />
						<cfset arguments.event.addPod(pod)>
					</cfif>
				</cfcase>

				<cfcase value="beforeHtmlHeadEnd">
					<cfsavecontent variable="socialLinksJS"></cfsavecontent>
					
					<cfset data = arguments.event.outputData />
					<cfset data = data & socialLinksJS />
					<cfset arguments.event.outputData = data />
				</cfcase>

				<cfcase value="settingsNav">
					<cfset link = structnew() />
					<cfset link.owner = "socialLinks">
					<cfset link.page = "settings" />
					<cfset link.title = "Social Links" />
					<cfset link.eventName = "showSocialLinksSettings" />
					<cfset arguments.event.addLink(link)>
				</cfcase>
				
				<cfcase value="showSocialLinksSettings">
					<cfif getManager().isCurrentUserLoggedIn()>
						<cfset data = arguments.event.data />				

						<cfif structkeyexists(data.externaldata,"apply")>
						
							<cfparam name="data.externaldata.socialLinksTitle" default="0" />
							<cfparam name="data.externaldata.socialLinksShowTitle" default="0" />
							<cfparam name="data.externaldata.socialLinksIconSet" default="0" />
							<cfparam name="data.externaldata.socialLinksIconSize" default="0" />
							<cfparam name="data.externaldata.socialLinksShowDelicious" default="0" />
							<cfparam name="data.externaldata.socialLinksDeliciousUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowDigg" default="0" />
							<cfparam name="data.externaldata.socialLinksDiggUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowFacebook" default="0" />
							<cfparam name="data.externaldata.socialLinksFacebookUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowFlickr" default="0" />
							<cfparam name="data.externaldata.socialLinksFlickrUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowLastfm" default="0" />
							<cfparam name="data.externaldata.socialLinksLastfmUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowLinkedin" default="0" />
							<cfparam name="data.externaldata.socialLinksLinkedinUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowMyspace" default="0" />
							<cfparam name="data.externaldata.socialLinksMyspaceUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowReddit" default="0" />
							<cfparam name="data.externaldata.socialLinksRedditUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowStumbleupon" default="0" />
							<cfparam name="data.externaldata.socialLinksStumbleuponUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowTechnorati" default="0" />
							<cfparam name="data.externaldata.socialLinksTechnoratiUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowTwitter" default="0" />
							<cfparam name="data.externaldata.socialLinksTwitterUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowVimeo" default="0" />
							<cfparam name="data.externaldata.socialLinksVimeoUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowYoutube" default="0" />
							<cfparam name="data.externaldata.socialLinksYoutubeUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowPosterous" default="0" />
							<cfparam name="data.externaldata.socialLinksPosterousUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowTumblr" default="0" />
							<cfparam name="data.externaldata.socialLinksTumblrUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowDeviantart" default="0" />
							<cfparam name="data.externaldata.socialLinksDeviantartUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowGoogleplus" default="0" />
							<cfparam name="data.externaldata.socialLinksGoogleplusUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowSkype" default="0" />
							<cfparam name="data.externaldata.socialLinksSkypeUsername" default="0" />
							<cfparam name="data.externaldata.socialLinksShowPinterest" default="0" />
							<cfparam name="data.externaldata.socialLinksPinterestUsername" default="0" />
							
							<cfset LOCAL.newSettings = StructNew() />
							<cfloop collection="#variables.defaults#" item="LOCAL.key">
								<cfset LOCAL.newSettings[LOCAL.key] = data.externaldata[LOCAL.key] />
							</cfloop>
							
							<cfset setSettings(argumentCollection = LOCAL.newSettings) />
							
							<cfset persistSettings() />
							<cfset data.message.setstatus("success") />
							<cfset data.message.setType("settings") />
							<cfset data.message.settext("Social Links Settings Updated") />
						</cfif>
					</cfif>
						
					<cfsavecontent variable="page">
						<cfinclude template="admin/settingsForm.cfm">
					</cfsavecontent>
						
					<cfset data.message.setTitle("Social Links Settings") />
					<cfset data.message.setData(page) />
				</cfcase>
				
				<cfcase value="getPodsList">
					<cfset pod = structnew() />
					<cfset pod.title = "Social Links" />
					<cfset pod.id = "sociallinks" />
					<cfset arguments.event.addPod(pod)>
				</cfcase>
			</cfswitch>
		
		<cfreturn arguments.event />
	</cffunction>
 
</cfcomponent>