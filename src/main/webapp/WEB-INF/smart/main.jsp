<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <title>XXXX管理系统</title>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>

    <!-- 		<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE10"/> -->

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">


    <!-- #CSS Links -->
    <!-- Basic Styles -->
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/font-awesome.min.css">

    <!-- SmartAdmin Styles : Caution! DO NOT change the order -->
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/smartadmin-production-plugins.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/smartadmin-production.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/smartadmin-skins.min.css">

    <!-- SmartAdmin RTL Support -->
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/smartadmin-rtl.min.css">

    <!-- We recommend you use "your_style.css" to override SmartAdmin
         specific styles this will also ensure you retrain your customization with each SmartAdmin update.
    <link rel="stylesheet" type="text/css" media="screen" href="css/your_style.css"> -->
    <link rel="stylesheet" type="text/css"  media="screen" href="${ctx}/static/smart/css/edit-style.css">

    <!-- Demo purpose only: goes with demo.js, you can delete this css when designing your own WebApp -->
    <%-- 		<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/css/demo.min.css"> --%>

    <!-- #FAVICONS -->
    <link rel="shortcut icon" href="${ctx}/static/smart/img/favicon/favicon.ico" type="image/x-icon">
    <link rel="icon" href="${ctx}/static/smart/img/favicon/favicon.ico" type="image/x-icon">

    <!-- #GOOGLE FONT
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,300,400,700">
-->
    <!-- #APP SCREEN / ICONS -->
    <!-- Specifying a Webpage Icon for Web Clip
         Ref: https://developer.apple.com/library/ios/documentation/AppleApplications/Reference/SafariWebContent/ConfiguringWebApplications/ConfiguringWebApplications.html -->
    <link rel="apple-touch-icon" href="${ctx}/static/smart/img/splash/sptouch-icon-iphone.png">
    <link rel="apple-touch-icon" sizes="76x76" href="${ctx}/static/smart/img/splash/touch-icon-ipad.png">
    <link rel="apple-touch-icon" sizes="120x120" href="${ctx}/static/smart/img/splash/touch-icon-iphone-retina.png">
    <link rel="apple-touch-icon" sizes="152x152" href="${ctx}/static/smart/img/splash/touch-icon-ipad-retina.png">

    <!-- iOS web-app metas : hides Safari UI Components and Changes Status Bar Appearance -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <!-- Startup image for web apps -->
    <link rel="apple-touch-startup-image" href="${ctx}/static/smart/img/splash/ipad-landscape.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:landscape)">
    <link rel="apple-touch-startup-image" href="${ctx}/static/smart/img/splash/ipad-portrait.png"
          media="screen and (min-device-width: 481px) and (max-device-width: 1024px) and (orientation:portrait)">
    <link rel="apple-touch-startup-image" href="${ctx}/static/smart/img/splash/iphone.png"
          media="screen and (max-device-width: 320px)">
    <!-- zTree -->

    <!-- easyui css -->
    <%-- 		<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/easyui/themes/bootstrap/easyui.css"> --%>
    <%-- 		<link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/easyui/themes/icon.css"> --%>

    <%-- <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/jquery-ui.min.css"> --%>

    <!-- fullcalendar css -->
    <!-- jqgrid css -->
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/smart/plugin/jqgrid/ui.jqgrid.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="${ctx}/static/smart/plugin/jqgrid/ui.jqgrid-bootstrap.css">
    <link rel="stylesheet" type="text/css" media="screen"
          href="${ctx}/static/smart/plugin/jqgrid/ui.jqgrid-bootstrap-ui.css">
    <!-- custome css -->
    <link rel="stylesheet" type="text/css" media="screen" href="${ctx}/static/css/css.css">

    <link rel="stylesheet" href="${ctx}/static/smart/css/custome.css"/>
    <!-- umeditor css -->
    <link rel="stylesheet" href="${ctx}/static/plugin/umeditor/themes/default/css/umeditor.css"/>
</head>

<!--

TABLE OF CONTENTS.

Use search to find needed section.

===================================================================

|  01. #CSS Links                |  all CSS links and file paths  |
|  02. #FAVICONS                 |  Favicon links and file paths  |
|  03. #GOOGLE FONT              |  Google font link              |
|  04. #APP SCREEN / ICONS       |  app icons, screen backdrops   |
|  05. #BODY                     |  body tag                      |
|  06. #HEADER                   |  header tag                    |
|  07. #PROJECTS                 |  project lists                 |
|  08. #TOGGLE LAYOUT BUTTONS    |  layout buttons and actions    |
|  09. #MOBILE                   |  mobile view dropdown          |
|  10. #SEARCH                   |  search field                  |
|  11. #NAVIGATION               |  left panel & navigation       |
|  12. #MAIN PANEL               |  main panel                    |
|  13. #MAIN CONTENT             |  content holder                |
|  14. #PAGE FOOTER              |  page footer                   |
|  15. #SHORTCUT AREA            |  dropdown shortcuts area       |
|  16. #PLUGINS                  |  all scripts and plugins       |

===================================================================

-->

<!-- #BODY -->
<!-- Possible Classes

    * 'smart-style-{SKIN#}'
    * 'smart-rtl'         - Switch theme mode to RTL
    * 'menu-on-top'       - Switch to top navigation (no DOM change required)
    * 'no-menu'			  - Hides the menu completely
    * 'hidden-menu'       - Hides the main menu but still accessable by hovering over left edge
    * 'fixed-header'      - Fixes the header
    * 'fixed-navigation'  - Fixes the main menu
    * 'fixed-ribbon'      - Fixes breadcrumb
    * 'fixed-page-footer' - Fixes footer
    * 'container'         - boxed layout mode (non-responsive: will not work with fixed-navigation & fixed-ribbon)
-->
<body class="" >
<div id="init-cover" class="init-cover">
    <div class="spinner">
        <div class="rect1"></div>
        <div class="rect2"></div>
        <div class="rect3"></div>
        <div class="rect4"></div>
        <div class="rect5"></div>
    </div>
</div>
<!-- #HEADER -->
<header id="header">
    <div id="logo-group">

        <!-- PLACE YOUR LOGO HERE -->
        <span id="logo"> <img  alt="SmartAdmin" style="width:125px;"> </span>
        <!-- END LOGO PLACEHOLDER -->

        <!-- Note: The activity badge color changes when clicked and resets the number to 0
             Suggestion: You may want to set a flag when this happens to tick off all checked messages / notifications -->
        <span id="activity" class="activity-dropdown"> <i class="fa fa-user"></i> <b class="badge"> ${unreadCount} </b> </span>

        <!-- AJAX-DROPDOWN : control this dropdown height, look and feel from the LESS variable file -->
        <div class="ajax-dropdown">

            <!-- the ID links are fetched via AJAX to the ajax container "ajax-notifications" -->
            <div class="btn-group btn-group-justified" data-toggle="buttons">
                <label class="btn btn-default active">
                    <input type="radio" name="activity" id="system/notify/message?msgType=02">
                    用户消息 (${unreadCountUser}) </label>
                <label class="btn btn-default">
                    <input type="radio" name="activity" id="system/notify/message?msgType=01">
                    系统通知 (${unreadCountSystem}) </label>
            </div>

            <!-- notification content -->
            <div class="ajax-notifications custom-scroll">

            </div>
            <!-- end notification content -->

            <!-- footer: refresh area -->
            <%--<span> Last updated on: 12/12/2013 9:43AM
                <button type="button" data-loading-text="<i class='fa fa-refresh fa-spin'></i> Loading..." class="btn btn-xs btn-default pull-right">
                    <i class="fa fa-refresh"></i>
                </button> </span> --%>
            <!-- end footer -->

        </div>
        <!-- END AJAX-DROPDOWN -->
    </div>

    <!-- #PROJECTS: projects dropdown -->
    <div class="project-context hidden-xs">
        <span class="label">${user.name}</span>
        <span class="project-selector dropdown-toggle" id="id-span-current-time">2016-05-01 13:00:00</span>

        <!-- end dropdown-menu-->

    </div>
    <!-- end projects dropdown -->

    <!-- #TOGGLE LAYOUT BUTTONS -->
    <!-- pulled right: nav area -->
    <div class="pull-right">

        <!-- collapse menu button -->
        <div id="hide-menu" class="btn-header pull-right">
            <span> <a href="javascript:void(0);" data-action="toggleMenu" title="Collapse Menu"><i
                    class="fa fa-reorder"></i></a> </span>
        </div>
        <!-- end collapse menu -->

        <!-- #MOBILE -->
        <!-- Top menu profile link : this shows only when top menu is active -->
        <!-- 				<ul id="mobile-profile-img" class="header-dropdown-list hidden-xs padding-5"> -->
        <!-- 					<li class=""> -->
        <!-- 						<a href="#" class="dropdown-toggle no-margin userdropdown" data-toggle="dropdown">  -->
        <%-- 							<img src="${ctx}/static/smart/img/avatars/male.png" alt="${user.name }" title="${user.name }" class="online" />   --%>
        <!-- 						</a> -->
        <!-- 					</li> -->
        <!-- 				</ul> -->

        <!-- logout button -->
        <div id="logout" class="btn-header transparent pull-right">
            <span> <a href="j_spring_security_logout" title="注销" data-action="userLogout" data-logout-msg="确定要退出?"><i
                    class="fa fa-sign-out"></i></a> </span>
        </div>
        <!-- end logout button -->

        <!-- search mobile button (this is hidden till mobile view port)-->
        <div id="search-mobile" class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
        </div>

        <!-- end search mobile button -->

        <!-- #SEARCH -->
        <!-- input: search field
        <form action="#ajax/search.html" class="header-search pull-right">
            <input id="search-fld" type="text" name="param" placeholder="Find reports and more">
            <button type="submit">
                <i class="fa fa-search"></i>
            </button>
            <a href="javascript:void(0);" id="cancel-search-js" title="Cancel Search"><i class="fa fa-times"></i></a>
        </form>
        -->
        <!-- end input: search field -->

        <!-- fullscreen button -->
        <!-- 修改人：高晓丹   屏蔽全屏 -->
        <!-- 				<div id="fullscreen" class="btn-header transparent pull-right"> -->
        <!-- 					<span> <a href="javascript:void(0);" data-action="launchFullscreen" title="全屏"><i class="fa fa-arrows-alt"></i></a> </span> -->
        <!-- 				</div> -->

        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" title="F5刷新" onclick="refresh();"><i
                    class="fa fa-refresh"></i></a> </span>
        </div>
        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" title="前进" onclick="javascript:goForward();"><i
                    class="fa fa-mail-forward"></i></a> </span>
        </div>

        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" title="回退" onclick="javascript:goBack();"><i
                    class="fa  fa-mail-reply"></i></a> </span>
        </div>

        <!--
        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" title="浏览历史" data-action="historyReport"><i class="fa fa-history"></i></a> </span>
        </div>
         -->

        <!-- 				<div class="btn-header transparent pull-right"> -->
        <!-- 					<span> <a href="javascript:void(0);" title="快捷功能" data-action="toggleShortcut"><i class="fa fa-gears"></i></a> </span> -->
        <!-- 				</div> -->

        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" title="修改登录密码" onclick="pwdChange(true);"><i class="fa fa-key"></i></a> </span>
        </div>

        <div class="btn-header transparent pull-right">
            <span> <a href="javascript:void(0);" onclick="loadHome();" title="首页"><i class="fa fa-home"></i></a> </span>
        </div>

        <!-- end fullscreen button -->

        <!-- #Voice Command: Start Speech -->
        <!-- NOTE: Voice command button will only show in browsers that support it. Currently it is hidden under mobile browsers.
                   You can take off the "hidden-sm" and "hidden-xs" class to display inside mobile browser-->
        <!--
        <div id="speech-btn" class="btn-header transparent pull-right hidden-sm hidden-xs">
            <div>
                <a href="javascript:void(0)" title="Voice Command" data-action="voiceCommand"><i class="fa fa-microphone"></i></a>
                <div class="popover bottom"><div class="arrow"></div>
                    <div class="popover-content">
                        <h4 class="vc-title">Voice command activated <br><small>Please speak clearly into the mic</small></h4>
                        <h4 class="vc-title-error text-center">
                            <i class="fa fa-microphone-slash"></i> Voice command failed
                            <br><small class="txt-color-red">Must <strong>"Allow"</strong> Microphone</small>
                            <br><small class="txt-color-red">Must have <strong>Internet Connection</strong></small>
                        </h4>
                        <a href="javascript:void(0);" class="btn btn-success" onclick="commands.help()">See Commands</a>
                        <a href="javascript:void(0);" class="btn bg-color-purple txt-color-white" onclick="$('#speech-btn .popover').fadeOut(50);">Close Popup</a>
                    </div>
                </div>
            </div>
        </div>
         -->
        <!-- end voice command -->

        <!-- multiple lang dropdown : find all flags in the flags page -->
        <ul class="header-dropdown-list hidden-xs">
            <li>
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <img src="${ctx}/static/smart/img/blank.gif" class="flag" alt="皮肤选择"> <span> 皮肤选择</span> <i
                        class="fa fa-angle-down"></i>
                </a>
                <section id="smart-styles" class="dropdown-menu">
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-0" data-skinlogo="${ctx}/static/smart/img/logo.png"
                       class="btn btn-block btn-xs txt-color-white margin-right-5" style="background-color:#4E463F;"><i
                            class="fa fa-check fa-fw" id="skin-checked"></i>Smart Default</a>
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-1"
                       data-skinlogo="${ctx}/static/smart/img/logo-white.png"
                       class="btn btn-block btn-xs txt-color-white" style="background:#3A4558;">Dark Elegance</a>
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-2"
                       data-skinlogo="${ctx}/static/smart/img/logo-blue.png"
                       class="btn btn-xs btn-block txt-color-darken margin-top-5" style="background:#fff;">Ultra
                        Light</a>
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-3"
                       data-skinlogo="${ctx}/static/smart/img/toyota11.png"
                       class="btn btn-xs btn-block txt-color-white margin-top-5" style="background:#f78c40">Google
                        Skin</a>
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-4"
                       data-skinlogo="${ctx}/static/smart/img/toyota11.png"
                       class="btn btn-xs btn-block txt-color-white margin-top-5"
                       style="background: #bbc0cf; border: 1px solid #59779E; color: #17273D !important;">PixelSmash</a>
                    <a href="javascript:$('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');" id="smart-style-5"
                       data-skinlogo="${ctx}/static/smart/img/toyota11.png"
                       class="btn btn-xs btn-block txt-color-white margin-top-5"
                       style="background: rgba(153, 179, 204, 0.2); border: 1px solid rgba(121, 161, 221, 0.8); color: #17273D !important;">Glass
                        <sup>beta</sup></a>
                </section>

            </li>
        </ul>
        <!-- end multiple lang -->

    </div>
    <!-- end pulled right: nav area -->

</header>
<!-- END HEADER -->

<!-- #NAVIGATION -->
<!-- Left panel : Navigation area -->
<!-- Note: This width of the aside area can be adjusted through LESS/SASS variables -->
<aside id="left-panel">

    <!-- User info -->
    <div class="login-info">
				<span> <!-- User image size is adjusted inside CSS, it should stay as is --> 
					
					<a href="javascript:void(0);" id="show-shortcut">
						<img src="${ctx}/static/smart/img/avatars/male.png" alt="${user.name}" class="online"/>
						<span>
                            ${user.name}
                        </span>
						<i class="fa "></i>
					</a> 
					
				</span>
    </div>
    <!-- end user info -->

    <!-- NAVIGATION : This navigation is also responsive

    To make this navigation dynamic please make sure to link the node
    (the reference to the nav > ul) after page load. Or the navigation
    will not initialize.
    -->
    <nav>
        <!--
        NOTE: Notice the gaps after each icon usage <i></i>..
        Please note that these links work a bit different than
        traditional href="" links. See documentation for details.
        -->

        <ul>
            <c:set var="index" value="0" scope="request"/>
            <c:set var="level" value="0" scope="request"/>
            <c:import url="menu.jsp"/>
        </ul>
    </nav>

    <!--
    <a href="#ajax/difver.html" class="btn btn-primary nav-demo-btn">AngularJS, PHP and .Net Versions</a>
    -->
    <span class="minifyme" data-action="minifyMenu"> <i class="fa fa-arrow-circle-left hit"></i> </span>

</aside>
<!-- END NAVIGATION -->

<!-- #MAIN PANEL -->
<div id="main" role="main">
    <!-- #MAIN CONTENT -->

    <div id="content">
    </div>
    <!-- END #MAIN CONTENT -->

</div>
<!-- END #MAIN PANEL -->

<!-- #PAGE FOOTER
<div class="page-footer">
    <div class="row">
        <div class="col-xs-12 col-sm-6">
            <span class="txt-color-white">SmartAdmin 1.5 <span class="hidden-xs"> - Web Application Framework</span> © 2014-2015</span>
        </div>

        <div class="col-xs-6 col-sm-6 text-right hidden-xs">
            <div class="txt-color-white inline-block">
                <i class="txt-color-blueLight hidden-mobile">Last account activity <i class="fa fa-clock-o"></i> <strong>52 mins ago &nbsp;</strong> </i>
                <div class="btn-group dropup">
                    <button class="btn btn-xs dropdown-toggle bg-color-blue txt-color-white" data-toggle="dropdown">
                        <i class="fa fa-link"></i> <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right text-left">
                        <li>
                            <div class="padding-5">
                                <p class="txt-color-darken font-sm no-margin">Download Progress</p>
                                <div class="progress progress-micro no-margin">
                                    <div class="progress-bar progress-bar-success" style="width: 50%;"></div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="padding-5">
                                <p class="txt-color-darken font-sm no-margin">Server Load</p>
                                <div class="progress progress-micro no-margin">
                                    <div class="progress-bar progress-bar-success" style="width: 20%;"></div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li >
                            <div class="padding-5">
                                <p class="txt-color-darken font-sm no-margin">Memory Load <span class="text-danger">*critical*</span></p>
                                <div class="progress progress-micro no-margin">
                                    <div class="progress-bar progress-bar-danger" style="width: 70%;"></div>
                                </div>
                            </div>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <div class="padding-5">
                                <button class="btn btn-block btn-default">refresh</button>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>

        </div>

    </div>

</div>
-->
<!-- END FOOTER -->

<!-- #SHORTCUT AREA : With large tiles (activated via clicking user name tag)
     Note: These tiles are completely responsive, you can add as many as you like -->
<div id="shortcut">
    <ul>
        <c:forEach items="${shortcuts }" var="st">
            <c:if test="${not empty st.uri and not empty st.screenName }">
                <li>
                    <a href="#${st.uri}" class="jarvismetro-tile big-cubes bg-color-blue">
                        <c:if test="${not empty st.normalCss}">
									<span class="iconbox"> <i class="fa ${st.normalCss} fa-4x"></i> 
										<span style="text-align: center;">${st.screenName }</span> 
									</span>
                        </c:if>
                        <c:if test="${empty st.normalCss}">
									<span class="iconbox"> <i class="fa fa-hand-o-right fa-4x"></i> 
										<span style="text-align: center;">${st.screenName }</span> 
									</span>
                        </c:if>

                    </a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>
<!-- END SHORTCUT AREA -->

<div id="globalHistoryReport">
    <ul>
    </ul>
</div>
<!--================================================== -->

<!-- PACE LOADER - turn this on if you want ajax loading to show (caution: uses lots of memory on iDevices)
<script data-pace-options='{ "restartOnRequestAfter": true }' src="js/plugin/pace/pace.min.js"></script>-->


<!-- #PLUGINS -->
<!-- Link to Google CDN's jQuery + jQueryUI; fall back to local -->
<script src="${ctx}/static/smart/js/libs/jquery-2.1.1.min.js"></script>
<script>
    if (!window.jQuery) {
        document.write('<script src="${ctx}/static/smart/js/libs/jquery-2.1.1.min.js"><\/script>');
    }
</script>
<script src="${ctx}/static/plugin/jquery.serializejson.min.js"></script>
<script src="${ctx}/static/smart/js/libs/jquery.md5.js"></script>
<script src="${ctx}/static/smart/js/libs/jquery-ui-1.11.4.min.js"></script>
<script>
    if (!window.jQuery.ui) {
        document.write('<script src="${ctx}/static/smart/js/libs/jquery-ui-1.11.4.min.js"><\/script>');
    }
</script>

<!-- IMPORTANT: APP CONFIG -->
<script src="${ctx}/static/smart/js/app.config.js"></script>

<!-- JS TOUCH : include this plugin for mobile drag / drop touch events-->
<script src="${ctx}/static/smart/js/plugin/jquery-touch/jquery.ui.touch-punch.min.js"></script>

<!-- BOOTSTRAP JS -->
<script src="${ctx}/static/smart/js/bootstrap/bootstrap.min.js"></script>

<!-- CUSTOM NOTIFICATION -->
<script src="${ctx}/static/smart/js/notification/SmartNotification.min.js"></script>

<!-- JARVIS WIDGETS -->
<script src="${ctx}/static/smart/js/smartwidgets/jarvis.widget.min.js"></script>

<!-- EASY PIE CHARTS -->
<script src="${ctx}/static/smart/js/plugin/easy-pie-chart/jquery.easy-pie-chart.min.js"></script>

<!-- SPARKLINES -->
<script src="${ctx}/static/smart/js/plugin/sparkline/jquery.sparkline.min.js"></script>

<!-- JQUERY VALIDATE -->
<%-- 		<script src="${ctx}/static/smart/js/plugin/jquery-validate/jquery.validate.min.js"></script>  --%>
<%-- 		<script src="${ctx}/static/smart/js/plugin/jquery-validate/messages_zh.min.js"></script> --%>

<script src="${ctx}/static/plugin/jquery-validate/jquery.validate.min.js"></script>
<script src="${ctx}/static/plugin/jquery-validate/jquery.validate.messages.js"></script>
<%-- 		<script src="${ctx}/static/plugin/jquery-validate/localization/messages_zh.min.js"></script> --%>

<!-- JQUERY MASKED INPUT -->
<script src="${ctx}/static/smart/js/plugin/masked-input/jquery.maskedinput.min.js"></script>
<!-- JQUERY SELECT2 INPUT -->
<script src="${ctx}/static/smart/js/plugin/select2/select2.min.js"></script>

<!-- JQUERY UI + Bootstrap Slider -->
<script src="${ctx}/static/smart/js/plugin/bootstrap-slider/bootstrap-slider.min.js"></script>

<!-- browser msie issue fix -->
<script src="${ctx}/static/smart/js/plugin/msie-fix/jquery.mb.browser.min.js"></script>

<!-- FastClick: For mobile devices: you can disable this in app.js -->
<script src="${ctx}/static/smart/js/plugin/fastclick/fastclick.min.js"></script>

<!--[if IE 8]>
<h1>Your browser is out of date, please update your browser by going to www.microsoft.com/download</h1>
<![endif]-->

<!-- Demo purpose only-->
<%-- 		<script src="${ctx}/static/smart/js/demo.min.js"></script> --%>

<!-- MAIN APP JS FILE 	-->


<!-- ENHANCEMENT PLUGINS : NOT A REQUIREMENT -->
<!-- Voice command : plugin -->
<script src="${ctx}/static/smart/js/speech/voicecommand.min.js"></script>

<!-- SmartChat UI : plugin -->
<script src="${ctx}/static/smart/js/smart-chat-ui/smart.chat.ui.min.js"></script>
<script src="${ctx}/static/smart/js/smart-chat-ui/smart.chat.manager.min.js"></script>


<script type="text/javascript" src="${ctx}/static/smart/plugin/jqgrid/grid.locale-cn.js"></script>
<script type="text/javascript" src="${ctx}/static/smart/plugin/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${ctx}/static/plugin/layer/layer.js"></script>
<script type="text/javascript" src="${ctx}/static/smart/plugin/isct-plugin.js"></script>

<script src="${ctx}/static/modules/main.js"></script>
<script src="${ctx}/static/smart/js/app.debug.js"></script>
<script src="${ctx}/static/plugin/My97DatePicker/WdatePicker.js"></script>

<!-- 工作流相关API -->
<script src="${ctx}/static/smart/plugin/isct-wf.js"></script>
<!-- websocket相关API -->
<script src="${ctx}/static/smart/plugin/isct-websocket.js"></script>
<script>
    (function($){
        $('#main').css({
        "min-height":$(document).height()-55
        })
        console.log($(document).height());
        $('body').css({
        	overflow:'hidden'
        });
        $('html').css({
        	overflow:'hidden'
        });
        
        $('#logo>img').attr('src','/glaf2-web/static/smart/img/toyota11.png');
            
      
       
    })($)
    
</script>
</body>

</html>
