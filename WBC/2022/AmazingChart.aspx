<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AmazingChart.aspx.cs" Inherits="testfinal_AmazingChart" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>DssSolutions | Amazing Chart </title>
    <meta property="og:title" content="DssSolutions | Amazing Chart" />
    <meta property="og:type" content="website" />
    <meta content=" " property="og:image">
    <meta property="og:site_name" content="DssSolutions" />
    <meta property="og:description" content=" " />
    <script async="" src="./Scripts/analytics.js" type="text/javascript"></script>
    <link href="Styles/LoginPopUp.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-41663228-1', 'dsssolutions.com');
        ga('send', 'pageview');

    </script>
    <link href="http://developmentdss.azurewebsites.net/favicon.ico" rel="shortcut icon"
        type="image/x-icon" />
    <link rel="icon" href="http://www.dsssolutions.com/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="http://www.dsssolutions.com/favicon.ico" type="image/x-icon" />
    <script src="./Scripts/jquery-1.7.2.min.js" type="text/javascript"></script>
    <style type="text/css"></style>
    <link href="Styles/forms.css" rel="stylesheet" type="text/css" />
    <link href="Styles/framework.css" rel="stylesheet" type="text/css" />
    <link href="Styles/gallery.css" rel="stylesheet" type="text/css" />
    <link href="Styles/homepage.css" rel="stylesheet" type="text/css" />
    <script src="./Scripts/jquery-defaultvalue.js" type="text/javascript"></script>
    <script src="./Scripts/jquery-mobilemenu.min.js" type="text/javascript"></script>
    <link href="Styles/navi.css" rel="stylesheet" type="text/css" />
    <link href="Styles/portfolio.css" rel="stylesheet" type="text/css" />
    <link href="./Styles/SlidStyle.css" rel="stylesheet" type="text/css" />
    <link href="Styles/tables.css" rel="stylesheet" type="text/css" />
    <script src="./Scripts/slide2.js" type="text/javascript"></script>
    <link href="./Styles/style.css" rel="stylesheet" type="text/css" />
    <script src="./Scripts/Slide3.js" type="text/javascript"></script>
    <script src="./Scripts/slides.min.jquery.js" type="text/javascript"></script>
    <link href="./Styles/global.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="./Styles/style(1).css" />
    <script src="Scripts/jquery.rwdImageMaps.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            // Set starting slide to 1
            var startSlide = 1;
            // Get slide number if it exists
            if (window.location.hash) {
                startSlide = window.location.hash.replace('#', '');
            }
            // Initialize Slides
            $('#slideAC').slides({
                preload: true,
                preloadImage: 'Image/loading.gif',
                generatePagination: true,
                play: 5000,
                pause: 2500,
                hoverPause: true,
                // Get the starting slide
                start: startSlide,
                animationComplete: function (current) {

                }
            });
        });
        $(document).ready(function () {
            var animTime = 300,
      clickPolice = false;

            $(document).on('touchstart click', '.acc-btn', function () {
                if (!clickPolice) {
                    clickPolice = true;

                    var currIndex = $(this).index('.acc-btn'),
          targetHeight = $('.acc-content-inner').eq(currIndex).outerHeight();
                    targetHeight = targetHeight + 8;
                    $('.acc-btn h1').removeClass('selected');
                    $(this).find('h1').addClass('selected');

                    $('.acc-content').stop().animate({ height: 0 }, animTime);
                    $('.acc-content').eq(currIndex).stop().animate({ height: targetHeight }, animTime);

                    setTimeout(function () { clickPolice = false; }, animTime);
                }

            });

        });
    </script>
    <script type="text/javascript">
        function expand() {
            $('#content').animate({ "height": "toggle" }, { duration: "fast" });
            contenttest
            $('#contenttest').animate({ "height": "toggle" }, { duration: "fast" });
            $('#login_form').css("display", "");
        }
        function f() {

            $('#contenttest').animate({ "height": "toggle" }, { duration: "fast" });
            //    $('#contenttest').css("display", "");
        }
    </script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#cover').fadeOut(1000);

        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('img[usemap]').rwdImageMaps();
            $('.topnav').mobileMenu({
                combine: false,
                switchWidth: 600,
                indentString: '&nbsp;&nbsp;&nbsp;',
                prependTo: 'nav#topnav'
            });
        }); function loadingScreen() {
            var html = '<div id="load"></div>';
            $('section').append(html);
            //                setTimeout(function () {
            //                    $('#load').remove();
            //                }, responseTime);
        }
        $(document).ready(function () {
            $('#loginbtn').click(function () {
                if ($.trim($('#Usernametxt').val()) != "" && $.trim( $('#Passwordtxt').val()) != "")
                validlogin($('#Usernametxt').val(), $('#Passwordtxt').val());
                return false;
            });
            $('#btnRtPassword').click(function () {
                if ($.trim($('#txtFPassword').val()) != "")
                ResetPW($('#txtFPassword').val());
                return false;
            });
            $('#btnReset').click(function () {
                if ($.trim($('#txtOldPW').val()) != "" && $.trim($('#txtNewPW').val()) != "" &&( $.trim($('#txtNewPW').val())==$.trim($('#txtCnewPW').val())))
                    RefreshPW($('#txtOldPW').val(), $('#txtNewPW').val());
                return false;
            });
        });
        function setContainerToCenter($profContainerPopUp) {
            var $this = $profContainerPopUp;
            var contHeight = $this.innerHeight();
            var contWidth = $this.innerWidth();
            var winHeight = $(window).innerHeight();
            var winWidth = $(window).innerWidth();
            var top = 0;
            if (winHeight > contHeight) {
                top = (winHeight - contHeight) / 2;
                $this.css('top', (top) + 'px').css('position', 'fixed');
            }
            else {
                $this.css('top', '320px').css('position', 'absolute');
            }
            $this.css('left', (winWidth - contWidth) / 2 + 'px');
        }

        function validlogin(username, password) {
            // loadingScreen();


            if ($(".imgload").hasClass('disNone')) {

                $(".imgload").addClass('disblk').removeClass('disNone');
            }
           
            var args = {
                un: username, pw: password
            }

            $.ajax({
                type: "POST",
                url: "AmazingChart.aspx/validlogin",
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "Fx") {
                        if (data.d != "0") {
                            if ($(".loginPopUp").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".loginPopUp").addClass('hide').removeClass('popContainer');
                            }
                            if ($(".RegisterPopUp").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".RegisterPopUp").addClass('hide').removeClass('popContainer');
                            }
                            if ($(".fpPopUp").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".fpPopUp").addClass('hide').removeClass('popContainer');
                            }

                            $("#registerlink").addClass('disNone').removeClass('disblk');
                            $("#lnkLogout").addClass('disblk').removeClass('disNone');
                            $("#spanName").html("Welcome " + data.d);
                        } else {
                            $(".loginReset").removeClass("hide").addClass("popContainer");

                            if ($(".loginPopUp").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".loginPopUp").addClass('hide').removeClass('popContainer');
                            }
                            setContainerToCenter($(".loginReset"));
                        }
                    } else {

                        $("#divMsg").html("Login Failed");
                        $(".loginFgSection").css("height", "174px");
                    }
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                },
                error: function () {
                    alert("Some thing went wrong");
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                }

            });

        }
        function RefreshPW(oldpw, newpw) {
            // loadingScreen();


            if ($(".imgload").hasClass('disNone')) {

                $(".imgload").addClass('disblk').removeClass('disNone');
            }

            var args = {
                oldpw: oldpw, newpw: newpw
            }

            $.ajax({
                type: "POST",
                url: "AmazingChart.aspx/RefreshPwd",
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    if (data.d != "Fx") {
                        if (data.d == "l") {
                            alert("Session is expired! Please login to change password");
                           

                            if ($(".loginReset").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".loginReset").addClass('hide').removeClass('popContainer');
                            }
                          
                            if ($(".loginPopUp").hasClass('hide')) {
                                $(".overlaybg").addClass('popContainer');
                                $(".loginPopUp").addClass('popContainer').removeClass('hide');
                            } setContainerToCenter($(".loginPopUp"));
                            $("#divCPW").html("");
                        }else if (data.d == "n") {
                            $("#divCPW").html("The old password is not matched");

                        } else {
                            $("#divCPW").html("");
                            $("#registerlink").addClass('disNone').removeClass('disblk');
                            $("#lnkLogout").addClass('disblk').removeClass('disNone');
                            $("#spanName").html("Welcome " + data.d);
                            if ($(".loginReset").hasClass('popContainer')) {
                                $(".overlaybg").addClass('hide');
                                $(".loginReset").addClass('hide').removeClass('popContainer');
                            }
                        }
                    }
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                },
                error: function () {
                    alert("Some thing went wrong");
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                }

            });

        }
        function ResetPW(username) {
            var args = {
                un: username
            }
            if ($(".imgload").hasClass('disNone')) {

                $(".imgload").addClass('disblk').removeClass('disNone');
            }
            $.ajax({
                type: "POST",
                url: "AmazingChart.aspx/ResetPW",
                data: JSON.stringify(args),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {


                    $("#divFMsg").html(data.d);
                    $(".loginFgSection").css("height", "150px");
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                },
                error: function () {
                    alert("Some thing went wrong");
                    if ($(".imgload").hasClass('disblk')) {

                        $(".imgload").addClass('disNone').removeClass('disblk');
                    }
                }
            });
          
        }
    </script>
    <link rel="stylesheet" href="./Styles/layout.css" type="text/css" media="all" />
    <style type="text/javascript">
        #cover
        {
            background: url("http://www.dsssolutions.com/Images/332.gif") no-repeat scroll center center #FFF;
            position: absolute;
            height: 100%;
            width: 100%;
        }
        .auto-style1
        {
            width: 932px;
        }
    </style>
    <!--[if lt IE 9]>
<link rel="stylesheet" href="styles/ie.css" type="text/css" media="all" />
<script src="scripts/css3-mediaqueries.min.js"></script>
<script src="scripts/html5shiv.min.js"></script>
<![endif]-->
    <!-- HOMEPAGE ONLY -->
    <link rel="stylesheet" href="./Styles/flexslider.css" type="text/css" media="all" />
    <script src="./Scripts/jquery-flexslider.min.js" type="text/javascript"></script>
    <script src="./Scripts/jquery-flexslider-setup.js" type="text/javascript"></script>
    <script type="text/javascript">
        function show() {
            benefitsImageStyle("#img", "#benefits");
        }
        function show1() {
            benefitsImageStyle("#img1", "#benefits1");
        }
        function show2() {
            benefitsImageStyle("#img2", "#benefits2");
        }
        function show3() {
            benefitsImageStyle("#img3", "#benefits3");
        }
        function show4() {
            benefitsImageStyle("#img4", "#benefits4");
        }
        function show5() {
            benefitsImageStyle("#img5, #img12", "#benefits5, #benefits12");
            //            benefitsImageStyle("#img12", "#benefits12");
        }
        function show6() {
            // benefitsImageStyle("#img6", "#benefits6");
            benefitsImageStyle("#img6, #img13", "#benefits6, #benefits13");
        }
        function show7() {
            //  benefitsImageStyle("#img7", "#benefits7");
            benefitsImageStyle("#img7, #img14", "#benefits7, #benefits14");
        }
        function show8() {
            // benefitsImageStyle("#img8", "#benefits8");
            benefitsImageStyle("#img8, #img15", "#benefits8, #benefits15");
        }
        function show9() {
            // benefitsImageStyle("#img9", "#benefits9");
            benefitsImageStyle("#img9, #img16", "#benefits9, #benefits16");
        }
        function show10() {
            // benefitsImageStyle("#img10", "#benefits10");
            benefitsImageStyle("#img10, #img17", "#benefits10, #benefits17");
        }
        function show11() {
            //benefitsImageStyle("#img11", "#benefits11");
            benefitsImageStyle("#img11, #img18", "#benefits11, #benefits18");
        }
        function show12() {
            //            benefitsImageStyle("#img12", "#benefits12");
            //            benefitsImageStyle("#img5", "#benefits5");
            benefitsImageStyle("#img5, #img12", "#benefits5, #benefits12");
        }
        function show13() {
            //  benefitsImageStyle("#img13", "#benefits13");
            benefitsImageStyle("#img6, #img13", "#benefits6, #benefits13");
        }

        function show14() {
            // benefitsImageStyle("#img14", "#benefits14");
            benefitsImageStyle("#img7, #img14", "#benefits7, #benefits14");
        }
        function show15() {
            //benefitsImageStyle("#img15", "#benefits15");
            benefitsImageStyle("#img8, #img15", "#benefits8, #benefits15");
        }
        function show16() {
            // benefitsImageStyle("#img16", "#benefits16");
            benefitsImageStyle("#img9, #img16", "#benefits9, #benefits16");
        }
        function show17() {
            // benefitsImageStyle("#img17", "#benefits17");
            benefitsImageStyle("#img10, #img17", "#benefits10, #benefits17");
        }
        function show18() {
            // benefitsImageStyle("#img18", "#benefits18");
            benefitsImageStyle("#img11, #img18", "#benefits11, #benefits18");
        }


        function benefitsImageStyle(imageId, benefitsId) {
            $(".benefitsCls").removeClass("showbenefitsCls").addClass("hidebenefitsCls");
            $(".imgNew").removeClass("imagedisplayborder").addClass("imagebordernone");
            $(imageId).addClass("imagedisplayborder").removeClass("imagebordernone");
            $(benefitsId).addClass("showbenefitsCls").removeClass("hidebenefitsCls");
        }
    </script>
    <script type="text/javascript">
        function close() {
            if (document.getElementById('benefits').style.display == 'block') {
                document.getElementById('benefits').style.display = 'none';
            }
        }
        function scrolldown() {
            $("html, body").animate({ scrollTop: 800 }, 600);
            return false;
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.registrationlink').click(function (e) {
                if ($(".imgload").hasClass('disblk')) {

                    $(".imgload").addClass('disNone').removeClass('disblk');
                }
                e.preventDefault();
                e.stopImmediatePropagation();
                //alert("hii");
                $(".loginPopUp").removeClass("hide").addClass("popContainer");
                $(".RegisterPopUp").addClass("hide").removeClass("popContainer");
                $(".fpPopUp").addClass("hide").removeClass("popContainer");
                $(".overlaybg").removeClass("hide");
                $("#divMsg").html("");
                $(".loginFgSection").css("height", "155px");
                setContainerToCenter($(".loginPopUp"));
                $("#Usernametxt").val($("#txtFPassword").val());
            });
            $('.registerlink').click(function (e) {
                if ($(".imgload").hasClass('disblk')) {

                    $(".imgload").addClass('disNone').removeClass('disblk');
                }
                $("#Usernametxt").val("");
                $("#Passwordtxt").val("");
                $("#divMsg").html("");
                e.preventDefault();
                e.stopImmediatePropagation();
                //alert("hii");
                $(".loginPopUp").removeClass("hide").addClass("popContainer");
                $(".RegisterPopUp").addClass("hide").removeClass("popContainer");
                $(".fpPopUp").addClass("hide").removeClass("popContainer");
                $(".overlaybg").removeClass("hide");
                setContainerToCenter($(".loginPopUp"));
                $(".loginFgSection").css("height", "155px");
            });
            $('#aReg').click(function (e) {
                window.open('http://developmentdss.azurewebsites.net/DssUser/DssUserOverview.aspx?f=reg', '_blank');
               // window.location.href = "http://developmentdss.azurewebsites.net/DssUser/DssUserOverview.aspx?f=reg";
                //                e.preventDefault();
                //                e.stopImmediatePropagation();
                //                //alert("hii");
                //                $(".RegisterPopUp").removeClass("hide").addClass("popContainer");
                //                $(".loginPopUp").addClass("hide").removeClass("popContainer");
                //                $(".fpPopUp").addClass("hide").removeClass("popContainer");
                //                $(".overlaybg").removeClass("hide");
                //                setContainerToCenter($(".RegisterPopUp"));
            });
            $('#a1').click(function (e) {
                window.open('http://developmentdss.azurewebsites.net/DssUser/DssUserOverview.aspx?f=reg', '_blank');
               // window.location.href = "http://developmentdss.azurewebsites.net/DssUser/DssUserOverview.aspx?f=reg";
                //                e.preventDefault();
                //                e.stopImmediatePropagation();
                //                //alert("hii");
                //                $(".RegisterPopUp").removeClass("hide").addClass("popContainer");
                //                $(".loginPopUp").addClass("hide").removeClass("popContainer");
                //                $(".fpPopUp").addClass("hide").removeClass("popContainer");
                //                $(".overlaybg").removeClass("hide");
                //                setContainerToCenter($(".RegisterPopUp"));
            });
            $('#aFW').click(function (e) {
                if ($(".imgload").hasClass('disblk')) {

                    $(".imgload").addClass('disNone').removeClass('disblk');
                }
                e.preventDefault();
                e.stopImmediatePropagation();
                //alert("hii");
                $(".fpPopUp").removeClass("hide").addClass("popContainer");
                $(".RegisterPopUp").addClass("hide").removeClass("popContainer");
                $(".loginPopUp").addClass("hide").removeClass("popContainer");
                $(".overlaybg").removeClass("hide");
                $(".loginFgSection").css("height", "130px");
                $("#txtFPassword").val($("#Usernametxt").val());

                setContainerToCenter($(".fpPopUp"));
            });
            $(".overlaybg").click(function () {
                if ($(".loginPopUp").hasClass('popContainer')) {
                    $(".overlaybg").addClass('hide');
                    $(".loginPopUp").addClass('hide').removeClass('popContainer');
                }
            });
            $(".closebtn").click(function () {
                if ($(".imgload").hasClass('disblk')) {

                    $(".imgload").addClass('disNone').removeClass('disblk');
                }
                if ($(".loginPopUp").hasClass('popContainer')) {
                    $(".overlaybg").addClass('hide');
                    $(".loginPopUp").addClass('hide').removeClass('popContainer');
                }
                if ($(".RegisterPopUp").hasClass('popContainer')) {
                    $(".overlaybg").addClass('hide');
                    $(".RegisterPopUp").addClass('hide').removeClass('popContainer');
                }
                if ($(".fpPopUp").hasClass('popContainer')) {
                    $(".overlaybg").addClass('hide');
                    $(".fpPopUp").addClass('hide').removeClass('popContainer');
                }
                if ($(".loginReset").hasClass('popContainer')) {
                    $(".overlaybg").addClass('hide');
                    $(".loginReset").addClass('hide').removeClass('popContainer');
                }
            });
            function setContainerToCenter($profContainerPopUp) {
                var $this = $profContainerPopUp;
                var contHeight = $this.innerHeight();
                var contWidth = $this.innerWidth();
                var winHeight = $(window).innerHeight();
                var winWidth = $(window).innerWidth();
                var top = 0;
                if (winHeight > contHeight) {
                    top = (winHeight - contHeight) / 2;
                    $this.css('top', (top) + 'px').css('position', 'fixed');
                }
                else {
                    $this.css('top', '320px').css('position', 'absolute');
                }
                $this.css('left', (winWidth - contWidth) / 2 + 'px');
            }


        });

        function clicklogin1() {
        var resu;
        if ($(".imgload").hasClass('disNone')) {

            $(".imgload").addClass('disblk').removeClass('disNone');
        }
        var jqxhr = $.ajax({
            type: "POST",
            url: "AmazingChart.aspx/checklogin",
            data: '{un: "login4" }',
            global: false,
            async: false,
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                resu = data.d;
                return data.d;
                if ($(".imgload").hasClass('disblk')) {

                    $(".imgload").addClass('disNone').removeClass('disblk');
                }
            }
        }).responseText;
        if (resu == "y")
            return true;
        else if (resu == "0") {
            $(".loginReset").removeClass("hide").addClass("popContainer");

           
            setContainerToCenter($(".loginReset"));
        }
        else {
            alert("Please login to download document");
            $('.registerlink').click();
            return false;
        }
        }

    </script>
</head>
<body id="hcaBody">
    <form runat="server" id="form1">
    <div style="background: #fff; border-right: none !important; min-width: 800px;">
        <div class="wrapper row1" style="float: right; margin-right: 10px; min-width: 800px;">
            <div class="loginandpunch">
                <div class="userlogin">
                    <a runat="server" href="#" class="registerlink" id="registerlink">Login</a>
                    <asp:LinkButton CssClass="disNone logoutlink" ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    <span id="spanName" runat="server" style="margin-left: 5px; margin-right: 20px; font-family: Verdana; font-size: 12px;">
                       </span>
                </div>
                <div class="imgpunchline">
                    <img id="imgpunchline" src="./Content/Images/punchline.gif" alt="" /></div>
                <div class="clear">
                </div>
            </div>
        </div>
        <div class="headerLogoSection" style="min-width: 800px;">
            <div id="Dsslog">
                <hgroup>
      <h1><a target="_blank" href="http://www.dsssolutions.com"><img src="./Content/Images/dss_logo.gif" alt="Dss Solutions"></a>
      </h1>
      
      
    </hgroup>
            </div>
            <div id="topnavimg">
                <%--<div class="followUs">
                    <h1 class="Header1 headTitle">
                        Follow Dss
                    </h1>
                </div>--%>
                <div class="socialicons">
                    <ul class="topnav clear">
                        <li class="active"><a target="_blank" href="http://www.linkedin.com/company/dss-cloud-solutions?trk=hb_tab_compy_id_3070041">
                            <img src="./Content/Images/linkedin.png" alt="Linkedin" /></a></li>
                        <li><a target="_blank" href="https://www.facebook.com/pages/Dss-SOlutions/494035473999001">
                            <img src="./Content/Images/facebook.png" alt="Facebook"></a></li>
                        <li><a target="_blank" href="https://twitter.com/dsssolutionsUSA">
                            <img src="./Content/Images/twitter.png" alt="twitter" /></a></li>
                        <li><a href="http://developmentdss.azurewebsites.net/AmazingChart.aspx#">
                            <img src="./Content/Images/Gplus.png" alt="Google+"></a></li>
                        <li class="last"><a href="http://developmentdss.azurewebsites.net/AmazingChart.aspx#">
                            <img src="./Content/Images/youtube.png" alt="YouTube" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="DssCommitmentbtmMiddle">
                <div class="contactusLogo">
                    <div style="float: left;">
                        <span>
                            <img src="./Content/Images/CallUs.png" alt="Call-Us" style="height: 20px" />
                        </span><span id="Span5" class="ContactHeaders">(202)256-6867</span><p style="font-size: 12px;
                            padding-top: 5px;">
                            <a id="A2" target="_blank" href="http://developmentdss.azurewebsites.net/DssUser/ContactUs.aspx"
                                style="color: Blue; font-weight: bold; padding-top: 5px;">ContactDss ®</a></p>
                    </div>
                    <div class="one_quarter" style="float: left;">
                        <span>
                            <img src="./Content/Images/contactUs2.jpg" alt="contactus" /></span></div>
                </div>
            </div>
        </div>
    </div>
    <div class="bodysectionsubrightImg" style="min-width: 800px;">
        <img src="./Content/Images/AmazingCharts.png" usemap="#Map" alt="" />
        <map name="Map" id="Map1">
            <area shape="rect" coords="747,132,1046,157" onclick="show5(),scrolldown()" href="#"
                alt="Amazing Charts EHR/PH" />
            <area shape="rect" coords="683,160,1133,185" onclick="show1(),scrolldown()" href="#"
                alt="Microsoft Collaboration Management" />
            <area shape="rect" coords="763,188,1036,214" onclick="show2(),scrolldown()" href="#"
                alt="Content Management" />
            <area shape="rect" coords="783,217,1028,245" onclick="show3(),scrolldown()" href="#"
                alt="Business Analytics" />
            <area shape="rect" coords="735,274,1075,298" onclick="show3(),scrolldown()" href="#"
                alt="Tableau Data Visualization" />
            <area shape="rect" coords="655,335,1165,364" onclick="show4(),scrolldown()" href="#"
                alt="Dss Solutions Healthcare Analytics Cloud" />
            <area shape="rect" coords="1095,255,1165,275" onclick="show5(),scrolldown()" href="#"
                alt="EHR/PH" />
            <area shape="rect" coords="1095,287,1350,315" onclick="show(),scrolldown()" href="#"
                alt="Integrated Healthcare" />
        </map>
        <%--<div class="herocontent">
        <a href="">Amazing Charts EHR/PH</a>,</br>
            <a href="">Microsoft Collaboration Management</a>,</br>
        <a href="">Content Management</a>,</br>
            <a href="">Business Analytics</a></br>
                and</br>
            <a href="">Tableau Data Visualization</a></br>
                On</br>
            <a href="">Dss Solutions Healthcare Analytics Cloud</a>


        </div>--%>
    </div>
    <div id="mainbody" style="min-width: 800px;">
        <div class="bodysection">
            <div class="bodysectionsub">
                <div class="bodysectionsubleft">
                    <div class="tbl">
                        <div class="DssCommitment tbltd">
                            <h1 class="Headers headTitle">
                                DSS Mission &amp; Commitment</h1>
                            <p class="Font">
                                <b class="Boldcolor">Dss Solutions</b> has one important mission for Healthcare
                                Industry, SMB(Small and Midsize practices) clients; to partner and integrate the
                                best EHR/PM solutions with Dss Healthcare Analytics, Content Management and Total
                                Collaboration on very high secured cloud with full data conversion from any EHR/PM
                                system, and to make it affordable, easy to use and free to try. <b class="Boldcolor">
                                    Dss Solutions</b> and <b class="Boldcolor">Amazing Charts</b> are partnered
                                to provide the best <b class="Boldcolor">Cloud Integrated Healthcare Solutionsto your
                                    practice</b>, any size, with our Amazing ValueAdds, LOCAL Service, LOCAL Support
                                and LOCAL Training.
                            </p>
                        </div>
                        <div class="bodysecondrow">
                            <div class="tbl">
                                <div class="DssCommitment1 DssCommitment4 tbltd">
                                    <h1 class="Header2 headTitle">
                                        Easy To Use
                                    </h1>
                                    <p class="Font">
                                        Multiple Studies show that Amazing Charts is the <b class="Boldcolor">most usable EHR
                                            system on the market.</b> Frustrated with slow software that requires dozens
                                        of clikcs to document a simple note? Overwhelmed by confusing windows and menus?
                                        Then Amazing Chart is for you!
                                    </p>
                                    <p class="PFont2">
                                        <a href="http://amazingcharts.com/why-us/the-1-rated-ehr/" class="Boldcolor" target="blank">
                                            Learn More</a>
                                    </p>
                                </div>
                                <div class="DssCommitment1 DssCommitment3 tbltd">
                                    <h1 class="Header4 headTitle">
                                        Affordable
                                    </h1>
                                    <p class="Font">
                                        <b class="Boldcolor">Priced at just $1,200 per clinician license</b> (one time)
                                        and $1,195/year for ongoing support, maintenance, and even e-Prescribing, Amazing
                                        Charts is not onlyt the #1 rated ambulatory EHR, it is a solution you can actually
                                        afford. Keep more of your stimulus dollars...
                                    </p>
                                    <p class="PFont1">
                                        <a href="http://amazingcharts.com/products/transparent-pricing/" class="Boldcolor"
                                            target="blank">Fair &amp; Transparent Pricing</a>
                                    </p>
                                </div>
                                <div class="DssCommitment1 DssCommitment2 tbltd">
                                    <h1 class="Header3 headTitle">
                                        Free To Try
                                    </h1>
                                    <p class="Font">
                                        Amazing Charts is <b class="Boldcolor">FREE to try in you own practice.</b> Even
                                        the most computer-phobic clinician can download Amazing Charts and start documenting
                                        patient visits in just minutes.
                                    </p>
                                    <p class="PFont" id="downloadlink">
                                    <asp:LinkButton CommandArgument="8" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton5" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                        <%-- %><a href="http://dsssolutions.com/DssUser/ContactUs.aspx" class="Boldcolor" target="blank"> Download</a> --%>
                                    </p>
                                </div>
                                <div class="DssCommitmentNews tbltd">
                                    <h1 class="Headers Header10 headTitle">
                                        Latest News and Headlines
                                    </h1>
                                    <div id="slideAC">
                                        <div class="slides_container" id="slidecontainer" style="overflow: hidden; position: relative;
                                            display: block; width: 100%;">
                                            <asp:Repeater ID="RepDetails" runat="server">
                                                <ItemTemplate>
                                                    <div class="slide" style="width: 95%; height: 220px; position: absolute; top: 0px;
                                                        left: 750px; z-index: 0; display: none;">
                                                        <p>
                                                            <a target="_blank" style="font-size: 11px; font-family: Verdana;" href='<%#Eval("News_URL") %>'>
                                                                <%#Eval("News_Summary")%></a>
                                                        </p>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <%--   <div class="slide" style="width: 95%; height: 220px; position: absolute; top: 0px;
                                                left: 750px; z-index: 0; display: none;">
                                                <p>
                                                    <a style="font-size: 11px; font-family: Verdana;" href="http://developmentdss.azurewebsites.net/Dss%20news/dssnews%20overview.aspx?dssnews=As%20well%20as%20being%20a%20sign%20of%20the%20growing%20confidence%20about%20business%20conditions%20within%20the%20oil%20and%20gas%20sector,%20that%20level%20of%20spending%20demonstrates%20the%20scale%20of%20opportunity%20for%20using%20predictive%20analytics%20software%20to%20help%20extract%20maximum%20value%20from%20the%20high%20capital%20costs%20that%20mark%20out%20the%20industry.">
                                                        "Predictive analytics used to cut costs in oil sector" </a>
                                                </p>
                                            </div>
                                            <div class="slide" style="width: 95%; height: 220px; position: absolute; top: 0px;
                                                left: 750px; z-index: 0; display: none;">
                                                <p>
                                                    <a style="font-size: 11px; font-family: Verdana;" href="http://developmentdss.azurewebsites.net/Dss%20news/dssnews%20overview.aspx?dssnews=Leading%20organizations%20are%20looking%20to%20improve%20business%20outcomes%20by%20predicting%20with%20confidence%20what%20will%20happen%20next.%20Easy%20to%20say,%20but%20hard%20to%20do,%20especially%20when%20you%20consider%20having%20to%20analyze%20the%20volume,%20variety%20and%20velocity%20of%20streaming%20data%20that%20flows%20all%20around%20us.">
                                                        "Using Predictive Analytics to Improve Decision Making and Business Outcomes"
                                                    </a>
                                                </p>
                                            </div>
                                            <div class="slide" style="width: 95%; height: 220px; position: absolute; top: 0px;
                                                left: 750px; z-index: 0; display: none;">
                                                <p>
                                                    <a style="font-size: 11px; font-family: Verdana;" href="http://developmentdss.azurewebsites.net/Dss%20news/dssnews%20overview.aspx?dssnews=Predictive%20analytics%20is%20on%20the%20rise%20as%20the%20number%20of%20successful%20applications%20continues%20to%20increase.%20Predictive%20models%20can%20be%20used%20to%20generate%20better%20decisions,%20greater%20consistency,%20and%20lower%20costs.">
                                                        "Using Predictive Analytics to Improve Decision Making and Business Outcomes"
                                                    </a>
                                                </p>
                                            </div>
                                            <div class="slide" style="width: 95%; height: 120px; position: absolute; top: 0px;
                                                left: 750px; z-index: 5; display: block;">
                                                <p>
                                                    <a style="font-size: 11px; font-family: Verdana;" href="http://developmentdss.azurewebsites.net/Dss%20news/dssnews%20overview.aspx?dssnews=Business%20analytics%20(BA)%20is%20a%20subset%20of%20Business%20intelligence%20(BI)%20and%20is%20defined%20differently%20by%20different%20organizations.%20For%20many%20organizations,%20BA%20is%20simply%20an%20enterprise%20reporting%20system.%20Other%20organizations%20incorporate%20scorecards%20and%20performance%20metrics%20to%20help%20meet%20strategic%20goals.%20Still%20others%20use%20complex%20data%20models%20and%20predictive%20analytics%20to%20make%20proactive%20business%20decisions%20to%20give%20the%20organization%20a%20competitive%20advantage.%20Northrop%20Grumman%20sees%20business%20analytics%20as%20all%20of%20these%20things%20%E2%80%93%20and%20as%20a%20cornerstone%20of%20our%20customers%E2%80%99%20efforts%20to%20achieve%20the%20goals%20set%20forth%20in%20their%20strategic%20plans.">
                                                        "Business Analytics for Better Government " </a>
                                                </p>
                                            </div>--%>
                                        </div>
                                        <a href="#" id="prev1" class="prev">
                                            <img src="./Content/Images/arrow-prev.png" height="43" alt="Arrow Prev" style="border-style: none;
                                                border-color: inherit; border-width: 0px; width: 25px;"></a> <a href="#" id="next1"
                                                    class="next">
                                                    <img src="./Content/Images/arrow-next.png" width="24" height="43" alt="Arrow Next"
                                                        style="border: 0px"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="bodysectionsubrightImg">
                        <img src="./Content/Images/AmazingCharts5.png" usemap="#Map" alt=""/>
                        <map name="Map" id="Map">
                            <area shape="circle" coords="479, 278, 33" href="http://developmentdss.azurewebsites.net/AmazingChart.aspx#"
                                alt="">
                            <area shape="circle" coords="665, 281, 38" href="http://developmentdss.azurewebsites.net/AmazingChart.aspx#"
                                alt="">
                            <area shape="circle" coords="796, 290, 29" href="http://developmentdss.azurewebsites.net/AmazingChart.aspx#"
                                alt="">
                        </map>
                    </div>--%>
            </div>
        </div>
        <!-- content -->
        <div style="z-index: 1000; width: 100%; display: inline-block;" class="DssCommitmentsection">
            <div class="DssCommitment tbltd DssCommitmentbtmleft">
                <h1 class="Header2 headTitle headerEHR1 ">
                    EHR/PM Solution</h1>
                <div class="non-mobile">
                    <p class="DssCommitmentdesc">
                        Click on any tabs in EHR/PM or Integrated Healthcare Solutions sections to learn
                        more</p>
                    <section id="intro" class="clear">
        <article class="one_quarter ciesericegreen first ">
         <a target="_blank"><img id="img5" class="imgNew" alt=" casestudies" src="./Content/Images/Icon_EHR.png" onclick="show5()"></a>
        </article>
        <article class="one_quarter ciesericegreen">
          <a target="_blank"><img id="img6" class="imgNew" alt=" whitepapers" src="./Content/Images/Icon_PM.png" onclick="show6()"></a>
        </article>
        <article class="one_quarter ciesericegreen">
           <a target="_blank">
                        <img id="img7" class="imgNew" alt="Webinar" src="./Content/Images/Icon_MU.png" onclick="show7()">
                    </a>
        </article>
         <article class="one_quarter ciesericegreen">
          <a target="_blank">
                        <img id="img8" class="imgNew" alt="Blogs" src="./Content/Images/Icon_WhyAC.png" onclick="show8()">
                    </a>
        </article>
             <article class="one_quarter ciesericegreen">
          <a target="_blank">
                        <img id="img9" class="imgNew" alt="Blog" src="./Content/Images/Icon_WhyDss.png" onclick="show9()">
                    </a>
        </article>

        <article class="one_quarter ciesericegreen">
        
                     <a target="_blank">
                        <img id="img10" class="imgNew" alt="Test Drive" src="./Content/Images/Icon_Support.png" onclick="show10()">
                    </a>
        </article>
        <article class="one_quarter ciesericegreen">
        
                   <a target="_blank">
                        <img id="img11" class="imgNew"  alt="Trail Account" src="./Content/Images/Icon_Service.png" onclick="show11()">
                    </a>
        </article>

      
        
      </section>
                </div>
                <div class="mobile">
                    <p class="DssCommitmentdesc">
                        Click on any tabs in EHR/PM or Integrated Healthcare Solutions sections to learn
                        more</p>
                    <section id="intro" class="clear">
        <article class="one_quarter ciesericegreen first ">
         <a target="_blank"><img id="img12" class="imgNew" alt="casestudies" src="./Content/Images/Icon_EHR.png" onclick="show12()"></a>
        </article>
        <article class="one_quarter ciesericegreen">
          <a target="_blank"><img id="img13" class="imgNew" alt="whitepapers" src="./Content/Images/Icon_PM.png" onclick="show13()"></a>
        </article>
        <article class="one_quarter ciesericegreen">           <a target="_blank" >
                        <img id="img14" class="imgNew"  alt="Webinar" src="./Content/Images/Icon_MU.png" onclick="show14()">
                    </a>
        </article>
         <article class="one_quarter ciesericegreen">
          <a target="_blank">
                        <img id="img15" class="imgNew"  alt="Blogs" src="./Content/Images/Icon_WhyAC.png" onclick="show15()">
                    </a>
        </article>
             <article class="one_quarter ciesericegreen">
          <a target="_blank">
                        <img id="img16" class="imgNew"  alt="Blog" src="./Content/Images/Icon_WhyDss.png" onclick="show16()">
                    </a>
        </article>

        <article class="one_quarter ciesericegreen">
        
                     <a target="_blank">
                        <img id="img17" class="imgNew"  alt="Test Drive" src="./Content/Images/Icon_Support.png" onclick="show17()">
                    </a>
        </article>
        <article class="one_quarter ciesericegreen">
        
                   <a target="_blank">
                        <img id="img18" class="imgNew"  alt="Trail Account" src="./Content/Images/Icon_Service.png" onclick="show18()">
                    </a>
        </article>
      </section>
                </div>
            </div>
            <div class="mobile wrapper row3" id="mobilecontainer">
                <div id="benefits12" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn technology1">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Electronic Health Record (EHR):</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Amazing Charts is an Electronic Health Record (EHR) system that allows complete
                                                                    documentation of the medical encounter in a fast, efficient, and straight-forward
                                                                    manner.
                                                                </p>
                                                                <p>
                                                                    Our mission is simple: to improve the lives of health care providers by developing
                                                                    powerful, intuitive, and easy to use solutions that are user friendly and affordable.
                                                                    <big></big>And <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">multiple studies</a> prove that not only have we succeeded,
                                                                    we do so at a level significantly better than any other Electronic Health Record
                                                                    (EHR/EMR) system available today (including those costing tens of thousands of dollars
                                                                    more).
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The EHR Rated #1 for Usability and Affordability:
                                                                </h3>
                                                                <p>
                                                                    The award winning Amazing Charts EHR sets the standard for usability and affordability.
                                                                    Our solution has everything you need to run your practice, including charting, scheduling,
                                                                    intra-office messaging, prescribing, and much more.
                                                                </p>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">Rated the #1 HER in multiple studies</a>, <a target="blank" class="Boldcolor"
                                                                            href="../DssUser/ContactUs.aspx" style="color: blue">FREE to try</a>, and
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">priced at $2,395 per clinician</a>, (which includes ePrescribing,
                                                                    all our updates, and even our highly-rated Guardian Angel Technical Support), Amazing
                                                                    Charts is not only the obvious choice, it is the only choice.
                                                                </p>
                                                                <p>
                                                                    Designed by physicians for physicians, Amazing Charts is continually updated to
                                                                    incorporate suggestions submitted by thousands of users around the country. But
                                                                    don't take it from us, listen to what <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/#c79"
                                                                        style="color: blue">actual users</a> have to say.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazingly Easy to Use:
                                                                </h3>
                                                                <p>
                                                                    Most EHRs are overwhelmingly complex and ludicrously priced. These vendors require
                                                                    you to purchase servers, set up intricate networks, and spend hours upon hours of
                                                                    training just to re-teach you and your staff how to document a note the way their
                                                                    programmers believe is correct.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts is completely different. We understand that you have spent years
                                                                    learning how to document encounters and already know how best to run your practice.
                                                                    We don't require long-term commitments or contracts you can't get out of (all our
                                                                    terms are clearly outlined <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/privacy-terms-of-use/"
                                                                        style="color: blue">here</a>).
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is Designed by Our Users for Our Users:
                                                                </h3>
                                                                <p>
                                                                    Recommendations and suggestions are easily uploaded from within the program and
                                                                    are focused on adding the features and functionality to make your practice easier.
                                                                </p>
                                                                <p>
                                                                    If you haven't yet downloaded and tried Amazing Charts, click <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here</a>
                                                                    and do so now. Use it on your existing computers and network, and see for yourself
                                                                    how amazingly intuitive and easy Amazing Charts is to implement and use.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Our Pledge to You:
                                                                </h3>
                                                                <p>
                                                                    We will treat you fairly, honestly, and the way we would want to be treated ourselves
                                                                    (and we expect the same from you in return). We want you to be thrilled &ndash;
                                                                    with our software, our cost, and our services! Happy clients mean good word-of-mouth,
                                                                    and good word-of-mouth is why we are the fastest growing EHR Company in the country.
                                                                </p>
                                                                <p>
                                                                   Click <asp:LinkButton CommandArgument="1" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton1" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                     <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/Dss EHR-PM Offer.pdf"
                                                                        style="color: blue">here</a> for Dss Cloud Integrated Healthcare Solutions Executive Summary </p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="8" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton2" runat="server" Text="herezip" OnClick="Download_Click"></asp:LinkButton> 
                                                                    for Amazing Charts EHR Overview. </p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="4" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton3" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                    <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/ComparisonTool-011314.pdf" style="color: blue">here</a> 
                                                                    for EHR Evaluation Tool</p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="3" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton4" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                    <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/Cloud_ds_010214.pdf" style="color: blue">here</a> 
                                                                    for Amazing Charts in the Cloud</p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">EHR Solutions for Practice Managers:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3>
                                                                    Are You Researching Electronic Health Records for Your Practice?
                                                                </h3>
                                                                <p>
                                                                    Many office managers have been tasked with finding an Electronic Health Record (EHR/EMR)
                                                                    system for their practice.
                                                                </p>
                                                                <p>
                                                                    With tens of thousands of dollars on the line, making the wrong decision could be
                                                                    disastrous &ndash; while choosing the right EHR solution will make you the hero
                                                                    of your office!
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is the Right Choice
                                                                </h3>
                                                                <p>
                                                                    According to <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">multiple studies </a>based on actual user feedback, Amazing
                                                                    Charts is rated #1 for ease of use, user satisfaction, price, and support.
                                                                </p>
                                                                <p>
                                                                    Yet Amazing Charts is also one of the most <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">affordable </a>EHR systems on the market. By choosing Amazing
                                                                    Charts, you can help save the practice partners thousands of dollars each year.
                                                                </p>
                                                                <p>
                                                                    Best of all, Amazing Charts is risk free to try. 
                                                                    <asp:LinkButton CommandArgument="1" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton10" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                    <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">Download </a>
                                                                    a FREE trial of our full software in your practice today.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The bottom line:
                                                                </h3>
                                                                <p>
                                                                    Don't take the risk of purchasing an expensive, unusable EHR that you can't try
                                                                    in advance, and then go through the hassle and expense of switching later &ndash;
                                                                    check out Amazing Charts today!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Electronic Health Records for Complimentary
                                                                &amp; Alternative Medicine (CAM):</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record solution is used by many Complimentary
                                                                    &amp; Alternative Medicine (CAM) providers, including home care services, facility-based
                                                                    medicine, optometrists, physiotherapists, and many others!
                                                                </p>
                                                                <p>
                                                                    These health care practitioners use Amazing Charts to:
                                                                </p>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Create secure electronic records of patient care</li>
                                                                    <li>Document diagnoses and treatment plans</li>
                                                                    <li>Collect payments and reimbursements</li>
                                                                    <li>Schedule appointments</li>
                                                                </ul>
                                                                <p>
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is the Right Choice</h3>
                                                                <p>
                                                                    According to multiple studies based on actual user feedback, Amazing Charts is rated
                                                                    #1 for ease of use, user satisfaction, price, and support.
                                                                </p>
                                                                <p>
                                                                    Yet Amazing Charts is also one of the most affordable EHR systems on the market.
                                                                    By choosing Amazing Charts, you can help save the practice partners thousands of
                                                                    dollars each year.
                                                                </p>
                                                                <p>
                                                                    Best of all, Amazing Charts is risk free to try. Activate a full working version
                                                                    of the software and use it in your practice FREE.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The bottom line:
                                                                </h3>
                                                                <p>
                                                                    Don't take the risk of purchasing an expensive, unusable EHR that you can't try
                                                                    in advance, and then go through the hassle and expense of switching later &ndash;
                                                                    check out Amazing Charts today!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Electronic Health Record Solutions for Specialists:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Physicians always ask us: "Does Amazing Charts have any particular features for
                                                                    my specialty?"
                                                                </p>
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record (EMR/EHR) system has numerous features
                                                                    and functions that are ideal for specific medical specialties, including:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Cardiology</h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Direct links between Amazing Charts EHR and EKG, Stress, and Echo Cardiogram test
                                                                        equipment</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Dermatology</h3>
                                                                <ul>
                                                                    <li>Freehand illustrations </li>
                                                                    <li>Drawing / digital images</li>
                                                                    <li>Photos attach to patient charts</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Pediatrics
                                                                </h3>
                                                                <ul>
                                                                    <li>CDC growth curve charts </li>
                                                                    <li>Head circumference</li>
                                                                    <li>Immunization and shots documentation</li>
                                                                    <li>Pediatric templates built in</li>
                                                                    <li>State immunization registries</li>
                                                                    <li>Vaccine schedules</li>
                                                                    <li>Vaccine information sheets</li></ul>
                                                                <p>
                                                                    "Searching for preemies who will need RSV prophylaxis and prioritizing flu vaccines&mdash;so
                                                                    that the high risk kids are notified first&mdash;can be done in minutes in Amazing
                                                                    Charts, making population management extremely easy. Instantly being able to pull
                                                                    growth charts and show parents how their child is growing is appreciated by the
                                                                    parents and makes my job so much easier." &ndash; Wendell Wheeler, MD
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Podiatry
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Unique billing modifiers</li>
                                                                    <li>Foot image</li></ul>
                                                                <p>
                                                                    Amazing Charts is a very economical way of using an EHR. You are able to modify
                                                                    and make your own templates. &ndash;Arthur Lukoff, DPM
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Psychology and Psychiatry</h3>
                                                                <ul>
                                                                    <li>Diagnostic and Statistical Manual of Mental Disorders (DSM) IV codes are already
                                                                        built into Amazing Charts, which makes billing a snap</li></ul>
                                                                <p>
                                                                    I am a psychiatrist using Amazing Charts for medication management and more. Amazing
                                                                    Charts allows you to use templates of your own design and allows narrative entries
                                                                    rather than check marks, which I have never liked. I also have a nurse practitioner
                                                                    in my office who uses the program and is also pleased with it. &ndash;William Sullivan,
                                                                    MD
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Pulmonology</h3>
                                                                <ul>
                                                                    <li>Direct connection between Amazing Charts EHR and Spirometer equipment</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Easy to Create Templates</h3>
                                                                <p>
                                                                    Any specialist can adapt Amazing Charts to their specific practice requirements
                                                                    using templates, which allow users to quickly document the same information again
                                                                    and again.
                                                                </p>
                                                                <p>
                                                                    Creating a template in Amazing Charts can be accomplished in as few as two clicks.
                                                                    You can also download templates created by other specialists using Amazing Charts
                                                                    from our user board.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Medical Applications and Devices Support
                                                                by Amazing Charts:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record (EMR/EHR) system currently support the
                                                                    following medical and device application types. Click on each type to visit Amazing
                                                                    Charts site for more detail:
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfacing/lab-interfaces/"
                                                                        style="color: blue">Labs </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/radiology-providers/"
                                                                        style="color: blue">Radiology Providers</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                        style="color: blue">Practice Management </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/medical-devices/"
                                                                        style="color: blue">Medical Devices </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfaces/updox-document-management/"
                                                                        style="color: blue">Updox Document Management </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/speech-recognition/"
                                                                        style="color: blue">Speech Recognition </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/demographic-interface/"
                                                                        style="color: blue">Demographic Interface </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfaces/patient-history-check-in/"
                                                                        style="color: blue">Patient History / Check-In </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/patient-portals/"
                                                                        style="color: blue">Patient Portals </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/state-immunization-registries/"
                                                                        style="color: blue">State Immunization Registries </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Webinar:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/webinars/"
                                                                        style="color: blue">here </a>to view the scheduled Webinars (All times are in
                                                                    Eastern Time zone):
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Video Tour of Amazing Charts:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Sit back, relax, and enjoy this 20-minute in-depth overview of Amazing Charts; just
                                                                    click on the video player <a target="blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here </a>to get started.
                                                                </p>
                                                                <p>
                                                                    Looking for something shorter? Click <a target="blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here </a>to view our complete library of video tutorials.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Download and Try Amazing Charts Now:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We're so sure Amazing Charts will work for you&mdash;without extensive training
                                                                    or a reduction in your patient volume&mdash;we make the full version of Amazing
                                                                    Charts FREE to download and experience in your office.
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    CURRENT AMAZING CHARTS USERS - PLEASE READ BELOW
                                                                </h3>
                                                                <ul>
                                                                    <li><a class="Boldcolor" style="color: black">WARNING: </a>To add Amazing Charts to
                                                                        a new computer or update to the latest version, please visit the <a target="_blank"
                                                                            class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">client portal
                                                                        </a>. <b style="color: black">Current users require additional software not available
                                                                            here. </b></li>
                                                                    <li>To start a free trial of <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">Amazing Charts in the Cloud </a>, click one of the buttons above.
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Trail Account on Dss Solutions
                                                                Cloud:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We're so sure Amazing Charts will work for you&mdash;without extensive training
                                                                    or a reduction in your patient volume&mdash;we make the <b><i>full version of Amazing
                                                                        Charts FREE </i></b>ready for you to use on secure Dss Solutions Cloud.
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Buy Amazing Charts Now:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Do you want to purchase Amazing Charts immediately, without taking advantage of
                                                                    our FREE trial?
                                                                </p>
                                                                <p>
                                                                    Quite frankly, we'd rather you first try Amazing Charts to ensure it is right for
                                                                    you and your staff, since having a satisfied customer is more important to us than
                                                                    making a sale today.
                                                                </p>
                                                                <p>
                                                                    But if you really need to purchase Amazing Charts right now...
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits13" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="Font">
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Practice Management:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Looking for a Practice Management (PM) system as intuitive and usable as our EHR?
                                                                </p>
                                                                <p>
                                                                    Our tightly integrated EHR+PM solution will deliver seamless workflow across clinical
                                                                    documentation and billing systems, along with a highly competitive clearinghouse
                                                                    connection. Amazing Charts PM is a solution for practices of all sizes and specialties.
                                                                    Review the information below to learn more about the features and benefits of Amazing
                                                                    Charts PM.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Integrated Financial Management Solution
                                                                </h3>
                                                                <p>
                                                                    Link the complex aspects of a practice together in ways that improve office efficiency,
                                                                    and patient care. Information moves seamlessly between Amazing Charts and payers
                                                                    electronically throughout the day.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Efficient management of day-to-day office workflow from the front desk to the billing
                                                                    office
                                                                </h3>
                                                                <p>
                                                                    Amazing Charts PM is designed to improve efficiency at the daily workflow level.
                                                                    Integration is a powerful tool to achieve this objective. Click here to learn about
                                                                    use cases for a typical practice.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Integrated Practice Management
                                                                </h3>
                                                                <ul>
                                                                    <li>Completely integrated financial management solution </li>
                                                                    <li>Scalable for practices of all sizes and specialties</li>
                                                                    <li>Efficient management of day-to-day office workflow from the front desk to the billing
                                                                        office</li>
                                                                    <li>Fully automated eligibility checking and electronic submission</li>
                                                                    <li>Supports single or multiple location practices</li></ul>
                                                                <h3 style="font-weight: bold">
                                                                    Increase Revenue:
                                                                </h3>
                                                                <ul>
                                                                    <li>Comprehensive Financial Reporting </li>
                                                                    <li>Claims Processing </li>
                                                                    <li>Patient Billing</li>
                                                                    <li>On-Demand Eligibility Checking </li>
                                                                    <li>Flexible Report Writer</li>
                                                                    <li>Electronic Statements </li>
                                                                    <li>Electronic Remittance Advice (ERA) </li>
                                                                </ul>
                                                                <h3 style="font-weight: bold">
                                                                    Increase Productivity:
                                                                </h3>
                                                                <ul>
                                                                    <li>Appointment &amp; Resource Scheduling </li>
                                                                    <li>Registration</li>
                                                                    <li>Referral Tracking</li>
                                                                    <li>HL7 Integration Engine</li>
                                                                    <li>Scanning</li></ul>
                                                                <h3 style="font-weight: bold">
                                                                    Improve Patient Care:
                                                                </h3>
                                                                <ul>
                                                                    <li>Referral Tracking</li>
                                                                    <li>Patient Recall</li></ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-container">
                                                            <div class="acc-btn">
                                                                <span class="selected ContentHeadingStyle">Amazing Charts Billing + PM Your Way:</span>
                                                            </div>
                                                            <div class="acc-content ">
                                                                <div class="acc-content-inner">
                                                                    <p>
                                                                        We know your practice is as individual as you are.
                                                                    </p>
                                                                    <p>
                                                                        No matter how your practice likes to handle billing and managing revenues, Amazing
                                                                        Charts has you covered with affordable and usable software.
                                                                    </p>
                                                                    <p>
                                                                        <u>Billing+PM </u>Your Way is our comprehensive toolkit of billing and Practice
                                                                        Management solutions that will meet the needs of your business today and tomorrow:
                                                                    </p>
                                                                    <ul>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/pm/medical-practice-management-software/"
                                                                            style="color: blue">Integrated Amazing Charts EHR+PM</a></li><a target="_blank" class="Boldcolor"
                                                                                href="http://amazingcharts.com/pm/medical-practice-management-software/" style="color: blue">
                                                                            </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/pm/medical-practice-management-software/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                                style="color: blue">Interfaces with nearly 100 market leading PM Systems</a></li><a
                                                                                    target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                                    style="color: blue"> </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/billing-services/"
                                                                                style="color: blue">Support for third-party billers</a></li><a target="_blank" class="Boldcolor"
                                                                                    href="http://amazingcharts.com/services/billing-services/" style="color: blue">
                                                                                </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/billing-services/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" style="color: black">COMING
                                                                                SOON: </a>Bi-directional interfaces with Kareo PM</li></ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits14" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">What is Meaningful Use? </span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Many eligible providers have collected money thanks to the ARRA Stimulus Plan (and
                                                                    the Amazing Charts Meaningful Use Wizard&trade;. This isn't chump change either;
                                                                    it works out to be somewhere around $44,000 to $63,750 for the average clinician.
                                                                </p>
                                                                <p>
                                                                    To get the incentives, you need just three things: (1) be eligible (e.g., take care
                                                                    of patients with Medicare or Medicaid insurance); (2) use a certified EHR in a "meaningful
                                                                    way." (3) Understand what "meaningful use" means, and document encounters in a manner
                                                                    that meets these government requirements (again, our integrated <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/meaningful-use/meaningful-use-wizardtm/"
                                                                        style="color: blue">Meaningful Use Wizard&trade; </a>will do the hard work for
                                                                    you).
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Choosing a Program: Medicare or Medicaid?
                                                                </h3>
                                                                <p>
                                                                    There are two EHR Incentive Programs; Medicare and Medicaid EHR Incentive Programs.
                                                                    The two programs are similar but there are some differences between them. Click
                                                                    one of the buttons below to learn more about one of these incentive programs.
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/downloads/Beginners_Guide.pdf"
                                                                        style="color: blue">Medicare EHR Incentive Program </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Downloads/EHR_Medicaid_Guide_Remediated_2012.pdf"
                                                                        style="color: blue">Medicaid EHR Incentive Program </a></li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Are you eligible?
                                                                </h3>
                                                                <p>
                                                                    Visit the Centers for Medicare &amp; Medicaid Services website to <a target="_blank"
                                                                        class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/eligibility.html"
                                                                        style="color: blue">determine your eligibility </a>to participate in Meaningful
                                                                    Use incentive programs.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts is 2014 MU certified?
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/ehr-certification/"
                                                                        style="color: blue">here </a>to visit Amazing Charts Meaning Use Certification
                                                                    Page.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Chart Your Course to Meaningful Use Success!
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Ease your fears of Meaningful Use and collect all the incentives you are entitled
                                                                    to receive with our 2014 attestation plan. Use these links to get started:
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/what-does-2014-mean-for-you/"
                                                                        style="color: blue">What does 2014 mean for you? </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/prepare-for-upgrade-now/"
                                                                        style="color: blue">Prepare for upgrade now! </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">New MU Features </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    There are several new features that will be included in the 2014 Meaningful Use
                                                                    certified version of Amazing Charts due out this summer. Here is a sneak peak of
                                                                    some of the new features that will be available in that release of Amazing Charts.
                                                                    Check back often as we'll be adding more over the next few weeks.
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4166"
                                                                        style="color: blue">Demographics</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4169"
                                                                        style="color: blue">PHI Import and Reconciliation Functionality</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4167"
                                                                        style="color: blue">Smoking Status</a></li></ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Hardship Exemption &ndash; what it means
                                                                for you in 2014 </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The hardship exemption is for an eligible professional (EP) who qualifies for the
                                                                    CMS EHR Incentive program. Taking the exemption means the EP will avoid penalties
                                                                    and also not get the incentive money for 2014.
                                                                </p>
                                                                <p>
                                                                    Eligible professionals may apply for this exemption for the following reasons:
                                                                </p>
                                                                <ul>
                                                                    <li>Lack of Infrastructure - The EP is located in an area without sufficient internet
                                                                        access to comply with the Meaningful Use objectives requiring internet connectivity,
                                                                        and faced insurmountable barriers to obtaining such internet connectivity. </li>
                                                                    <li>Unforeseen and/or Uncontrollable Circumstances - The EP faced extreme and uncontrollable
                                                                        circumstances that prevented the EP from becoming a meaningful EHR user. </li>
                                                                    <li>Lack of control over the availability of Certified EHR Technology - The EP must
                                                                        demonstrate that he/she practices at multiple locations and is unable to control
                                                                        the availability of Certified EHR Technology at one such practice location or a
                                                                        combination of practice locations, and where the location or locations constitute
                                                                        more than 50 percent of patient encounters. </li>
                                                                    <li>Lack of Face-to-Face Interaction - The EP must demonstrate either a complete lack
                                                                        of face-to-face interactions and follow-up or that the cases of face-to-face interaction
                                                                        and follow-up are extremely rare and not part of normal scope of practice for that
                                                                        EP. </li>
                                                                    <li>2014 EHR Vendor Issues - During the calendar year (2014) preceding the payment adjustment
                                                                        year (2015), the EP's EHR vendor was unable to obtain 2014 certification or the
                                                                        EP was unable to implement Meaningful Use due to 2014 EHR certification delays.
                                                                        Click here for the application. </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Patient Portal and Meaningful Use </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts 2014 Patient Portal will enable you to get a jump start on meeting
                                                                    some of the challenging aspects of the second stage of Meaningful Use. The Patient
                                                                    Portal will be offered at no cost with a simple set up. Since Patient Engagement
                                                                    has become a core requirement for MU2, it is important to start educating office
                                                                    staff and patients on how to interact with the practice through a self-service web
                                                                    based portal. The Amazing Charts Patient Portal meets all of the requirements for
                                                                    MU2 criteria for providers.
                                                                </p>
                                                                <p>
                                                                    The Patient Portal will help meet two specific tests for MU2:
                                                                </p>
                                                                <ul>
                                                                    <li><b class="Boldcolor">Core Criteria #7 &ndash; Patients can View, Download, and Transmit
                                                                        their medical record to a third party within four days of being available. </b>
                                                                    </li>
                                                                </ul>
                                                                <ul>
                                                                    <li>More than 50 percent of all unique patients seen by the EP during the EHR reporting
                                                                        period must be provided timely (within 4 business days after the information is
                                                                        available to the EP) online access to their health information subject to the EP's
                                                                        discretion to withhold certain information. </li>
                                                                    <li>More than 5 percent of all unique patients seen by the EP during the EHR reporting
                                                                        period (or their authorized representatives) must view, download, or transmit their
                                                                        health information to a third party</li>
                                                                    <li><b class="Boldcolor">Core Criteria #17 &ndash; Secure Messaging between Patient
                                                                        and Provider</b></li></ul>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>A secure message was sent using the electronic messaging function of Certified EHR
                                                                        Technology by more than 5 percent of unique patients (or their authorized representatives)
                                                                        seen by the EP during the EHR reporting period. </li>
                                                                </ul>
                                                                <a target="_blank" class="Boldcolor" href="http://www.myupdox.com/updox-ui/acpatientportal"
                                                                    style="color: blue">Register </a>or <a target="_blank" class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Stage_2.html"
                                                                        style="color: blue">learn more </a>about the requirements for MU Stage 2.
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Using Amazing Charts to Meet Meaningful Use
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The surest way of achieving Meaningful Use Stage 1 or Stage 2 is to get into the
                                                                    habit of collecting the information required by the government to prove you are
                                                                    using a certified EHR in a meaningful way.
                                                                </p>
                                                                <p>
                                                                    The Meaningful Use Wizard&trade; is designed to work within your usual office flow,
                                                                    and does not require reentering of information, complex tallying of data, or even
                                                                    having to remember what you need to document.
                                                                </p>
                                                                <p>
                                                                    WANT TO SEE OUR MEANINGFUL USE WIZARD IN ACTION? <a target="_blank" class="Boldcolor"
                                                                        href="http://amazingcharts.com/meaningful-use/meaningful-use-wizardtm/#c1546"
                                                                        style="color: blue">JUMP TO THE VIDEO </a>NOW.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Demystifying Meaningful Use</h3>
                                                                <p>
                                                                    Amazing Charts will take you to Meaningful Use, step by step, while still allowing
                                                                    you to get through your visits quickly and efficiently, which we believe is the
                                                                    most fundamental requirement of an EHR.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Color-Coding</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard color-codes the specific fields that you must document
                                                                    if you wish to reach Meaningful Use. Holding your mouse over the color-coded field
                                                                    shows you more details of the requirement that the Federal government has deemed
                                                                    to be evidence that you are using your EHR in a meaningful way. (Please don't be
                                                                    annoyed with what is color-coded, since we're sure you'll find some of it as ridiculous
                                                                    as we did; you can turn it off, or even change the color in the User Preferences
                                                                    menu.)
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Automatic Alerts
                                                                </h3>
                                                                <p>
                                                                    The Meaningful Use Wizard will automatically open various windows to allow you to
                                                                    collect certain information (e.g., HIPAA information when printing records).
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Checkpoint Dashboard</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard includes a checkpoint dashboard, accessible within each
                                                                    patient record, which provides a real-time status of how you are doing in terms
                                                                    of collecting the required amount of information needed to meet Meaningful Use.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Report Writer</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard includes a robust report writer that automatically collates
                                                                    all the data you've collected, analyzes it to ensure it meets the requirements,
                                                                    and then produces a printable report summarizing your Meaningful Use status. This
                                                                    report can be submitted to CMS and will be the basis by which they pay you the HITECH
                                                                    money.
                                                                </p>
                                                                <p>
                                                                    The report writer also provides detailed information on each Meaningful Use criteria
                                                                    and how we recommend you use Amazing Charts to ensure the information is recorded.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Submission Assistant</h3>
                                                                <p>
                                                                    Of course achieving Meaningful Use is one thing, generating the required reports
                                                                    and analysis of your percentages is another, but unless you submit everything the
                                                                    way it needs to be done: to the right place by the right time, the money won't get
                                                                    to you. So part of the Amazing Charts plan to get you to payment is assistance with
                                                                    the submitting process.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits15" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Why Amazing Charts? </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Learning and implementing Amazing Charts is easy &ndash; and the program has received
                                                                    the highest rating of any EHR for ease of implementation and usability.
                                                                </p>
                                                                <p>
                                                                    We encourage you to <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">try Amazing Charts in your own practice for a FREE trial
                                                                    </a>before purchasing. This ensures that you love our product (and we love you).
                                                                    And happy customers is the reason we are the #1 rated EHR (since happy clients tell
                                                                    their friends).
                                                                </p>
                                                                <p>
                                                                    Below are links to help you learn more about our products and see what actual customers
                                                                    have to say about their own experiences researching, implementing, and using Amazing
                                                                    Charts compared with other EHRs.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Try It Right Now</h3>
                                                                <p>
                                                                    Use our award-winning EHR and use it in your office for a FREE trial, and let us
                                                                    prove to you how good we are. <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">[Try It Now] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Set Up A Live Demo</h3>
                                                                <p>
                                                                    Want to walk through a demo? We have weekly scheduled demos at times that are convenient
                                                                    for you. Or, you can schedule a demo at a time of your choosing and one of our representatives
                                                                    will walk you through all the features and benefits of Amazing Charts. <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/the-ehr/webinars/" style="color: blue">
                                                                        [Set Up A Demo] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Watch Video Tutorials</h3>
                                                                <p>
                                                                    See Amazing Charts in action! Use these video tutorials to learn how to download,
                                                                    install, and use Amazing Charts in your practice. See how to network multiple computers,
                                                                    backup and restore data, interface with Dragon Naturally Speaking, and much more.
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">[Watch Video Demonstrations] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Frequently Asked Questions (FAQ)
                                                                </h3>
                                                                <p>
                                                                    Find answers to the most commonly asked questions about getting started, getting
                                                                    stimulus money, etc. <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/why-us/frequently-asked-questions/"
                                                                        style="color: blue">[Frequently Asked Questions] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    What Our Users Say</h3>
                                                                <p>
                                                                    Amazing Charts doesn't spend your money on expensive advertising campaigns or marketing
                                                                    hype. The vast majority of our clients first heard about Amazing Charts from their
                                                                    colleagues. As we run into clients at medical conventions and other locations, we
                                                                    record (those who are willing) what our clients have to say when asked what other
                                                                    EHRs they've tried, what they like about Amazing Charts, and we even ask them to
                                                                    elaborate on any issues they've had with our software or company. <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/"
                                                                        style="color: blue">[Unedited User Reviews] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Online Community</h3>
                                                                <p>
                                                                    Amazing Charts is designed and continually improved based on the recommendations
                                                                    of our users. Our user community is a large, outspoken, and uncensored group, always
                                                                    willing to assist new users ("newbies") and a great place to learn about the many
                                                                    ways Amazing Charts can be used. <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/online-community/"
                                                                        style="color: blue">[Amazing Charts Online Community] </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">The EHR Rated #1 for Usability </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Most amazing about Amazing Charts is that we're rated the best!
                                                                </h3>
                                                                <p>
                                                                    Sure our product is amazingly affordable, user-friendly, and easy to learn, but
                                                                    what is most amazing is that despite costing so much less than other EHRs, in study
                                                                    after study Amazing Charts is consistently rated as being the best.
                                                                </p>
                                                                <p>
                                                                    We encourage you to click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">here </a>to review the data for yourself and then ask each
                                                                    vendor you are considering why they charge so much more yet score so much less when
                                                                    their users are surveyed.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Fair and Transparent Pricing </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    FREE trial!
                                                                </h3>
                                                                <p>
                                                                    First, <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        try Amazing Charts FREE </a>to be sure it works for your practice.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Then $1,200 per clinician!
                                                                </h3>
                                                                <p>
                                                                    If you like it, <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">buy a license for each clinician</a>. This covers all other
                                                                    staff in the practice.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Support &amp; Maintenance: $1,195 per clinician (annually)!
                                                                </h3>
                                                                <p>
                                                                    Our annual support and maintenance subscription costs just $1,195/year per clinician.
                                                                    This includes all our software updates, upgrades, technical support, even ePrescribing.
                                                                    In fact, other than the optional charges listed below, there are no "extra" module
                                                                    fees, no required training charges, no complicated user agreements, and no other
                                                                    licensing nonsense requiring you to pay a monthly fee for years to come.
                                                                </p>
                                                                <p>
                                                                    Please click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">here </a>for detail on the AC price offering!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Comparing Electronic Health Records (EHRs)
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    As "Health Information Technology" has entered the medical lexicon, a number of
                                                                    reputable organizations have conducted head-to-head studies comparing the various
                                                                    EHR programs to one another. These studies all essentially look to answer a very
                                                                    simple question: <b class="Boldcolor">How much do you like your EHR? </b>
                                                                </p>
                                                                <p>
                                                                    The studies summarized <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/compare-us-to-other-ehrs/"
                                                                        style="color: blue">here </a>show what thousands of clinicians have to say about
                                                                    their own EHR. What is most amazing is that in study after study, Amazing Charts
                                                                    is rated significantly better in essentially every key indicator of overall EHR
                                                                    satisfaction, quality, and usability, despite costing a fraction of the other programs.
                                                                    Of course our reporting of these data does not constitute an endorsement by the
                                                                    study publishers or authors. Instead, it is our interpretation of the study data
                                                                    as published.
                                                                </p>
                                                                <p>
                                                                    Please click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/compare-us-to-other-ehrs/"
                                                                        style="color: blue">here</a> to view detail studies by different organization.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Hear and Read What Users Say About Amazing
                                                                Charts... </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    When it comes to Electronic Health Record (EHR) systems, who can you really believe,
                                                                    except your peers? Use the links below to hear real people talking about Amazing
                                                                    Charts in their own words.
                                                                </p>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/ub/" style="color: blue">
                                                                        here </a>to view a complete set of Testimonies and Case Studies that your peers
                                                                    shared with Amazing Charts.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Frequently Asked Questions (FAQ) from Amazing
                                                                Charts </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/why-us/frequently-asked-questions/"
                                                                        style="color: blue">Click Here if the link to the FQA at Amazing Charts site.
                                                                    </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Switch EHRs as Easy as 1-2-3... </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Sick and tired of your current EHR/EMR system? We understand.
                                                                </p>
                                                                <p>
                                                                    Everyday, we hear horror stories from practices that overpay for their EHR, or find
                                                                    their poorly designed EHR unusable, or both!
                                                                </p>
                                                                <p>
                                                                    There is a better way &ndash; switch to Amazing Charts today! We make it as simple
                                                                    as...well, 1-2-3.
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 1 &ndash; </b>Download a FREE trial of the full version
                                                                    Amazing Charts
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 2 &ndash; </b>Import your patient demographics with the
                                                                    Amazing Importer
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 3 &ndash; </b>Evaluate your other options: importing structured
                                                                    data, scanning, archiving, etc.
                                                                </p>
                                                                _______________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 1 - Download a FREE Trial of the #1 Rated EHR Today</h3>
                                                                <p>
                                                                    Amazing Charts lets you try a full version of the software for a FREE trial.
                                                                </p>
                                                                <p>
                                                                    Seeing is believing, and the only way to experience Amazing Charts is to try it
                                                                    for yourself.
                                                                </p>
                                                                <p>
                                                                    So, what are you waiting for?
                                                                </p>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/trial/"
                                                                        style="color: blue">Start a FREE Trial</a></p>
                                                                <p>
                                                                    We have several training options available to help you throughout the trial period,
                                                                    click here to learn more.
                                                                </p>
                                                                ________________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 2 - Import Your Patient Demographics with the FREE Amazing Importer!
                                                                </h3>
                                                                <p>
                                                                    One the best things about switching to Amazing Charts is that you can easily and
                                                                    quickly import patient demographics.
                                                                </p>
                                                                <p>
                                                                    Just export your patient data to an Excel spreadsheet (i.e., CSV file) and our Amazing
                                                                    Importer utility does all the work.
                                                                </p>
                                                                <p>
                                                                    You can contact <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">Technical Support </a>for assistance with importing your
                                                                    demographics, or watch the following five-minute video tutorial to see how to do
                                                                    it yourself:
                                                                </p>
                                                                ________________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 3 - Import Continuity of Care Documents and More...
                                                                </h3>
                                                                <p>
                                                                    Okay, let's review.
                                                                </p>
                                                                <p>
                                                                    First, you activated a free trial of Amazing Charts.
                                                                </p>
                                                                <p>
                                                                    Next, you imported patient demographics from your old EHR.
                                                                </p>
                                                                <p>
                                                                    At this point, you can simply start using Amazing Charts to create new patient records.
                                                                </p>
                                                                <p>
                                                                    But what about the patient records in your old EHR system? What can we do about
                                                                    them? What works best for you depends entirely on your goals and how much money
                                                                    you're willing to spend.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Import Structured Data
                                                                </h3>
                                                                <p>
                                                                    Continuity of Care Documents (CCDs) / Continuity of Care Records (CCRs) specify
                                                                    the encoding, structure, and semantics of a patient summary clinical document for
                                                                    exchange.
                                                                </p>
                                                                <p>
                                                                    The CCD/CCR patient summary contains a core data set of the most relevant administrative,
                                                                    demographic, and clinical information facts about a patient's healthcare, covering
                                                                    one or more healthcare encounters.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts can import a CCD as an Imported Item, essentially adding a viewable
                                                                    report to the patient’s chart. To be clear, this does not parse out all of the discrete
                                                                    data elements contained within a CCD and add them to the different sections of the
                                                                    patient’s chart.
                                                                </p>
                                                                <p>
                                                                    Exporting and importing a CCD/CCR is doable for some major EHR systems, but not
                                                                    all. Check with your vendor.
                                                                </p>
                                                                <p>
                                                                    To learn more about importing CCDs, contact <a target="_blank" class="Boldcolor"
                                                                        href="../DssUser/ContactUs.aspx" style="color: blue">Technical Support.</a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Manual Transcription
                                                                </h3>
                                                                <p>
                                                                    In order to make a complete transfer of structured data from your old EHR to Amazing
                                                                    Charts, you have two choices:</p>
                                                                <ul>
                                                                    <li>Manual data transfer by a medical transcription service. </li>
                                                                    <li>Dss Solutions will do E2E Data extraction and conversion for your practice.
                                                                    </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Scan Patient Records
                                                                </h3>
                                                                <p>
                                                                    You can scan your old patient charts into the patient's Imported Items section of
                                                                    Amazing Charts using a scanner with a Twain Driver.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    EHR Archive
                                                                </h3>
                                                                <p>
                                                                    Your least expensive and lowest risk option is to simply archive your entire legacy
                                                                    EHR data set for reference on an "as needed" basis. This satisfies all data retention
                                                                    requirements.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits16" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Why Dss Solutions? </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions is a globally-known, leading-edge, actionable business analytics solutions
                                                                    provider that has served our clients' total IT and business solutions requirements
                                                                    in the Healthcare and Government industries since 1992, utilizing the talented Dss
                                                                    Solutions technical and business SME resource pools and innovative "Center of Excellence"
                                                                    delivery methodologies. Being partnered with Amazing Charts, Microsoft, and Tableau,
                                                                    Dss Solutions has access to vast partner resources and support on delivery sound
                                                                    solutions with the most technically advanced, leading-edge technologies.
                                                                </p>
                                                                <p>
                                                                    We have extensive experience in architecting, designing, developing, and managing
                                                                    IT applications of any size as well as in providing high-value services around packaged
                                                                    enterprise applications on-premise, online, and on-cloud.
                                                                </p>
                                                                <p>
                                                                    We have helped many of our clients nationwide to move from their troubled EHR/PM
                                                                    applications to Amazing Charts seamlessly, trained them to use our easy-to-use EHR/PM
                                                                    application, and supported them with our dedicated teams online and on-premise.
                                                                    With our Meaningful-Use team, we have helped our clients to prepare for stage 1
                                                                    and 2.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Hosts Amazing Charts on Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Running an Electronic Health Record (EHR) system from your office can be a real
                                                                    pain &ndash; even with an EHR as easy to use as Amazing Charts.
                                                                </p>
                                                                <p>
                                                                    First, there are the costs and headaches associated with hardware, software, and
                                                                    networking. Next, there are concerns about the privacy and security of keeping patient
                                                                    health information on site. Finally, you need to make sure your EHR application
                                                                    is the latest version, so you don’t fall behind on government and payer requirements.
                                                                </p>
                                                                <p>
                                                                    Now there is a better way: Amazing Charts on the Microsoft Cloud with 99.9 SLA and
                                                                    Microsoft security.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Value-Add: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We will be your partner-in-business for all your IT requirements. We will make sure
                                                                    that you don’t have any challenges with your EHR/PM applications. We will constantly
                                                                    review the EHR/PM application to identifying any possible application bugs, reported
                                                                    to the developers, and find a workaround while they are fixing them, before you
                                                                    encounter the bug.
                                                                </p>
                                                                <p>
                                                                    The Dss Solutions Data transformation skill set helps our clients to move from any
                                                                    EHR application to Amazing Charts. We can move any practice data to Amazing Charts
                                                                    with reasonable time and cost.
                                                                </p>
                                                                <p>
                                                                    Dss Solutions’ major strength is healthcare analytics. As a partner of Microsoft
                                                                    with Business Intelligence Gold competency, we have been developing healthcare analytics
                                                                    and predictive analytics and delivering ad-hoc reports, Key Performance Indicators,
                                                                    and scorecards in very flexible dashboards for large clinical organizations; and
                                                                    we can do the same for your practice.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Implementation Process: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    If there are no significant patient data in your current EHR/PM application, then
                                                                    Dss Solutions will help to move them to Amazing Charts manually and FAST. However,
                                                                    if you have accumulated a significant amount of patient data (demographic and clinical),
                                                                    financial and operational data, we will start the discovery phase. Throughout the
                                                                    discovery phase, the Dss Solutions transformation team will study the requirements
                                                                    to move your practice’s clinical, financial, and operational data to the Amazing
                                                                    Charts database and to propose solutions with the different options we have discovered.
                                                                    Then you will choose the best economic and practical transformation option for our
                                                                    team to implement.
                                                                </p>
                                                                <p>
                                                                    After moving your practice’s data to Amazing Charts, the Dss Solutions transformation
                                                                    team will help to set up e-Prescribing, the patient portal, and any other programs
                                                                    required by the practice.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">References: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions has been providing business analytics solutions to large organizations
                                                                    like the Department of Justice, the Department of Health and Human Services, the
                                                                    Texas Health and Human Services Commission (HHSC), HP, IBM, and al-Salam Hospital
                                                                    in Kuwait, to name a related few. After many requests from healthcare practices
                                                                    through hospital affiliations, we have decided to provide EHR/PM solutions and support
                                                                    to the practices who came to know Dss Solutions’ knowledge and its skill set on
                                                                    healthcare business analytics. To do so, we have partnered up with Amazing Charts
                                                                    to serve our SMB healthcare clients, in addition to other services that we provide.
                                                                    Please refer to <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/customer-video-testimonials/"
                                                                        style="color: blue">here </a>for testimonials.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Additional Services: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    When we say that we want to be your partner-in-business for life, we mean it. We
                                                                    want to bring total IT solutions and dedicated support to your practice so that
                                                                    you can focus on what you do best, serving your clients effectively, without having
                                                                    any concerns about your practice’s IT solutions. As a Microsoft Gold Partner with
                                                                    Small Business Competency, we have been providing big business solutions to our
                                                                    SMB clients for years.
                                                                </p>
                                                                <p>
                                                                    We implement the full Microsoft office online (Content Management, Collaboration
                                                                    ecosystem, CRM); host the EHR/PM solutions and implement a business analytics solutions
                                                                    on-cloud utilizing the Microsoft Azure cloud technology and security so you won’t
                                                                    need any expansive servers with a complex networking and high maintenance cost in
                                                                    your office, which translate to a big saving for your business; develop customized
                                                                    website by partnering with Networksolutions and Web.com; and bring enterprise&ndash;class
                                                                    communication that are highly reliable, flexible, scalable and priced specifically
                                                                    for small businesses by partnering with many of your local communication providers.
                                                                </p>
                                                                <p>
                                                                    Dss Solution being your partner-in-business, you can rest assure that your IT department
                                                                    is working for your practice non-stop without paying heavy IT expanses. And <b class="Boldcolor">
                                                                        YES</b>, Dss Solutions would be your <b class="Boldcolor">ONLY</b> dedicated
                                                                    business total IT solutions support, including hardware maintenance.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Dedicated Service, Support
                                                                and Training: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions has a dedicated technical support team for Healthcare solutions with
                                                                    vast technical and industry knowledge to support all our healthcare clients. Amazing
                                                                    Charts in an application within Dss Solutions Healthcare offering. Our team is dedicated
                                                                    to support your.
                                                                </p>
                                                                <p>
                                                                    When we say that we want to be your partner-in-business for life, we mean it. We
                                                                    want to bring total IT solutions and dedicated support to your practice so that
                                                                    you can focus on what you do best, serving your clients effectively, without having
                                                                    any concerns about your practice’s IT solutions.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Healthcare EHR/PM Total Integration Pricing:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We offer many packages, from EHR applications to total integrated healthcare SMB
                                                                    solutions and everything in between. We can work with you to find the best practical
                                                                    solution for your practice with reasonable pricing. We are eager to talk with you
                                                                    about your requirements.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">What Is Next? </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We can help you with the decision process by setting you up with a trial on-cloud
                                                                    account with demo data for you to test our integrated solutions for 30 days, AND/OR
                                                                    we can demo the solutions virtually or in-person to answer any questions you might
                                                                    have before making your final decision. We can also have a requirement gathering
                                                                    session on how to set up completely integrated solutions for your practice, effectively
                                                                    with fair pricing. Call us at <span class="skype_c2c_print_container notranslate">(202)
                                                                        256-6867</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                            data-numbertocall="+912022566867" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                            onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                            tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="skype_c2c_container"><span
                                                                                skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                    id="non_free_num_ui" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                        class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202) 256-6867</span><span
                                                                                            class="skype_c2c_free_text_span"></span></span></span></span>
                                                                    or contact us for <a target="_blank" class="Boldcolor" href="http://www.dsssolutions.com//DssUser/ContactUs.aspx"
                                                                        style="color: blue">Dss Cloud Integrated Cloud Solutions </a>to take the next
                                                                    step.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits17" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Guardian Angel Support </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Subscribers to <a class="Boldcolor" style="color: black">Guardian Angel Support</a>
                                                                    have access to expert technicians weekdays from 8 AM to 9 PM EST (5 AM to 6 PM PST),
                                                                    and after hours (for emergencies mostly*).
                                                                </p>
                                                                <p>
                                                                    Guardian Support representatives are experts in Product Support or Technical Support.
                                                                </p>
                                                                <p>
                                                                    The Product Support team specializes in teaching users how to operate Amazing Charts.
                                                                    Not sure how to write an order? Wondering how to renew a medication? Need help with
                                                                    Meaningful Use? Ask for Product Support.
                                                                </p>
                                                                <p>
                                                                    Technical Support specializes in setup, installation and the functionality of Amazing
                                                                    Charts. If you need help getting started with Amazing Charts, or if a function of
                                                                    Amazing Charts is not working properly, ask for Technical Support.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    <a class="Boldcolor" style="color: black">Contact the Guardian Angel Support Team in
                                                                        any of the following ways:</a>
                                                                </h3>
                                                                <ul>
                                                                    <li><a class="Boldcolor" style="color: black">Live Chat:</a> Connect with Guardian Angel
                                                                        Support by clicking Start Session below. This is the easiest and fastest way to
                                                                        access our Product and Technical Support experts, and it allows us to quickly log
                                                                        into your system if we need to. Live Chat is available Monday to Friday, 8 AM to
                                                                        9 PM Eastern Standard Time (EST). Chat with Us (Chat with Dss Solutions) </li>
                                                                    <li><a class="Boldcolor" style="color: black">Telephone: </a><span class="skype_c2c_print_container notranslate">
                                                                        (202) 256-6867</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                            data-numbertocall="+912022566867" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                            onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                            tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="Span4"><span
                                                                                skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                    id="Span6" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                        class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202) 256-6867</span><span
                                                                                            class="skype_c2c_free_text_span"></span></span></span></span>-
                                                                        Press 1 for Technical Support. Phone support is available Monday to Friday, 8 AM
                                                                        to 5 PM CST. For after hours and emergency technical support, call <span class="skype_c2c_print_container notranslate">
                                                                            (866) 382-5932</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                                data-numbertocall="+918663825932" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                                onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                                tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="Span7"><span
                                                                                    skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                        id="Span8" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                            class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(866) 382-5932</span><span
                                                                                                class="skype_c2c_free_text_span"></span></span></span></span>-
                                                                        Press 1</li>
                                                                    <li><a class="Boldcolor" style="color: black">Email: </a>You can send an email to DssSupport@DssSolutions.com
                                                                        at any time. Guardian Angel Support Technicians respond throughout the day (and
                                                                        frequently evenings too). </li>
                                                                </ul>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">*Emergencies: After-hours emergency service
                                                                        is included with our Guardian Angel Support service - emergencies are defined as
                                                                        an inability to access your data. </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    How Our Guardian Angel Support Works</h3>
                                                                <p>
                                                                    When you report an issue, our Guardian Angel Support team will gather some information
                                                                    about your practice and set up. This information will ensure we understand the issue
                                                                    and have all the data required to diagnosis and resolve the issue - in as short
                                                                    a period of time as possible, and with as little hassle to you as possible. Some
                                                                    of the information we'll be asking includes:
                                                                </p>
                                                                <ul>
                                                                    <li>Your contact information</li>
                                                                    <li>The version of Amazing Charts you are using - we can help you find this info.
                                                                    </li>
                                                                    <li>The specific problem you are experiencing</li>
                                                                    <li>Your computer hardware (e.g., processor) - we can help you find this</li>
                                                                    <li>Operating System (OS) - we can help you with this</li>
                                                                    <li>How many computers are affected</li>
                                                                    <li>The way your computer network is set up, including which computers are wired and
                                                                        which are connected wirelessly. </li>
                                                                </ul>
                                                                <p>
                                                                    The details associated with each problem reported to us are logged into our ticketing
                                                                    system, which serves four purposes:</p>
                                                                <ul>
                                                                    <li>It saves you time; you don’t have to repeat detailed information if the Guardian
                                                                        Angel Support technician needs to escalate the issue to a higher technician tier.
                                                                    </li>
                                                                    <li>It allows you to follow up on the progress of the issue (if your issue happens to
                                                                        be one of the tiny minority that aren't solved during the first call). </li>
                                                                    <li>It maintains a comprehensive history to help identify larger issues and patterns
                                                                        which might explain them. </li>
                                                                    <li>It allows us to create a deeper and richer knowledge base so we can serve clients
                                                                        even faster in the future. </li>
                                                                </ul>
                                                                <p>
                                                                    While the vast majority of issues are resolved within the first call (and this is
                                                                    our goal), some more complex issues may take several hours to several days, and
                                                                    require the input of people. When there is a backlog of issues to resolve, we triage
                                                                    issues based on the following:</p>
                                                                <ul>
                                                                    <li>Non-Urgent Client requires information/education</li>
                                                                    <li>Urgent Client is experiencing noticeable problems but can still perform most tasks
                                                                        in Amazing Charts</li>
                                                                    <li>Critical Client is experiencing noticeable problems in Amazing Charts that impact
                                                                        business operations</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    After Hours</h3>
                                                                <p>
                                                                    The Amazing Charts Help Desk is staffed weekdays from 8 AM to 9 PM EST with the
                                                                    following exceptions:
                                                                </p>
                                                                <ul>
                                                                    <li>New Year's Day </li>
                                                                    <li>Memorial Day </li>
                                                                    <li>Independence Day</li>
                                                                    <li>Labor Day </li>
                                                                    <li>Thanksgiving </li>
                                                                    <li>Christmas </li>
                                                                </ul>
                                                                <p>
                                                                    After hours and during holidays, we continuously monitor chats and telephone messages
                                                                    for help requests of an urgent nature (i.e., you can't get the program running and
                                                                    have patients waiting to be seen). Please leave details of your emergency.
                                                                </p>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">Emergencies: </a>After normal business
                                                                    hours, the Guardian Angel Support staff continues to monitor chat requests and phone
                                                                    messages and respond to emergency situations. Please be sure to leave the details
                                                                    of your emergency to ensure it isn't triaged to the next business day.
                                                                </p>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">Non-Emergency Issues: </a>The Amazing
                                                                    Charts Guardian Angel Support team would be happy to assist you install, upgrade,
                                                                    and provide other guidance after normal hours as your schedule requires. For these
                                                                    non-emergent requests, please arrange by <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">contacting</a> or email us at DssSupport@DssSolutions.com.
                                                                </p>
                                                                Note: Creating an appointment uses the download form with following changes: Please
                                                                complete all the fields with your requirement to submit. One of Dss Solutions Healthcare
                                                                Technical Support expert will contact you within 24 hours. If is urgent issue, please
                                                                call <span class="skype_c2c_print_container notranslate">(202)256-6867</span><span
                                                                    data-ismobile="false" data-isrtl="false" data-isfreecall="false" data-numbertocall="+912022566867"
                                                                    onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)" onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)"
                                                                    onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)" tabindex="-1"
                                                                    dir="ltr" class="skype_c2c_container notranslate" id="Span9"><span skypeaction="skype_dropdown"
                                                                        dir="ltr" class="skype_c2c_highlighting_inactive_common"><span id="Span10" class="skype_c2c_textarea_span"><img
                                                                            width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                            class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202)256-6867</span><span
                                                                                class="skype_c2c_free_text_span"></span></span></span></span>. Services
                                                                = AC Support in database Requirements = Amazing Charts Technical Support; you need
                                                                to add this to the list. Requirements Explanation = Not an urgent issue. Please
                                                                contact me 9am-5pm CDT for Amazing Charts technical support
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Make an appointment to get support </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Guardian Angel Product Support team specializes in teaching users how to operate
                                                                    Amazing Charts. Not sure how to write an order? Wondering how to renew a medication?
                                                                    Need help with Meaningful Use? Product Support team members can teach how to use
                                                                    every facet of Amazing Charts, including e-Prescribing, Charting, Billing, Reports,
                                                                    Office Flow, and more.
                                                                </p>
                                                                <p>
                                                                    Our Product Support team:</p>
                                                                <ul>
                                                                    <li>Specializes in the operation of Amazing Charts</li>
                                                                    <li>Responds to all How-To questions</li>
                                                                    <li>Conducts live, instructional webinars for clients and non-clients on a daily basis.
                                                                    </li>
                                                                    <li>Conducts one-on-one training sessions for clients who need extra guidance</li>
                                                                    <li>And more! </li>
                                                                </ul>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        here </a>to make an appointment with Product Support.</p>
                                                                <h3 style="font-weight: bolder">
                                                                    Technical Support
                                                                </h3>
                                                                <p>
                                                                    The Guardian Angel Technical Support team specializes in setup, installation and
                                                                    the functionality of Amazing Charts. If you need help getting started with Amazing
                                                                    Charts, or if a function of Amazing Charts is not working properly, you should contact
                                                                    Technical Support.
                                                                </p>
                                                                <p>
                                                                    Our Technical Support team:</p>
                                                                <ul>
                                                                    <li>Specializes in setup, installation, and functionality of Amazing Charts</li>
                                                                    <li>Repairs issues resulting from Windows XP, Vista and 7 operating systems</li>
                                                                    <li>Moves databases from one computer to another as the needs of our clients change</li>
                                                                    <li>Ensures that Amazing Charts client experience 100% functionality</li>
                                                                    <li>And more! </li>
                                                                </ul>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        Make an appointment with Technical Support. </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Video Tutorials for self-paced training
                                                            </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here</a> for everything you need to know about Meaningful
                                                                    Use Stage 1, Meaningful Use Stage 2, AC Installation and Upgrading, AC new features,
                                                                    AC Office Flow, AC third parties integration, Helpful Hints, and more.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">System Requirements for Amazing Charts:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    One thing that makes the Amazing Charts Electronic Health Record (EHR/EMR) system
                                                                    so <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/?id=67" style="color: blue">
                                                                        affordable </a>is the ability to run on standard personal computers. In fact,
                                                                    you can run Amazing Charts on nearly any PC that you can purchase today.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts works on most Microsoft Windows Operating Systems (e.g., Windows
                                                                    7, Vista, Small Business Server, and others), and even runs on tablets and netbooks.
                                                                </p>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/hardware-os-requirements/"
                                                                        style="color: blue">here </a>for latest system and OS requirement from Amazing
                                                                    Charts.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Join the Discussion with Online Communities:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Are you looking to meet other users of Amazing Charts so you can share tips, ask
                                                                    questions, or just chat with like-minded people?
                                                                </p>
                                                                <p>
                                                                    There are many ways to interact with our community of users. Click <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/support/online-community/" style="color: blue">
                                                                        here </a>to view user groups.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Users Conference (ACUC):
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Held in conjunction with <a target="_blank" class="Boldcolor" href="http://www.pri-med.com/pmo/Home.aspx"
                                                                        style="color: blue">Pri-Med </a>events, these one-day conferences feature informational
                                                                    sessions led by Amazing Charts staff and users and the opportunity to meet and share
                                                                    knowledge with other Amazing Charts users in your area.
                                                                </p>
                                                                <ul>
                                                                    <li>October 18, 2014: ACUC Midwest - Chicago, IL</li>
                                                                    <li>February 7, 2015: ACUC South - Fort Lauderdale, FL </li>
                                                                    <li>March, 2015: ACUC Southwest - Houston, TX</li>
                                                                    <li>March, 2015: ACUC West - Anaheim, CA</li>
                                                                    <li>September, 2014: ACUC East - Boston, MA</li></ul>
                                                                <p>
                                                                    Here are some images from past conferences. Click <a target="_blank" class="Boldcolor"
                                                                        href="https://www.facebook.com/media/albums/?id=346564170449" style="color: blue">
                                                                        here </a>to see more.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits18" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts on-Cloud - Just $39 Per Seat
                                                                Per Month </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    Do you want to avoid the IT expense and headache of running an Electronic Health
                                                                    Record (EHR/EMR) system from your own computers?
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Amazing Charts is now available as a fully hosted service! All you need is a connection
                                                                    to the Internet, and you can start using a certified complete EHR in your practice
                                                                    today.
                                                                </p>
                                                                <h3 style="color: Black">
                                                                    Affordable Pricing &ndash; Just $39 Per Seat Per Month</h3>
                                                                <p style="color: black" class="Font">
                                                                    Our partner recently slashed the cost of Amazing Charts in the Cloud to just $39
                                                                    per seat per month, making this solution as affordable as running Amazing Charts
                                                                    from your own office, once you take technology costs into consideration.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Please note that this cost does not include one-time license fee ($1200/clinician),
                                                                    annual cost of Support and Maintenance ($1195/clinician), and any other required
                                                                    software and services.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Get Started Now with a Free 28-Day Trial
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    The best thing about Amazing Charts in the Cloud is how easy it is to try, buy,
                                                                    and use.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    First, start a <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">FREE </a>trial today. You can create your own database with
                                                                    real patient database and even use your existing interfaces.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Next, if you like Amazing Charts in the Cloud you simply <a target="_blank" class="Boldcolor"
                                                                        href="../DssUser/ContactUs.aspx" style="color: blue">license </a>our software,
                                                                    and then our hosting partner handles all of the implementation and set up.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Financial Benefits of Amazing Charts on-Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Benefits that feed your bottom-line</h3>
                                                                <p style="color: black" class="Font">
                                                                    Amazing Charts in the Cloud offers financial benefits to your practice such as:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower upfront and ongoing financial investment:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>No extra hardware purchases</li>
                                                                    <li>No need for local server hardware </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower IT costs and requirements:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>System performance monitored centrally</li>
                                                                    <li>No need for dedicated IT person on staff</li>
                                                                    <li>Lower costs for software long term</li>
                                                                    <li>Windows Server 2008 R2 licensing included no added costs</li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower energy requirements:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Lower electrical usage</li>
                                                                    <li>Lower HVAC usage</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Accessing Amazing Charts in the Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    You can securely access Amazing Charts in the Cloud from any location:
                                                                </p>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Access from Office, Hospital, Home or even at a house call</li>
                                                                    <li>Rapid deployment for your practice no setup required by in-house staff </li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/interfaces/"
                                                                        style="color: blue">Interfaces </a>fully configured and ready to use</li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/remote-scanning/"
                                                                        style="color: blue">Remote scanning </a>supported (not on Mac) </li>
                                                                    <li>Remote printing supported</li>
                                                                    <li>Access from a PC, Mac, or even an iPad</li>
                                                                    <li>No VPN required</li>
                                                                    <li>24/7/365 availability</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts in the Cloud Security
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Two levels of security protect your practice</h3>
                                                                <h2 style="font-weight: bolder">
                                                                    Level One &ndash; System Security:
                                                                </h2>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Secure encrypted connectivity via 256-bit SSL</li>
                                                                    <li>Dedicated IP address and internal network for each practice</li>
                                                                    <li>Firewalled network connectivity</li>
                                                                    <li>VPN access is available if needed</li>
                                                                    <li>Windows Server Active Directory based authentication schemes for each practice</li>
                                                                    <li>Separate single server for every practice</li>
                                                                    <li>Separate SQL instance for each practice</li>
                                                                    <li>Proactive monitoring</li>
                                                                    <li>High availability for your practice </li>
                                                                </ul>
                                                                <h2 style="font-weight: bolder">
                                                                    Level Two &ndash; Cloud Data Center Security:
                                                                </h2>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>SAS 70 Type II Facilities</li>
                                                                    <li>Biometric authentication to all secure areas/doors</li>
                                                                    <li>Three-Factor man-trap authentication &amp; anti-pass back (Proximity card/biometric
                                                                        fingerprint reader/facial geometry scanner) </li>
                                                                    <li>Two-Factor access to cages (Proximity card/biometric fingerprint reader) </li>
                                                                    <li>24/7/365 on-site security</li>
                                                                    <li>High-definition CCTV network covering all interior and exterior strategic locations
                                                                        and access points, with 90-days video retention </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Data Protection with Built-in Disaster Recovery
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    Worried about the cost of a Disaster Recovery solution on top of traditional backups?
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    With Amazing Charts in the Cloud, there are two levels of Data Protection. These
                                                                    include both local and offsite data storage, with the ability to restore a single
                                                                    file or the complete system, either locally or in a secondary facility.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Disaster Recovery is a standard component built into Amazing Charts in the Cloud.
                                                                    No extra cost to your practice, just added reliability and peace of mind ensuring
                                                                    maximum up-time.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Level One &ndash; Cloud data center local backups and server snapshots:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Full and incremental daily server snapshots</li>
                                                                    <li>Ability to recover SQL only</li>
                                                                    <li>Ability to recover imported items only</li>
                                                                    <li>Secure encrypted data storage while at rest</li>
                                                                    <li>Built-in disaster recovery </li>
                                                                    <li>Automated jobs to ensure no human error</li>
                                                                    <li>No tapes to change &ndash; all disk storage</li>
                                                                    <li>Eliminates headaches of traditional backups </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Level Two &ndash; Cloud data center failover to remote location:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Ability to restore the entire server in a secondary offsite data center</li>
                                                                    <li>East Coast and West Coast site replication</li>
                                                                    <li>Full and incremental daily server snapshots to secondary offsite data center</li>
                                                                    <li>Ability to recover SQL only offsite</li>
                                                                    <li>Ability to recover imported items only offsite</li>
                                                                    <li>Secure encrypted data storage while at rest</li>
                                                                    <li>Redundant backups nightly</li>
                                                                    <li>Amazing availability for your practice and your data built into our solution
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Remote Scanning </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    There are two options for scanning documents into Amazing Charts in the Cloud:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Quest Remote Scan</h3>
                                                                <p style="color: black" class="Font">
                                                                    You can use third-party software to scan directly into Amazing Charts. These applications
                                                                    must be purchased directly from third-party software vendors, not Amazing Charts.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <i>We recommend Quest Remote Scan and we have negotiated special pricing with them.
                                                                        A single license that regularly retails for $348 is priced at only $190 for clients
                                                                        of Amazing Charts in the Cloud. </i>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Import into Amazing Charts
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    You also have the option of scanning to Amazing Charts without third-party software.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    First, you scan the document to a folder on your computer/network. Then go into
                                                                    the patient's imported items, select "Import File," and browse to the location where
                                                                    you saved the file.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts in the Cloud: Frequently Asked
                                                                Questions </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-1"
                                                                        style="color: blue"><u>What is Amazing Charts in the Cloud? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-2"
                                                                        style="color: blue"><u>How much will it cost? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                        style="color: blue"><u>What does the price include? </u></a>
                                                                </p>
                                                                <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                    style="color: blue"></a>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                        style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-4"
                                                                            style="color: blue"><u>How can I try it for free? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-5"
                                                                        style="color: blue"><u>What are the top benefits of Amazing Charts in the Cloud?
                                                                        </u></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Billing Services Priced Seven Percent or
                                                                Less! </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    What is the worst part about your practice? For many of us. it's the billing nightmare.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    To this end, Amazing Charts has contracted with a select few high-quality billing
                                                                    companies, willing to abide by our company's fundamental requirements of "amazing
                                                                    customer service at an amazing price with no nickle-and-diming allowed."
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    The result is that you can finally get paid quickly, appropriately, and without
                                                                    worrying that you aren't following the myriad of laws and regulations that make
                                                                    the practice of medicine so onerous.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    No more frustration dealing with individual payers or unorganized billers. No more
                                                                    angst trying to figure out complicated billing software that only an accountant
                                                                    should use. Instead, let our contracted partners deal with all your billing and
                                                                    show you how amazing and easy your cash flow can be.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    How does it work?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    As you sign your notes in Amazing Charts, an electronic superbill is automatically
                                                                    generated. Each night, easily export and upload this superbill data over a secured
                                                                    and encrypted (HIPAA-compliant) connection to our servers. The third-party billing
                                                                    company takes this data, reviews and scrubs it for errors, submits it, and deals
                                                                    with denials.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Invoices for unpaid balances are sent out monthly, and uncollected charges can even
                                                                    be submitted directly to a collection agency on a case by case basis. Because using
                                                                    the Amazing Charts software allows improved efficiency and reduced data-entry expense
                                                                    for the billing companies, they are able to pass these savings back to you.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    What are the benefits?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    Our recommended billing partners are beyond experienced when it comes to coding.
                                                                    They are always up to speed on the constantly changing billing rules that none of
                                                                    us have the time to track. Being able to outsource your billing will lead to lower
                                                                    overhead expenses including software and labor hours, and many smaller expenses
                                                                    can be eliminated like postage and supplies. You will probably notice improved morale
                                                                    among your staff as one of the more stressful and time-consuming tasks is handed
                                                                    over to the experts. This will reduce employee turnover and training expenses. You
                                                                    will also benefit from the detailed account reporting all of our partners provide
                                                                    as well as cloud access to your account with many of them.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Why is it worth the investment?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    Beyond the savings you will realize from your overhead expenses, our billing partners
                                                                    pride themselves on maximizing your time. This means that maybe an updated coding
                                                                    may qualify you for more from the insurance carrier than the coding your staff has
                                                                    used. Being up to speed on the new coding means less denials and rejects which result
                                                                    in faster collections of the funds your practice is due to receive. In the end,
                                                                    you only will pay the billing company based on your net collections. We have negotiated
                                                                    with them to keep this <b class="Boldcolor"><u>rate of 7% or less of your net collections.
                                                                    </u></b>
                                                                </p>
                                                                <b class="Boldcolor">
                                                                    <p style="color: black" class="Font">
                                                                        You will be able to find cheaper options on the market from time to time. Remember,
                                                                        when you purchase a service, the price is a small factor in the value. Anyone of
                                                                        us has learned this in many other facets of life. Don’t overlook that insight in
                                                                        your business decisions.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        What do I get in return?
                                                                    </h3>
                                                                    <ul style="margin-left: 40px" class="Font">
                                                                        <li>24/7 access to account information (including A/R, daily billing information, and
                                                                            coding analysis). </li>
                                                                        <li>Denial resubmission without requiring your input (whenever possible). </li>
                                                                        <li>Checks sent/deposited directly to you from insurers and patients. </li>
                                                                        <li>Patient billing and invoicing (with no stamp or mailing fees). </li>
                                                                        <li>Toll-Free number for patients to call with billing issues/questions. </li>
                                                                    </ul>
                                                                </b>
                                                            </div>
                                                            <b class="Boldcolor"></b>
                                                        </div>
                                                        <b class="Boldcolor"></b>
                                                    </div>
                                                    <b class="Boldcolor">
                                                        <div class="acc-container">
                                                            <div class="acc-btn">
                                                                <span class="selected ContentHeadingStyle">Credit Card Processing for Medical Practices
                                                                </span>
                                                            </div>
                                                            <div class="acc-content ">
                                                                <div class="acc-content-inner">
                                                                    <p style="color: black" class="Font">
                                                                        In striving to make your office as profitable and easy to operate as possible, Amazing
                                                                        Charts has partnered with a proven merchant service provider to handle all your
                                                                        electronic payment processing.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        All Major Credit Cards Covered...and More</h3>
                                                                    <p style="color: black" class="Font">
                                                                        The service provider specializes in handling credit card payments for all major
                                                                        credit cards (Visa, MasterCard, American Express, and Discover), as well as handling
                                                                        transactions involving secured debit/ATM cards, electronic checks, and many other
                                                                        options available for securing payment for your services.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        On behalf of the Amazing Charts community, the following terms have been negotiated
                                                                        and placed into effect for your benefit:
                                                                    </h3>
                                                                    <ul style="margin-left: 40px" class="Font">
                                                                        <li><b class="Boldcolor">Timely Follow-up: </b>We have mandated that any Amazing Chart
                                                                            referral is contacted by an experienced representative within two business days.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Personal Assignment: </b>You will be assigned to a dedicated
                                                                            representative who is familiar with your situation and needs. This saves you time
                                                                            since it avoids having to explain things more than once to different representatives.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Association Pricing: </b>We have leveraged our size to obtain
                                                                            the lowest possible credit card processing rates and fees without ever sacrificing
                                                                            service. </li>
                                                                        <li><b class="Boldcolor">Transparency: </b>You will receive full disclosure on pricing…period.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Free Cost Analysis: </b>Many offices already have a payment
                                                                            processing arrangement in place. Our partner will evaluate your current program
                                                                            to see if a change would bring sufficient savings to justify switching. </li>
                                                                        <li><b class="Boldcolor">Discounted Equipment: </b>Terminals will be offered at a discount.
                                                                            Offices with terminals currently in place will have the option of using them whenever
                                                                            compatible. </li>
                                                                        <li><b class="Boldcolor">Next Day Funding: </b>There is no reason for an office to wait
                                                                            for their payments for any card type, even American Express. All payments will be
                                                                            made within 24 hours. </li>
                                                                        <li><b class="Boldcolor">Electronic Check Programs: </b>Checks are still a very popular
                                                                            form of payment for co-payments and other medical services. Processing those checks
                                                                            directly in your office will eliminate trips to the bank and bounced checks.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Advanced Technology: </b>Whether it’s virtual terminals, on-line
                                                                            monitoring, or even smartphone payment applications, you are assured that the most
                                                                            advanced payment and monitoring solutions will be delivered to your office.
                                                                        </li>
                                                                        <li><b class="Boldcolor">24/7/365 Live Technical Support: </b>Experts are available
                                                                            to walk you through any questions you may have about your payment equipment, account,
                                                                            or anything else related to payment processing. </li>
                                                                        <li><b class="Boldcolor">Satisfaction Guaranteed </b></li>
                                                                        <b class="Boldcolor"></b>
                                                                    </ul>
                                                                </div>
                                                                <b class="Boldcolor"></b>
                                                            </div>
                                                            <b class="Boldcolor"></b>
                                                        </div>
                                                        <b class="Boldcolor"></b></b>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="DssCommitment tbltd DssCommitmentbtmRight">
                <h1 class=" Header2 headTitle headerEHR2" id="rightheader1">
                    Integrated Healthcare Solutions</h1>
                <section id="intro2" class="clear ">
                    <article class="one_quarter first cieserice"><a onclick="setVisibility(&#39;sub3&#39;, &#39;inline&#39;);" ;="">
                                
                        <img id="img" class="imgNew" src="./Content/Images/Icon_E2EData.png" onclick="show()">
                                </a>
        </article>
         <article class="one_quarter cieserice">
          <a onclick="setVisibility(&#39;sub4&#39;, &#39;inline&#39;);" ;="">
                                <img id="img1" class="imgNew" src="./Content/Images/icon_Collaborationforall.png" onclick="show1()">
                               
                                </a>
        </article>
        <article class="one_quarter cieserice">
         <a onclick="setVisibility(&#39;sub5&#39;, &#39;inline&#39;);" ;=""><img class="imgNew" id="img2" src="./Content/Images/Icon_ContentMgmt.png" onclick="show2()">
          
                                    </a>
        </article>
         <article class="one_quarter cieserice">
         <a onclick="setVisibility(&#39;sub6&#39;, &#39;inline&#39;);" ;="">
                                        <img id="img3" class="imgNew" src="./Content/Images/Icon_ClinicalAnalytics.png" onclick="show3()">
                                          
                                    </a>
        </article>
        
        <article class="one_quarter last">
         <a onclick="setVisibility(&#39;sub7&#39;, &#39;inline&#39;);" ;="">
                                        <img id="img4" class="imgNew" src="./Content/Images/Icon_CloudSecuredData.png" onclick="show4()">
                                         
                                       </a>
        </article>
      </section>
            </div>
        </div>
        <div class="wrapper row3">
            <div id="container">
                <div id="benefits" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232); width: 100%">
                        <tbody>
                            <tr>
                                <td>
                                    <table style="border: hidden; width: 100%">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn technology1 ">
                                                            <span class="selected ContentHeadingStyle ">E2E Data Migration:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Many Electronic Healthcare Record and Practice Management solution providers get
                                                                    you into their system and TRY very hard to keep your account; happy or not with
                                                                    the solution. They use scary tactics that you won’t have your current patient and
                                                                    financial records when you move to a new EHR/PM solution. Moreover, government has
                                                                    created urgency for EHR adoption in the healthcare industry. Provider organizations
                                                                    that do not have an EHR are actively interested in making a purchase, while organizations
                                                                    that have an EHR are looking to upgrade to a "Meaningful Use" compliant system.
                                                                    Please talk to us, we can help.
                                                                </p>
                                                                <p>
                                                                    While we are not an EHR company, but we have years of experience on data transformation
                                                                    from very large database and multiple integrated applications. Our solutions are
                                                                    geared toward increasing EHR/PM adaption by overcoming these challenges that are
                                                                    created by vendors and government requirements. Our partnership with EHR/PM vendors
                                                                    allow them to focus on building robust application quickly and effectively. Our
                                                                    services and solutions include structured and unstructured data migration.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">EHR Data Extraction and Conversion:</span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Medical practices can spend months researching, selecting, and implementing a new
                                                                    EHR. Each practice has unique requirements and should choose an EHR that satisfies
                                                                    their needs.
                                                                </p>
                                                                <p>
                                                                    Practices want their existing patient data incorporated into the new EHR system
                                                                    from day one. To accomplish this, data from the old system must be extracted and
                                                                    converted to the new EHR's format.
                                                                </p>
                                                                <p>
                                                                    Now it's easy to migrate your entire practice from one EHR to another.
                                                                </p>
                                                                <p>
                                                                    Dss Solutions specializes in extracting, analyzing, and converting existing clinical
                                                                    data from any one EHR system to another. We do not sell EHR systems; our job is
                                                                    to deliver on the challenging task of migrating all of your existing data over to
                                                                    the new EHR.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">PM Data Extraction and Conversion:</span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions specializes in extracting, analyzing, and converting existing Practice
                                                                    Management, financial and non-clinical Operation data from any one PM system to
                                                                    another. We do not sell EHR/PM systems; our job is to deliver on the challenging
                                                                    task of migrating all of your existing data over to the new HER/PM.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits1" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Collaboration for All: </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Clinician, Staffs, Patients, Vendors and Partners must be able to collaborate in
                                                                    private and secure portal. With Microsoft secure portal, we set up your practice
                                                                    email domain in online MS Exchange Server, Online communication with LYNC, Online
                                                                    document management and team-site portal with SharePoint that everyone from the
                                                                    practice would be able to communicate according to their security level. We also
                                                                    create your practice website for your current patients to login to their portal
                                                                    to view their activities and set appointment. Your practice website can be used
                                                                    by new patients or others who want to communicate with your practice.
                                                                </p>
                                                                <p>
                                                                    Partners and Vendors would have access to your portal per their authentication.
                                                                </p>
                                                                <p>
                                                                    How cool that is that you can access to any documents from anywhere and anytime,
                                                                    for example from hospital operation room.
                                                                </p>
                                                                <p>
                                                                    Dss Solutions would go one step further to manage and maintain your office hardware
                                                                    devises by Microsoft Intune. With this service you would have your hardware inventory
                                                                    and be rest assure that all the active devises are updated and functional.
                                                                </p>
                                                                <p>
                                                                    Dss Solution being your partner-in-business, you can rest assure that your IT department
                                                                    is working for your practice non-stop without paying heavy IT expanses. And <b class="Boldcolor">
                                                                        YES </b>, Dss Solutions would be your <b class="Boldcolor">ONLY </b>dedicated
                                                                    business total IT solutions support, including hardware maintenance.
                                                                </p>
                                                                <p>
                                                                    You can start with one license and increase as your business grow.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">Here are software and solutions: </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <ul>
                                                                    <li>Amazing Charts EHR/PM</li>
                                                                    <li>Microsoft Office 365</li>
                                                                    <li>Microsoft Intune</li>
                                                                    <li>Microsoft CRM</li>
                                                                    <li>Web.com Website registration and deployment</li>
                                                                    <li>Dss Solutions Integration</li>
                                                                </ul>
                                                                <p>
                                                                    Dss Solutions collaboration services.</p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">Software Solutions: </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <ul>
                                                                    <li>Online Exchange Server</li>
                                                                    <li>Online LYNC server</li>
                                                                    <li>Online Office</li>
                                                                    <li>Online Calendar</li>
                                                                    <li>Online NewsFeed</li>
                                                                    <li>Online OneDrive</li>
                                                                    <li>Online Portal</li>
                                                                    <li>Online Tasks</li>
                                                                    <li>Online BI</li>
                                                                    <li>Online CRM</li>
                                                                    <li>Host Website</li>
                                                                    <li>Website Domain Registration</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">Hardware and Internet Solutions: </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <ul>
                                                                    <li>Online Hardware Inventory and Maintenance</li>
                                                                    <li>On-Premise Hardware Maintenance</li>
                                                                    <li>Fast Internet Service</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">Maintenance: </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <ul>
                                                                    <li>Dss Solutions would be your total IT shop for maintenance and support</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="ContentHeadingStyle">Hardware Requirements: </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <ul>
                                                                    <li>None; all solutions are on cloud and no Hardware cost to our clients</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits2" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Content Management:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Now that you have Microsoft Office 365 portal with document management functionalities,
                                                                    let’s build content management that can help you to run your business smoother:
                                                                </p>
                                                                <ul>
                                                                    <li>Secure your documents</li>
                                                                    <li>Find documents with simple search</li>
                                                                    <li>Build document approval workflow</li>
                                                                    <li>Get notification on any document changes</li>
                                                                    <li>And more…</li>
                                                                </ul>
                                                                <p>
                                                                    We will work with your business to understand your content management requirements
                                                                    by demonstrating with few medical office content management samples. Then we will
                                                                    deliver the solution that suits your practice best with your business process model.
                                                                </p>
                                                                <p>
                                                                    We stay with you to modify or add functionalities as your business requirements
                                                                    changes.
                                                                </p>
                                                                <p>
                                                                    This is a cloud solutions and no need for any hardware purchasing or maintenance.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits3" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Clinical Analytics:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Don’t you want to an analytical solutions to tell you how your business is running;
                                                                    how your patients are doing; how is your business staking up against other practices;
                                                                    and answers to many other questions that you might have.
                                                                </p>
                                                                <p>
                                                                    We have helped many large organization with petabyte of data to have real time information
                                                                    to make factual decision. Moreover, all users in the organization have access to
                                                                    business insights from anywhere and anytime. We can build the similar healthcare
                                                                    analytical solutions for your practice with fraction of the cost.
                                                                </p>
                                                                <p>
                                                                    We have already built business analytics for Amazing Charts EHR/PM application,
                                                                    by having access to the application database. We can share with you the Ad-hoc reports,
                                                                    KPI, Scorecards and dashboards as a standalone analytical solution. We also will
                                                                    meet with your office to understand your analytical needs for further information
                                                                    integration. We build Clinical Analytics from structured and unstructured data.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits4" class="benefitsCls hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Secure Cloud Data:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Your major concerns is security, just like most of our clients when they started
                                                                    with Dss Healthcare Cloud Integrated Healthcare solution. It didn’t take them long
                                                                    to know that their information is more secured on our cloud then in their office.
                                                                    To have a high secure environment in your office, you need a security expert on
                                                                    your staff. And most of small and mid-size businesses cannot effort to have that.
                                                                    We will work with internet provider to setup a very high secure internet access
                                                                    per your office policy. When you access to the cloud with a very high secure internet,
                                                                    the rest will be the cloud security, which comes from Microsoft cloud security.
                                                                </p>
                                                                <p>
                                                                    We will meet with your team to understand your business security model and then
                                                                    we will implement it on the cloud in your practice domain.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits5" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn technology1">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Electronic Health Record (EHR):</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Amazing Charts is an Electronic Health Record (EHR) system that allows complete
                                                                    documentation of the medical encounter in a fast, efficient, and straight-forward
                                                                    manner.
                                                                </p>
                                                                <p>
                                                                    Our mission is simple: to improve the lives of health care providers by developing
                                                                    powerful, intuitive, and easy to use solutions that are user friendly and affordable.
                                                                    <big></big>And <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">multiple studies</a> prove that not only have we succeeded,
                                                                    we do so at a level significantly better than any other Electronic Health Record
                                                                    (EHR/EMR) system available today (including those costing tens of thousands of dollars
                                                                    more).
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The EHR Rated #1 for Usability and Affordability:
                                                                </h3>
                                                                <p>
                                                                    The award winning Amazing Charts EHR sets the standard for usability and affordability.
                                                                    Our solution has everything you need to run your practice, including charting, scheduling,
                                                                    intra-office messaging, prescribing, and much more.
                                                                </p>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">Rated the #1 HER in multiple studies</a>, <a target="blank" class="Boldcolor"
                                                                            href="../DssUser/ContactUs.aspx" style="color: blue">FREE to try</a>, and
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">priced at $2,395 per clinician</a>, (which includes ePrescribing,
                                                                    all our updates, and even our highly-rated Guardian Angel Technical Support), Amazing
                                                                    Charts is not only the obvious choice, it is the only choice.
                                                                </p>
                                                                <p>
                                                                    Designed by physicians for physicians, Amazing Charts is continually updated to
                                                                    incorporate suggestions submitted by thousands of users around the country. But
                                                                    don't take it from us, listen to what <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/#c79"
                                                                        style="color: blue">actual users</a> have to say.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazingly Easy to Use:
                                                                </h3>
                                                                <p>
                                                                    Most EHRs are overwhelmingly complex and ludicrously priced. These vendors require
                                                                    you to purchase servers, set up intricate networks, and spend hours upon hours of
                                                                    training just to re-teach you and your staff how to document a note the way their
                                                                    programmers believe is correct.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts is completely different. We understand that you have spent years
                                                                    learning how to document encounters and already know how best to run your practice.
                                                                    We don't require long-term commitments or contracts you can't get out of (all our
                                                                    terms are clearly outlined <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/privacy-terms-of-use/"
                                                                        style="color: blue">here</a>).
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is Designed by Our Users for Our Users:
                                                                </h3>
                                                                <p>
                                                                    Recommendations and suggestions are easily uploaded from within the program and
                                                                    are focused on adding the features and functionality to make your practice easier.
                                                                </p>
                                                                <p>
                                                                    If you haven't yet downloaded and tried Amazing Charts, click <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here</a>
                                                                    and do so now. Use it on your existing computers and network, and see for yourself
                                                                    how amazingly intuitive and easy Amazing Charts is to implement and use.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Our Pledge to You:
                                                                </h3>
                                                                <p>
                                                                    We will treat you fairly, honestly, and the way we would want to be treated ourselves
                                                                    (and we expect the same from you in return). We want you to be thrilled &ndash;
                                                                    with our software, our cost, and our services! Happy clients mean good word-of-mouth,
                                                                    and good word-of-mouth is why we are the fastest growing EHR Company in the country.
                                                                </p>
                                                                <p>
                                                                   Click <asp:LinkButton CommandArgument="1" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton6" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                     <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/Dss EHR-PM Offer.pdf"
                                                                        style="color: blue">here</a> for Dss Cloud Integrated Healthcare Solutions Executive Summary </p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="2" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton7" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton> 
                                                                    for Amazing Charts EHR Overview. </p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="4" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton8" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                    <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/ComparisonTool-011314.pdf" style="color: blue">here</a> 
                                                                    for EHR Evaluation Tool</p>
                                                                <p>
                                                                    Click <asp:LinkButton CommandArgument="3" CssClass="Boldcolor" OnClientClick="javascript:return clicklogin1();" style="color: blue"  ID="LinkButton9" runat="server" Text="herelnk" OnClick="Download_Click"></asp:LinkButton>
                                                                    <a target="_blank" class="Boldcolor" href="../AmazingCharts-Images/Documents/Cloud_ds_010214.pdf" style="color: blue">here</a> 
                                                                    for Amazing Charts in the Cloud</p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">EHR Solutions for Practice Managers:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3>
                                                                    Are You Researching Electronic Health Records for Your Practice?
                                                                </h3>
                                                                <p>
                                                                    Many office managers have been tasked with finding an Electronic Health Record (EHR/EMR)
                                                                    system for their practice.
                                                                </p>
                                                                <p>
                                                                    With tens of thousands of dollars on the line, making the wrong decision could be
                                                                    disastrous &ndash; while choosing the right EHR solution will make you the hero
                                                                    of your office!
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is the Right Choice
                                                                </h3>
                                                                <p>
                                                                    According to <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">multiple studies </a>based on actual user feedback, Amazing
                                                                    Charts is rated #1 for ease of use, user satisfaction, price, and support.
                                                                </p>
                                                                <p>
                                                                    Yet Amazing Charts is also one of the most <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">affordable </a>EHR systems on the market. By choosing Amazing
                                                                    Charts, you can help save the practice partners thousands of dollars each year.
                                                                </p>
                                                                <p>
                                                                    Best of all, Amazing Charts is risk free to try. <a target="_blank" class="Boldcolor"
                                                                        href="../DssUser/ContactUs.aspx" style="color: blue">Download </a>a FREE trial
                                                                    of our full software in your practice today.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The bottom line:
                                                                </h3>
                                                                <p>
                                                                    Don't take the risk of purchasing an expensive, unusable EHR that you can't try
                                                                    in advance, and then go through the hassle and expense of switching later &ndash;
                                                                    check out Amazing Charts today!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Electronic Health Records for Complimentary
                                                                &amp; Alternative Medicine (CAM):</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record solution is used by many Complimentary
                                                                    &amp; Alternative Medicine (CAM) providers, including home care services, facility-based
                                                                    medicine, optometrists, physiotherapists, and many others!
                                                                </p>
                                                                <p>
                                                                    These health care practitioners use Amazing Charts to:
                                                                </p>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Create secure electronic records of patient care</li>
                                                                    <li>Document diagnoses and treatment plans</li>
                                                                    <li>Collect payments and reimbursements</li>
                                                                    <li>Schedule appointments</li>
                                                                </ul>
                                                                <p>
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Amazing Charts Is the Right Choice</h3>
                                                                <p>
                                                                    According to multiple studies based on actual user feedback, Amazing Charts is rated
                                                                    #1 for ease of use, user satisfaction, price, and support.
                                                                </p>
                                                                <p>
                                                                    Yet Amazing Charts is also one of the most affordable EHR systems on the market.
                                                                    By choosing Amazing Charts, you can help save the practice partners thousands of
                                                                    dollars each year.
                                                                </p>
                                                                <p>
                                                                    Best of all, Amazing Charts is risk free to try. Activate a full working version
                                                                    of the software and use it in your practice FREE.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    The bottom line:
                                                                </h3>
                                                                <p>
                                                                    Don't take the risk of purchasing an expensive, unusable EHR that you can't try
                                                                    in advance, and then go through the hassle and expense of switching later &ndash;
                                                                    check out Amazing Charts today!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Electronic Health Record Solutions for Specialists:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Physicians always ask us: "Does Amazing Charts have any particular features for
                                                                    my specialty?"
                                                                </p>
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record (EMR/EHR) system has numerous features
                                                                    and functions that are ideal for specific medical specialties, including:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Cardiology</h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Direct links between Amazing Charts EHR and EKG, Stress, and Echo Cardiogram test
                                                                        equipment</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Dermatology</h3>
                                                                <ul>
                                                                    <li>Freehand illustrations </li>
                                                                    <li>Drawing / digital images</li>
                                                                    <li>Photos attach to patient charts</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Pediatrics
                                                                </h3>
                                                                <ul>
                                                                    <li>CDC growth curve charts </li>
                                                                    <li>Head circumference</li>
                                                                    <li>Immunization and shots documentation</li>
                                                                    <li>Pediatric templates built in</li>
                                                                    <li>State immunization registries</li>
                                                                    <li>Vaccine schedules</li>
                                                                    <li>Vaccine information sheets</li></ul>
                                                                <p>
                                                                    "Searching for preemies who will need RSV prophylaxis and prioritizing flu vaccines&mdash;so
                                                                    that the high risk kids are notified first&mdash;can be done in minutes in Amazing
                                                                    Charts, making population management extremely easy. Instantly being able to pull
                                                                    growth charts and show parents how their child is growing is appreciated by the
                                                                    parents and makes my job so much easier." &ndash; Wendell Wheeler, MD
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Podiatry
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Unique billing modifiers</li>
                                                                    <li>Foot image</li></ul>
                                                                <p>
                                                                    Amazing Charts is a very economical way of using an EHR. You are able to modify
                                                                    and make your own templates. &ndash;Arthur Lukoff, DPM
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Psychology and Psychiatry</h3>
                                                                <ul>
                                                                    <li>Diagnostic and Statistical Manual of Mental Disorders (DSM) IV codes are already
                                                                        built into Amazing Charts, which makes billing a snap</li></ul>
                                                                <p>
                                                                    I am a psychiatrist using Amazing Charts for medication management and more. Amazing
                                                                    Charts allows you to use templates of your own design and allows narrative entries
                                                                    rather than check marks, which I have never liked. I also have a nurse practitioner
                                                                    in my office who uses the program and is also pleased with it. &ndash;William Sullivan,
                                                                    MD
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Pulmonology</h3>
                                                                <ul>
                                                                    <li>Direct connection between Amazing Charts EHR and Spirometer equipment</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Easy to Create Templates</h3>
                                                                <p>
                                                                    Any specialist can adapt Amazing Charts to their specific practice requirements
                                                                    using templates, which allow users to quickly document the same information again
                                                                    and again.
                                                                </p>
                                                                <p>
                                                                    Creating a template in Amazing Charts can be accomplished in as few as two clicks.
                                                                    You can also download templates created by other specialists using Amazing Charts
                                                                    from our user board.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Medical Applications and Devices Support
                                                                by Amazing Charts:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts Electronic Health Record (EMR/EHR) system currently support the
                                                                    following medical and device application types. Click on each type to visit Amazing
                                                                    Charts site for more detail:
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfacing/lab-interfaces/"
                                                                        style="color: blue">Labs </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/radiology-providers/"
                                                                        style="color: blue">Radiology Providers</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                        style="color: blue">Practice Management </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/medical-devices/"
                                                                        style="color: blue">Medical Devices </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfaces/updox-document-management/"
                                                                        style="color: blue">Updox Document Management </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/speech-recognition/"
                                                                        style="color: blue">Speech Recognition </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/demographic-interface/"
                                                                        style="color: blue">Demographic Interface </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interfaces/patient-history-check-in/"
                                                                        style="color: blue">Patient History / Check-In </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/patient-portals/"
                                                                        style="color: blue">Patient Portals </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/interoperability/state-immunization-registries/"
                                                                        style="color: blue">State Immunization Registries </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Webinar:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/webinars/"
                                                                        style="color: blue">here </a>to view the scheduled Webinars (All times are in
                                                                    Eastern Time zone):
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Video Tour of Amazing Charts:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Sit back, relax, and enjoy this 20-minute in-depth overview of Amazing Charts; just
                                                                    click on the video player <a target="blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here </a>to get started.
                                                                </p>
                                                                <p>
                                                                    Looking for something shorter? Click <a target="blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here </a>to view our complete library of video tutorials.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Download and Try Amazing Charts Now:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We're so sure Amazing Charts will work for you&mdash;without extensive training
                                                                    or a reduction in your patient volume&mdash;we make the full version of Amazing
                                                                    Charts FREE to download and experience in your office.
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    CURRENT AMAZING CHARTS USERS - PLEASE READ BELOW
                                                                </h3>
                                                                <ul>
                                                                    <li><a class="Boldcolor" style="color: black">WARNING: </a>To add Amazing Charts to
                                                                        a new computer or update to the latest version, please visit the <a target="_blank"
                                                                            class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">client portal
                                                                        </a>. <b style="color: black">Current users require additional software not available
                                                                            here. </b></li>
                                                                    <li>To start a free trial of <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">Amazing Charts in the Cloud </a>, click one of the buttons above.
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Trail Account on Dss Solutions
                                                                Cloud:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We're so sure Amazing Charts will work for you&mdash;without extensive training
                                                                    or a reduction in your patient volume&mdash;we make the <b><i>full version of Amazing
                                                                        Charts FREE </i></b>ready for you to use on secure Dss Solutions Cloud.
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Buy Amazing Charts Now:</span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Do you want to purchase Amazing Charts immediately, without taking advantage of
                                                                    our FREE trial?
                                                                </p>
                                                                <p>
                                                                    Quite frankly, we'd rather you first try Amazing Charts to ensure it is right for
                                                                    you and your staff, since having a satisfied customer is more important to us than
                                                                    making a sale today.
                                                                </p>
                                                                <p>
                                                                    But if you really need to purchase Amazing Charts right now...
                                                                </p>
                                                                <p>
                                                                    So that we can best assist you, please tell us who you are by clicking <a target="_blank"
                                                                        class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">here
                                                                    </a>to provide information about yourself.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits6" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td class="Font">
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Practice Management:</span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Looking for a Practice Management (PM) system as intuitive and usable as our EHR?
                                                                </p>
                                                                <p>
                                                                    Our tightly integrated EHR+PM solution will deliver seamless workflow across clinical
                                                                    documentation and billing systems, along with a highly competitive clearinghouse
                                                                    connection. Amazing Charts PM is a solution for practices of all sizes and specialties.
                                                                    Review the information below to learn more about the features and benefits of Amazing
                                                                    Charts PM.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Integrated Financial Management Solution
                                                                </h3>
                                                                <p>
                                                                    Link the complex aspects of a practice together in ways that improve office efficiency,
                                                                    and patient care. Information moves seamlessly between Amazing Charts and payers
                                                                    electronically throughout the day.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Efficient management of day-to-day office workflow from the front desk to the billing
                                                                    office
                                                                </h3>
                                                                <p>
                                                                    Amazing Charts PM is designed to improve efficiency at the daily workflow level.
                                                                    Integration is a powerful tool to achieve this objective. Click here to learn about
                                                                    use cases for a typical practice.
                                                                </p>
                                                                <h3 style="font-weight: bold">
                                                                    Integrated Practice Management
                                                                </h3>
                                                                <ul>
                                                                    <li>Completely integrated financial management solution </li>
                                                                    <li>Scalable for practices of all sizes and specialties</li>
                                                                    <li>Efficient management of day-to-day office workflow from the front desk to the billing
                                                                        office</li>
                                                                    <li>Fully automated eligibility checking and electronic submission</li>
                                                                    <li>Supports single or multiple location practices</li></ul>
                                                                <h3 style="font-weight: bold">
                                                                    Increase Revenue:
                                                                </h3>
                                                                <ul>
                                                                    <li>Comprehensive Financial Reporting </li>
                                                                    <li>Claims Processing </li>
                                                                    <li>Patient Billing</li>
                                                                    <li>On-Demand Eligibility Checking </li>
                                                                    <li>Flexible Report Writer</li>
                                                                    <li>Electronic Statements </li>
                                                                    <li>Electronic Remittance Advice (ERA) </li>
                                                                </ul>
                                                                <h3 style="font-weight: bold">
                                                                    Increase Productivity:
                                                                </h3>
                                                                <ul>
                                                                    <li>Appointment &amp; Resource Scheduling </li>
                                                                    <li>Registration</li>
                                                                    <li>Referral Tracking</li>
                                                                    <li>HL7 Integration Engine</li>
                                                                    <li>Scanning</li></ul>
                                                                <h3 style="font-weight: bold">
                                                                    Improve Patient Care:
                                                                </h3>
                                                                <ul>
                                                                    <li>Referral Tracking</li>
                                                                    <li>Patient Recall</li></ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-container">
                                                            <div class="acc-btn">
                                                                <span class="selected ContentHeadingStyle">Amazing Charts Billing + PM Your Way:</span>
                                                            </div>
                                                            <div class="acc-content ">
                                                                <div class="acc-content-inner">
                                                                    <p>
                                                                        We know your practice is as individual as you are.
                                                                    </p>
                                                                    <p>
                                                                        No matter how your practice likes to handle billing and managing revenues, Amazing
                                                                        Charts has you covered with affordable and usable software.
                                                                    </p>
                                                                    <p>
                                                                        <u>Billing+PM </u>Your Way is our comprehensive toolkit of billing and Practice
                                                                        Management solutions that will meet the needs of your business today and tomorrow:
                                                                    </p>
                                                                    <ul>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/pm/medical-practice-management-software/"
                                                                            style="color: blue">Integrated Amazing Charts EHR+PM</a></li><a target="_blank" class="Boldcolor"
                                                                                href="http://amazingcharts.com/pm/medical-practice-management-software/" style="color: blue">
                                                                            </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/pm/medical-practice-management-software/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                                style="color: blue">Interfaces with nearly 100 market leading PM Systems</a></li><a
                                                                                    target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                                    style="color: blue"> </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/interfaces/practice-management/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/billing-services/"
                                                                                style="color: blue">Support for third-party billers</a></li><a target="_blank" class="Boldcolor"
                                                                                    href="http://amazingcharts.com/services/billing-services/" style="color: blue">
                                                                                </a>
                                                                        <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/billing-services/"
                                                                            style="color: blue"></a><a target="_blank" class="Boldcolor" style="color: black">COMING
                                                                                SOON: </a>Bi-directional interfaces with Kareo PM</li></ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits7" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">What is Meaningful Use? </span>
                                                        </div>
                                                        <div class="acc-content open ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Many eligible providers have collected money thanks to the ARRA Stimulus Plan (and
                                                                    the Amazing Charts Meaningful Use Wizard&trade;. This isn't chump change either;
                                                                    it works out to be somewhere around $44,000 to $63,750 for the average clinician.
                                                                </p>
                                                                <p>
                                                                    To get the incentives, you need just three things: (1) be eligible (e.g., take care
                                                                    of patients with Medicare or Medicaid insurance); (2) use a certified EHR in a "meaningful
                                                                    way." (3) Understand what "meaningful use" means, and document encounters in a manner
                                                                    that meets these government requirements (again, our integrated <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/meaningful-use/meaningful-use-wizardtm/"
                                                                        style="color: blue">Meaningful Use Wizard&trade; </a>will do the hard work for
                                                                    you).
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Choosing a Program: Medicare or Medicaid?
                                                                </h3>
                                                                <p>
                                                                    There are two EHR Incentive Programs; Medicare and Medicaid EHR Incentive Programs.
                                                                    The two programs are similar but there are some differences between them. Click
                                                                    one of the buttons below to learn more about one of these incentive programs.
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/downloads/Beginners_Guide.pdf"
                                                                        style="color: blue">Medicare EHR Incentive Program </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="https://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Downloads/EHR_Medicaid_Guide_Remediated_2012.pdf"
                                                                        style="color: blue">Medicaid EHR Incentive Program </a></li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Are you eligible?
                                                                </h3>
                                                                <p>
                                                                    Visit the Centers for Medicare &amp; Medicaid Services website to <a target="_blank"
                                                                        class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/eligibility.html"
                                                                        style="color: blue">determine your eligibility </a>to participate in Meaningful
                                                                    Use incentive programs.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts is 2014 MU certified?
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/ehr-certification/"
                                                                        style="color: blue">here </a>to visit Amazing Charts Meaning Use Certification
                                                                    Page.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Chart Your Course to Meaningful Use Success!
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Ease your fears of Meaningful Use and collect all the incentives you are entitled
                                                                    to receive with our 2014 attestation plan. Use these links to get started:
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/what-does-2014-mean-for-you/"
                                                                        style="color: blue">What does 2014 mean for you? </a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/prepare-for-upgrade-now/"
                                                                        style="color: blue">Prepare for upgrade now! </a></li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">New MU Features </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    There are several new features that will be included in the 2014 Meaningful Use
                                                                    certified version of Amazing Charts due out this summer. Here is a sneak peak of
                                                                    some of the new features that will be available in that release of Amazing Charts.
                                                                    Check back often as we'll be adding more over the next few weeks.
                                                                </p>
                                                                <ul>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4166"
                                                                        style="color: blue">Demographics</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4169"
                                                                        style="color: blue">PHI Import and Reconciliation Functionality</a></li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/meaningful-use/charting-your-mu-course-2014/new-features/#c4167"
                                                                        style="color: blue">Smoking Status</a></li></ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Hardship Exemption &ndash; what it means
                                                                for you in 2014 </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The hardship exemption is for an eligible professional (EP) who qualifies for the
                                                                    CMS EHR Incentive program. Taking the exemption means the EP will avoid penalties
                                                                    and also not get the incentive money for 2014.
                                                                </p>
                                                                <p>
                                                                    Eligible professionals may apply for this exemption for the following reasons:
                                                                </p>
                                                                <ul>
                                                                    <li>Lack of Infrastructure - The EP is located in an area without sufficient internet
                                                                        access to comply with the Meaningful Use objectives requiring internet connectivity,
                                                                        and faced insurmountable barriers to obtaining such internet connectivity. </li>
                                                                    <li>Unforeseen and/or Uncontrollable Circumstances - The EP faced extreme and uncontrollable
                                                                        circumstances that prevented the EP from becoming a meaningful EHR user. </li>
                                                                    <li>Lack of control over the availability of Certified EHR Technology - The EP must
                                                                        demonstrate that he/she practices at multiple locations and is unable to control
                                                                        the availability of Certified EHR Technology at one such practice location or a
                                                                        combination of practice locations, and where the location or locations constitute
                                                                        more than 50 percent of patient encounters. </li>
                                                                    <li>Lack of Face-to-Face Interaction - The EP must demonstrate either a complete lack
                                                                        of face-to-face interactions and follow-up or that the cases of face-to-face interaction
                                                                        and follow-up are extremely rare and not part of normal scope of practice for that
                                                                        EP. </li>
                                                                    <li>2014 EHR Vendor Issues - During the calendar year (2014) preceding the payment adjustment
                                                                        year (2015), the EP's EHR vendor was unable to obtain 2014 certification or the
                                                                        EP was unable to implement Meaningful Use due to 2014 EHR certification delays.
                                                                        Click here for the application. </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Patient Portal and Meaningful Use </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Amazing Charts 2014 Patient Portal will enable you to get a jump start on meeting
                                                                    some of the challenging aspects of the second stage of Meaningful Use. The Patient
                                                                    Portal will be offered at no cost with a simple set up. Since Patient Engagement
                                                                    has become a core requirement for MU2, it is important to start educating office
                                                                    staff and patients on how to interact with the practice through a self-service web
                                                                    based portal. The Amazing Charts Patient Portal meets all of the requirements for
                                                                    MU2 criteria for providers.
                                                                </p>
                                                                <p>
                                                                    The Patient Portal will help meet two specific tests for MU2:
                                                                </p>
                                                                <ul>
                                                                    <li><b class="Boldcolor">Core Criteria #7 &ndash; Patients can View, Download, and Transmit
                                                                        their medical record to a third party within four days of being available. </b>
                                                                    </li>
                                                                </ul>
                                                                <ul>
                                                                    <li>More than 50 percent of all unique patients seen by the EP during the EHR reporting
                                                                        period must be provided timely (within 4 business days after the information is
                                                                        available to the EP) online access to their health information subject to the EP's
                                                                        discretion to withhold certain information. </li>
                                                                    <li>More than 5 percent of all unique patients seen by the EP during the EHR reporting
                                                                        period (or their authorized representatives) must view, download, or transmit their
                                                                        health information to a third party</li>
                                                                    <li><b class="Boldcolor">Core Criteria #17 &ndash; Secure Messaging between Patient
                                                                        and Provider</b></li></ul>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>A secure message was sent using the electronic messaging function of Certified EHR
                                                                        Technology by more than 5 percent of unique patients (or their authorized representatives)
                                                                        seen by the EP during the EHR reporting period. </li>
                                                                </ul>
                                                                <a target="_blank" class="Boldcolor" href="http://www.myupdox.com/updox-ui/acpatientportal"
                                                                    style="color: blue">Register </a>or <a target="_blank" class="Boldcolor" href="http://www.cms.gov/Regulations-and-Guidance/Legislation/EHRIncentivePrograms/Stage_2.html"
                                                                        style="color: blue">learn more </a>about the requirements for MU Stage 2.
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Using Amazing Charts to Meet Meaningful Use
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The surest way of achieving Meaningful Use Stage 1 or Stage 2 is to get into the
                                                                    habit of collecting the information required by the government to prove you are
                                                                    using a certified EHR in a meaningful way.
                                                                </p>
                                                                <p>
                                                                    The Meaningful Use Wizard&trade; is designed to work within your usual office flow,
                                                                    and does not require reentering of information, complex tallying of data, or even
                                                                    having to remember what you need to document.
                                                                </p>
                                                                <p>
                                                                    WANT TO SEE OUR MEANINGFUL USE WIZARD IN ACTION? <a target="_blank" class="Boldcolor"
                                                                        href="http://amazingcharts.com/meaningful-use/meaningful-use-wizardtm/#c1546"
                                                                        style="color: blue">JUMP TO THE VIDEO </a>NOW.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Demystifying Meaningful Use</h3>
                                                                <p>
                                                                    Amazing Charts will take you to Meaningful Use, step by step, while still allowing
                                                                    you to get through your visits quickly and efficiently, which we believe is the
                                                                    most fundamental requirement of an EHR.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Color-Coding</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard color-codes the specific fields that you must document
                                                                    if you wish to reach Meaningful Use. Holding your mouse over the color-coded field
                                                                    shows you more details of the requirement that the Federal government has deemed
                                                                    to be evidence that you are using your EHR in a meaningful way. (Please don't be
                                                                    annoyed with what is color-coded, since we're sure you'll find some of it as ridiculous
                                                                    as we did; you can turn it off, or even change the color in the User Preferences
                                                                    menu.)
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Automatic Alerts
                                                                </h3>
                                                                <p>
                                                                    The Meaningful Use Wizard will automatically open various windows to allow you to
                                                                    collect certain information (e.g., HIPAA information when printing records).
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Checkpoint Dashboard</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard includes a checkpoint dashboard, accessible within each
                                                                    patient record, which provides a real-time status of how you are doing in terms
                                                                    of collecting the required amount of information needed to meet Meaningful Use.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Report Writer</h3>
                                                                <p>
                                                                    The Meaningful Use Wizard includes a robust report writer that automatically collates
                                                                    all the data you've collected, analyzes it to ensure it meets the requirements,
                                                                    and then produces a printable report summarizing your Meaningful Use status. This
                                                                    report can be submitted to CMS and will be the basis by which they pay you the HITECH
                                                                    money.
                                                                </p>
                                                                <p>
                                                                    The report writer also provides detailed information on each Meaningful Use criteria
                                                                    and how we recommend you use Amazing Charts to ensure the information is recorded.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    The Submission Assistant</h3>
                                                                <p>
                                                                    Of course achieving Meaningful Use is one thing, generating the required reports
                                                                    and analysis of your percentages is another, but unless you submit everything the
                                                                    way it needs to be done: to the right place by the right time, the money won't get
                                                                    to you. So part of the Amazing Charts plan to get you to payment is assistance with
                                                                    the submitting process.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits8" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Why Amazing Charts? </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Learning and implementing Amazing Charts is easy &ndash; and the program has received
                                                                    the highest rating of any EHR for ease of implementation and usability.
                                                                </p>
                                                                <p>
                                                                    We encourage you to <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">try Amazing Charts in your own practice for a FREE trial
                                                                    </a>before purchasing. This ensures that you love our product (and we love you).
                                                                    And happy customers is the reason we are the #1 rated EHR (since happy clients tell
                                                                    their friends).
                                                                </p>
                                                                <p>
                                                                    Below are links to help you learn more about our products and see what actual customers
                                                                    have to say about their own experiences researching, implementing, and using Amazing
                                                                    Charts compared with other EHRs.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Try It Right Now</h3>
                                                                <p>
                                                                    Use our award-winning EHR and use it in your office for a FREE trial, and let us
                                                                    prove to you how good we are. <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">[Try It Now] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Set Up A Live Demo</h3>
                                                                <p>
                                                                    Want to walk through a demo? We have weekly scheduled demos at times that are convenient
                                                                    for you. Or, you can schedule a demo at a time of your choosing and one of our representatives
                                                                    will walk you through all the features and benefits of Amazing Charts. <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/the-ehr/webinars/" style="color: blue">
                                                                        [Set Up A Demo] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Watch Video Tutorials</h3>
                                                                <p>
                                                                    See Amazing Charts in action! Use these video tutorials to learn how to download,
                                                                    install, and use Amazing Charts in your practice. See how to network multiple computers,
                                                                    backup and restore data, interface with Dragon Naturally Speaking, and much more.
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">[Watch Video Demonstrations] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Frequently Asked Questions (FAQ)
                                                                </h3>
                                                                <p>
                                                                    Find answers to the most commonly asked questions about getting started, getting
                                                                    stimulus money, etc. <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/why-us/frequently-asked-questions/"
                                                                        style="color: blue">[Frequently Asked Questions] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    What Our Users Say</h3>
                                                                <p>
                                                                    Amazing Charts doesn't spend your money on expensive advertising campaigns or marketing
                                                                    hype. The vast majority of our clients first heard about Amazing Charts from their
                                                                    colleagues. As we run into clients at medical conventions and other locations, we
                                                                    record (those who are willing) what our clients have to say when asked what other
                                                                    EHRs they've tried, what they like about Amazing Charts, and we even ask them to
                                                                    elaborate on any issues they've had with our software or company. <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/"
                                                                        style="color: blue">[Unedited User Reviews] </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Online Community</h3>
                                                                <p>
                                                                    Amazing Charts is designed and continually improved based on the recommendations
                                                                    of our users. Our user community is a large, outspoken, and uncensored group, always
                                                                    willing to assist new users ("newbies") and a great place to learn about the many
                                                                    ways Amazing Charts can be used. <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/online-community/"
                                                                        style="color: blue">[Amazing Charts Online Community] </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">The EHR Rated #1 for Usability </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Most amazing about Amazing Charts is that we're rated the best!
                                                                </h3>
                                                                <p>
                                                                    Sure our product is amazingly affordable, user-friendly, and easy to learn, but
                                                                    what is most amazing is that despite costing so much less than other EHRs, in study
                                                                    after study Amazing Charts is consistently rated as being the best.
                                                                </p>
                                                                <p>
                                                                    We encourage you to click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/the-1-rated-ehr/"
                                                                        style="color: blue">here </a>to review the data for yourself and then ask each
                                                                    vendor you are considering why they charge so much more yet score so much less when
                                                                    their users are surveyed.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Fair and Transparent Pricing </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    FREE trial!
                                                                </h3>
                                                                <p>
                                                                    First, <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        try Amazing Charts FREE </a>to be sure it works for your practice.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Then $1,200 per clinician!
                                                                </h3>
                                                                <p>
                                                                    If you like it, <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">buy a license for each clinician</a>. This covers all other
                                                                    staff in the practice.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Support &amp; Maintenance: $1,195 per clinician (annually)!
                                                                </h3>
                                                                <p>
                                                                    Our annual support and maintenance subscription costs just $1,195/year per clinician.
                                                                    This includes all our software updates, upgrades, technical support, even ePrescribing.
                                                                    In fact, other than the optional charges listed below, there are no "extra" module
                                                                    fees, no required training charges, no complicated user agreements, and no other
                                                                    licensing nonsense requiring you to pay a monthly fee for years to come.
                                                                </p>
                                                                <p>
                                                                    Please click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/products/transparent-pricing/"
                                                                        style="color: blue">here </a>for detail on the AC price offering!
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Comparing Electronic Health Records (EHRs)
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    As "Health Information Technology" has entered the medical lexicon, a number of
                                                                    reputable organizations have conducted head-to-head studies comparing the various
                                                                    EHR programs to one another. These studies all essentially look to answer a very
                                                                    simple question: <b class="Boldcolor">How much do you like your EHR? </b>
                                                                </p>
                                                                <p>
                                                                    The studies summarized <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/compare-us-to-other-ehrs/"
                                                                        style="color: blue">here </a>show what thousands of clinicians have to say about
                                                                    their own EHR. What is most amazing is that in study after study, Amazing Charts
                                                                    is rated significantly better in essentially every key indicator of overall EHR
                                                                    satisfaction, quality, and usability, despite costing a fraction of the other programs.
                                                                    Of course our reporting of these data does not constitute an endorsement by the
                                                                    study publishers or authors. Instead, it is our interpretation of the study data
                                                                    as published.
                                                                </p>
                                                                <p>
                                                                    Please click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/compare-us-to-other-ehrs/"
                                                                        style="color: blue">here</a> to view detail studies by different organization.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Hear and Read What Users Say About Amazing
                                                                Charts... </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    When it comes to Electronic Health Record (EHR) systems, who can you really believe,
                                                                    except your peers? Use the links below to hear real people talking about Amazing
                                                                    Charts in their own words.
                                                                </p>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/ub/" style="color: blue">
                                                                        here </a>to view a complete set of Testimonies and Case Studies that your peers
                                                                    shared with Amazing Charts.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Frequently Asked Questions (FAQ) from Amazing
                                                                Charts </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/why-us/frequently-asked-questions/"
                                                                        style="color: blue">Click Here if the link to the FQA at Amazing Charts site.
                                                                    </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Switch EHRs as Easy as 1-2-3... </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Sick and tired of your current EHR/EMR system? We understand.
                                                                </p>
                                                                <p>
                                                                    Everyday, we hear horror stories from practices that overpay for their EHR, or find
                                                                    their poorly designed EHR unusable, or both!
                                                                </p>
                                                                <p>
                                                                    There is a better way &ndash; switch to Amazing Charts today! We make it as simple
                                                                    as...well, 1-2-3.
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 1 &ndash; </b>Download a FREE trial of the full version
                                                                    Amazing Charts
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 2 &ndash; </b>Import your patient demographics with the
                                                                    Amazing Importer
                                                                </p>
                                                                <p>
                                                                    <b class="Boldcolor">Step 3 &ndash; </b>Evaluate your other options: importing structured
                                                                    data, scanning, archiving, etc.
                                                                </p>
                                                                _______________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 1 - Download a FREE Trial of the #1 Rated EHR Today</h3>
                                                                <p>
                                                                    Amazing Charts lets you try a full version of the software for a FREE trial.
                                                                </p>
                                                                <p>
                                                                    Seeing is believing, and the only way to experience Amazing Charts is to try it
                                                                    for yourself.
                                                                </p>
                                                                <p>
                                                                    So, what are you waiting for?
                                                                </p>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/the-ehr/trial/"
                                                                        style="color: blue">Start a FREE Trial</a></p>
                                                                <p>
                                                                    We have several training options available to help you throughout the trial period,
                                                                    click here to learn more.
                                                                </p>
                                                                ________________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 2 - Import Your Patient Demographics with the FREE Amazing Importer!
                                                                </h3>
                                                                <p>
                                                                    One the best things about switching to Amazing Charts is that you can easily and
                                                                    quickly import patient demographics.
                                                                </p>
                                                                <p>
                                                                    Just export your patient data to an Excel spreadsheet (i.e., CSV file) and our Amazing
                                                                    Importer utility does all the work.
                                                                </p>
                                                                <p>
                                                                    You can contact <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">Technical Support </a>for assistance with importing your
                                                                    demographics, or watch the following five-minute video tutorial to see how to do
                                                                    it yourself:
                                                                </p>
                                                                ________________________________________________________________________
                                                                <h3 style="font-weight: bolder">
                                                                    Step 3 - Import Continuity of Care Documents and More...
                                                                </h3>
                                                                <p>
                                                                    Okay, let's review.
                                                                </p>
                                                                <p>
                                                                    First, you activated a free trial of Amazing Charts.
                                                                </p>
                                                                <p>
                                                                    Next, you imported patient demographics from your old EHR.
                                                                </p>
                                                                <p>
                                                                    At this point, you can simply start using Amazing Charts to create new patient records.
                                                                </p>
                                                                <p>
                                                                    But what about the patient records in your old EHR system? What can we do about
                                                                    them? What works best for you depends entirely on your goals and how much money
                                                                    you're willing to spend.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Import Structured Data
                                                                </h3>
                                                                <p>
                                                                    Continuity of Care Documents (CCDs) / Continuity of Care Records (CCRs) specify
                                                                    the encoding, structure, and semantics of a patient summary clinical document for
                                                                    exchange.
                                                                </p>
                                                                <p>
                                                                    The CCD/CCR patient summary contains a core data set of the most relevant administrative,
                                                                    demographic, and clinical information facts about a patient's healthcare, covering
                                                                    one or more healthcare encounters.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts can import a CCD as an Imported Item, essentially adding a viewable
                                                                    report to the patient’s chart. To be clear, this does not parse out all of the discrete
                                                                    data elements contained within a CCD and add them to the different sections of the
                                                                    patient’s chart.
                                                                </p>
                                                                <p>
                                                                    Exporting and importing a CCD/CCR is doable for some major EHR systems, but not
                                                                    all. Check with your vendor.
                                                                </p>
                                                                <p>
                                                                    To learn more about importing CCDs, contact <a target="_blank" class="Boldcolor"
                                                                        href="../DssUser/ContactUs.aspx" style="color: blue">Technical Support.</a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Manual Transcription
                                                                </h3>
                                                                <p>
                                                                    In order to make a complete transfer of structured data from your old EHR to Amazing
                                                                    Charts, you have two choices:</p>
                                                                <ul>
                                                                    <li>Manual data transfer by a medical transcription service. </li>
                                                                    <li>Dss Solutions will do E2E Data extraction and conversion for your practice.
                                                                    </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Scan Patient Records
                                                                </h3>
                                                                <p>
                                                                    You can scan your old patient charts into the patient's Imported Items section of
                                                                    Amazing Charts using a scanner with a Twain Driver.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    EHR Archive
                                                                </h3>
                                                                <p>
                                                                    Your least expensive and lowest risk option is to simply archive your entire legacy
                                                                    EHR data set for reference on an "as needed" basis. This satisfies all data retention
                                                                    requirements.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits9" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Why Dss Solutions? </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions is a globally-known, leading-edge, actionable business analytics solutions
                                                                    provider that has served our clients' total IT and business solutions requirements
                                                                    in the Healthcare and Government industries since 1992, utilizing the talented Dss
                                                                    Solutions technical and business SME resource pools and innovative "Center of Excellence"
                                                                    delivery methodologies. Being partnered with Amazing Charts, Microsoft, and Tableau,
                                                                    Dss Solutions has access to vast partner resources and support on delivery sound
                                                                    solutions with the most technically advanced, leading-edge technologies.
                                                                </p>
                                                                <p>
                                                                    We have extensive experience in architecting, designing, developing, and managing
                                                                    IT applications of any size as well as in providing high-value services around packaged
                                                                    enterprise applications on-premise, online, and on-cloud.
                                                                </p>
                                                                <p>
                                                                    We have helped many of our clients nationwide to move from their troubled EHR/PM
                                                                    applications to Amazing Charts seamlessly, trained them to use our easy-to-use EHR/PM
                                                                    application, and supported them with our dedicated teams online and on-premise.
                                                                    With our Meaningful-Use team, we have helped our clients to prepare for stage 1
                                                                    and 2.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Hosts Amazing Charts on Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Running an Electronic Health Record (EHR) system from your office can be a real
                                                                    pain &ndash; even with an EHR as easy to use as Amazing Charts.
                                                                </p>
                                                                <p>
                                                                    First, there are the costs and headaches associated with hardware, software, and
                                                                    networking. Next, there are concerns about the privacy and security of keeping patient
                                                                    health information on site. Finally, you need to make sure your EHR application
                                                                    is the latest version, so you don’t fall behind on government and payer requirements.
                                                                </p>
                                                                <p>
                                                                    Now there is a better way: Amazing Charts on the Microsoft Cloud with 99.9 SLA and
                                                                    Microsoft security.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Value-Add: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We will be your partner-in-business for all your IT requirements. We will make sure
                                                                    that you don’t have any challenges with your EHR/PM applications. We will constantly
                                                                    review the EHR/PM application to identifying any possible application bugs, reported
                                                                    to the developers, and find a workaround while they are fixing them, before you
                                                                    encounter the bug.
                                                                </p>
                                                                <p>
                                                                    The Dss Solutions Data transformation skill set helps our clients to move from any
                                                                    EHR application to Amazing Charts. We can move any practice data to Amazing Charts
                                                                    with reasonable time and cost.
                                                                </p>
                                                                <p>
                                                                    Dss Solutions’ major strength is healthcare analytics. As a partner of Microsoft
                                                                    with Business Intelligence Gold competency, we have been developing healthcare analytics
                                                                    and predictive analytics and delivering ad-hoc reports, Key Performance Indicators,
                                                                    and scorecards in very flexible dashboards for large clinical organizations; and
                                                                    we can do the same for your practice.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Implementation Process: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    If there are no significant patient data in your current EHR/PM application, then
                                                                    Dss Solutions will help to move them to Amazing Charts manually and FAST. However,
                                                                    if you have accumulated a significant amount of patient data (demographic and clinical),
                                                                    financial and operational data, we will start the discovery phase. Throughout the
                                                                    discovery phase, the Dss Solutions transformation team will study the requirements
                                                                    to move your practice’s clinical, financial, and operational data to the Amazing
                                                                    Charts database and to propose solutions with the different options we have discovered.
                                                                    Then you will choose the best economic and practical transformation option for our
                                                                    team to implement.
                                                                </p>
                                                                <p>
                                                                    After moving your practice’s data to Amazing Charts, the Dss Solutions transformation
                                                                    team will help to set up e-Prescribing, the patient portal, and any other programs
                                                                    required by the practice.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">References: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions has been providing business analytics solutions to large organizations
                                                                    like the Department of Justice, the Department of Health and Human Services, the
                                                                    Texas Health and Human Services Commission (HHSC), HP, IBM, and al-Salam Hospital
                                                                    in Kuwait, to name a related few. After many requests from healthcare practices
                                                                    through hospital affiliations, we have decided to provide EHR/PM solutions and support
                                                                    to the practices who came to know Dss Solutions’ knowledge and its skill set on
                                                                    healthcare business analytics. To do so, we have partnered up with Amazing Charts
                                                                    to serve our SMB healthcare clients, in addition to other services that we provide.
                                                                    Please refer to <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/why-us/hear-what-users-say/customer-video-testimonials/"
                                                                        style="color: blue">here </a>for testimonials.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Additional Services: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    When we say that we want to be your partner-in-business for life, we mean it. We
                                                                    want to bring total IT solutions and dedicated support to your practice so that
                                                                    you can focus on what you do best, serving your clients effectively, without having
                                                                    any concerns about your practice’s IT solutions. As a Microsoft Gold Partner with
                                                                    Small Business Competency, we have been providing big business solutions to our
                                                                    SMB clients for years.
                                                                </p>
                                                                <p>
                                                                    We implement the full Microsoft office online (Content Management, Collaboration
                                                                    ecosystem, CRM); host the EHR/PM solutions and implement a business analytics solutions
                                                                    on-cloud utilizing the Microsoft Azure cloud technology and security so you won’t
                                                                    need any expansive servers with a complex networking and high maintenance cost in
                                                                    your office, which translate to a big saving for your business; develop customized
                                                                    website by partnering with Networksolutions and Web.com; and bring enterprise&ndash;class
                                                                    communication that are highly reliable, flexible, scalable and priced specifically
                                                                    for small businesses by partnering with many of your local communication providers.
                                                                </p>
                                                                <p>
                                                                    Dss Solution being your partner-in-business, you can rest assure that your IT department
                                                                    is working for your practice non-stop without paying heavy IT expanses. And <b class="Boldcolor">
                                                                        YES</b>, Dss Solutions would be your <b class="Boldcolor">ONLY</b> dedicated
                                                                    business total IT solutions support, including hardware maintenance.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Dss Solutions Dedicated Service, Support
                                                                and Training: </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Dss Solutions has a dedicated technical support team for Healthcare solutions with
                                                                    vast technical and industry knowledge to support all our healthcare clients. Amazing
                                                                    Charts in an application within Dss Solutions Healthcare offering. Our team is dedicated
                                                                    to support your.
                                                                </p>
                                                                <p>
                                                                    When we say that we want to be your partner-in-business for life, we mean it. We
                                                                    want to bring total IT solutions and dedicated support to your practice so that
                                                                    you can focus on what you do best, serving your clients effectively, without having
                                                                    any concerns about your practice’s IT solutions.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Healthcare EHR/PM Total Integration Pricing:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We offer many packages, from EHR applications to total integrated healthcare SMB
                                                                    solutions and everything in between. We can work with you to find the best practical
                                                                    solution for your practice with reasonable pricing. We are eager to talk with you
                                                                    about your requirements.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">What Is Next? </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    We can help you with the decision process by setting you up with a trial on-cloud
                                                                    account with demo data for you to test our integrated solutions for 30 days, AND/OR
                                                                    we can demo the solutions virtually or in-person to answer any questions you might
                                                                    have before making your final decision. We can also have a requirement gathering
                                                                    session on how to set up completely integrated solutions for your practice, effectively
                                                                    with fair pricing. Call us at <span class="skype_c2c_print_container notranslate">(202)
                                                                        256-6867</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                            data-numbertocall="+912022566867" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                            onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                            tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="Span11"><span
                                                                                skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                    id="Span12" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                        class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202) 256-6867</span><span
                                                                                            class="skype_c2c_free_text_span"></span></span></span></span>
                                                                    or contact us for <a target="_blank" class="Boldcolor" href="http://www.dsssolutions.com//DssUser/ContactUs.aspx"
                                                                        style="color: blue">Dss Cloud Integrated Cloud Solutions </a>to take the next
                                                                    step.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits10" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Guardian Angel Support </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Subscribers to <a class="Boldcolor" style="color: black">Guardian Angel Support</a>
                                                                    have access to expert technicians weekdays from 8 AM to 9 PM EST (5 AM to 6 PM PST),
                                                                    and after hours (for emergencies mostly*).
                                                                </p>
                                                                <p>
                                                                    Guardian Support representatives are experts in Product Support or Technical Support.
                                                                </p>
                                                                <p>
                                                                    The Product Support team specializes in teaching users how to operate Amazing Charts.
                                                                    Not sure how to write an order? Wondering how to renew a medication? Need help with
                                                                    Meaningful Use? Ask for Product Support.
                                                                </p>
                                                                <p>
                                                                    Technical Support specializes in setup, installation and the functionality of Amazing
                                                                    Charts. If you need help getting started with Amazing Charts, or if a function of
                                                                    Amazing Charts is not working properly, ask for Technical Support.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    <a class="Boldcolor" style="color: black">Contact the Guardian Angel Support Team in
                                                                        any of the following ways:</a>
                                                                </h3>
                                                                <ul>
                                                                    <li><a class="Boldcolor" style="color: black">Live Chat:</a> Connect with Guardian Angel
                                                                        Support by clicking Start Session below. This is the easiest and fastest way to
                                                                        access our Product and Technical Support experts, and it allows us to quickly log
                                                                        into your system if we need to. Live Chat is available Monday to Friday, 8 AM to
                                                                        9 PM Eastern Standard Time (EST). Chat with Us (Chat with Dss Solutions) </li>
                                                                    <li><a class="Boldcolor" style="color: black">Telephone: </a><span class="skype_c2c_print_container notranslate">
                                                                        (202) 256-6867</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                            data-numbertocall="+912022566867" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                            onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                            tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="Span13"><span
                                                                                skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                    id="Span14" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                        class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202) 256-6867</span><span
                                                                                            class="skype_c2c_free_text_span"></span></span></span></span>-
                                                                        Press 1 for Technical Support. Phone support is available Monday to Friday, 8 AM
                                                                        to 5 PM CST. For after hours and emergency technical support, call <span class="skype_c2c_print_container notranslate">
                                                                            (866) 382-5932</span><span data-ismobile="false" data-isrtl="false" data-isfreecall="false"
                                                                                data-numbertocall="+918663825932" onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)"
                                                                                onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)" onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)"
                                                                                tabindex="-1" dir="ltr" class="skype_c2c_container notranslate" id="Span15"><span
                                                                                    skypeaction="skype_dropdown" dir="ltr" class="skype_c2c_highlighting_inactive_common"><span
                                                                                        id="Span16" class="skype_c2c_textarea_span"><img width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                                            class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(866) 382-5932</span><span
                                                                                                class="skype_c2c_free_text_span"></span></span></span></span>-
                                                                        Press 1</li>
                                                                    <li><a class="Boldcolor" style="color: black">Email: </a>You can send an email to DssSupport@DssSolutions.com
                                                                        at any time. Guardian Angel Support Technicians respond throughout the day (and
                                                                        frequently evenings too). </li>
                                                                </ul>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">*Emergencies: After-hours emergency service
                                                                        is included with our Guardian Angel Support service - emergencies are defined as
                                                                        an inability to access your data. </a>
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    How Our Guardian Angel Support Works</h3>
                                                                <p>
                                                                    When you report an issue, our Guardian Angel Support team will gather some information
                                                                    about your practice and set up. This information will ensure we understand the issue
                                                                    and have all the data required to diagnosis and resolve the issue - in as short
                                                                    a period of time as possible, and with as little hassle to you as possible. Some
                                                                    of the information we'll be asking includes:
                                                                </p>
                                                                <ul>
                                                                    <li>Your contact information</li>
                                                                    <li>The version of Amazing Charts you are using - we can help you find this info.
                                                                    </li>
                                                                    <li>The specific problem you are experiencing</li>
                                                                    <li>Your computer hardware (e.g., processor) - we can help you find this</li>
                                                                    <li>Operating System (OS) - we can help you with this</li>
                                                                    <li>How many computers are affected</li>
                                                                    <li>The way your computer network is set up, including which computers are wired and
                                                                        which are connected wirelessly. </li>
                                                                </ul>
                                                                <p>
                                                                    The details associated with each problem reported to us are logged into our ticketing
                                                                    system, which serves four purposes:</p>
                                                                <ul>
                                                                    <li>It saves you time; you don’t have to repeat detailed information if the Guardian
                                                                        Angel Support technician needs to escalate the issue to a higher technician tier.
                                                                    </li>
                                                                    <li>It allows you to follow up on the progress of the issue (if your issue happens to
                                                                        be one of the tiny minority that aren't solved during the first call). </li>
                                                                    <li>It maintains a comprehensive history to help identify larger issues and patterns
                                                                        which might explain them. </li>
                                                                    <li>It allows us to create a deeper and richer knowledge base so we can serve clients
                                                                        even faster in the future. </li>
                                                                </ul>
                                                                <p>
                                                                    While the vast majority of issues are resolved within the first call (and this is
                                                                    our goal), some more complex issues may take several hours to several days, and
                                                                    require the input of people. When there is a backlog of issues to resolve, we triage
                                                                    issues based on the following:</p>
                                                                <ul>
                                                                    <li>Non-Urgent Client requires information/education</li>
                                                                    <li>Urgent Client is experiencing noticeable problems but can still perform most tasks
                                                                        in Amazing Charts</li>
                                                                    <li>Critical Client is experiencing noticeable problems in Amazing Charts that impact
                                                                        business operations</li></ul>
                                                                <h3 style="font-weight: bolder">
                                                                    After Hours</h3>
                                                                <p>
                                                                    The Amazing Charts Help Desk is staffed weekdays from 8 AM to 9 PM EST with the
                                                                    following exceptions:
                                                                </p>
                                                                <ul>
                                                                    <li>New Year's Day </li>
                                                                    <li>Memorial Day </li>
                                                                    <li>Independence Day</li>
                                                                    <li>Labor Day </li>
                                                                    <li>Thanksgiving </li>
                                                                    <li>Christmas </li>
                                                                </ul>
                                                                <p>
                                                                    After hours and during holidays, we continuously monitor chats and telephone messages
                                                                    for help requests of an urgent nature (i.e., you can't get the program running and
                                                                    have patients waiting to be seen). Please leave details of your emergency.
                                                                </p>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">Emergencies: </a>After normal business
                                                                    hours, the Guardian Angel Support staff continues to monitor chat requests and phone
                                                                    messages and respond to emergency situations. Please be sure to leave the details
                                                                    of your emergency to ensure it isn't triaged to the next business day.
                                                                </p>
                                                                <p>
                                                                    <a class="Boldcolor" style="color: black">Non-Emergency Issues: </a>The Amazing
                                                                    Charts Guardian Angel Support team would be happy to assist you install, upgrade,
                                                                    and provide other guidance after normal hours as your schedule requires. For these
                                                                    non-emergent requests, please arrange by <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">contacting</a> or email us at DssSupport@DssSolutions.com.
                                                                </p>
                                                                Note: Creating an appointment uses the download form with following changes: Please
                                                                complete all the fields with your requirement to submit. One of Dss Solutions Healthcare
                                                                Technical Support expert will contact you within 24 hours. If is urgent issue, please
                                                                call <span class="skype_c2c_print_container notranslate">(202)256-6867</span><span
                                                                    data-ismobile="false" data-isrtl="false" data-isfreecall="false" data-numbertocall="+912022566867"
                                                                    onclick="SkypeClick2Call.MenuInjectionHandler.makeCall(this, event)" onmouseout="SkypeClick2Call.MenuInjectionHandler.hideMenu(this, event)"
                                                                    onmouseover="SkypeClick2Call.MenuInjectionHandler.showMenu(this, event)" tabindex="-1"
                                                                    dir="ltr" class="skype_c2c_container notranslate" id="Span17"><span skypeaction="skype_dropdown"
                                                                        dir="ltr" class="skype_c2c_highlighting_inactive_common"><span id="Span18" class="skype_c2c_textarea_span"><img
                                                                            width="0" height="0" src="resource://skype_ff_extension-at-jetpack/skype_ff_extension/data/call_skype_logo.png"
                                                                            class="skype_c2c_logo_img"><span class="skype_c2c_text_span">(202)256-6867</span><span
                                                                                class="skype_c2c_free_text_span"></span></span></span></span>. Services
                                                                = AC Support in database Requirements = Amazing Charts Technical Support; you need
                                                                to add this to the list. Requirements Explanation = Not an urgent issue. Please
                                                                contact me 9am-5pm CDT for Amazing Charts technical support
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Make an appointment to get support </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    The Guardian Angel Product Support team specializes in teaching users how to operate
                                                                    Amazing Charts. Not sure how to write an order? Wondering how to renew a medication?
                                                                    Need help with Meaningful Use? Product Support team members can teach how to use
                                                                    every facet of Amazing Charts, including e-Prescribing, Charting, Billing, Reports,
                                                                    Office Flow, and more.
                                                                </p>
                                                                <p>
                                                                    Our Product Support team:</p>
                                                                <ul>
                                                                    <li>Specializes in the operation of Amazing Charts</li>
                                                                    <li>Responds to all How-To questions</li>
                                                                    <li>Conducts live, instructional webinars for clients and non-clients on a daily basis.
                                                                    </li>
                                                                    <li>Conducts one-on-one training sessions for clients who need extra guidance</li>
                                                                    <li>And more! </li>
                                                                </ul>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        here </a>to make an appointment with Product Support.</p>
                                                                <h3 style="font-weight: bolder">
                                                                    Technical Support
                                                                </h3>
                                                                <p>
                                                                    The Guardian Angel Technical Support team specializes in setup, installation and
                                                                    the functionality of Amazing Charts. If you need help getting started with Amazing
                                                                    Charts, or if a function of Amazing Charts is not working properly, you should contact
                                                                    Technical Support.
                                                                </p>
                                                                <p>
                                                                    Our Technical Support team:</p>
                                                                <ul>
                                                                    <li>Specializes in setup, installation, and functionality of Amazing Charts</li>
                                                                    <li>Repairs issues resulting from Windows XP, Vista and 7 operating systems</li>
                                                                    <li>Moves databases from one computer to another as the needs of our clients change</li>
                                                                    <li>Ensures that Amazing Charts client experience 100% functionality</li>
                                                                    <li>And more! </li>
                                                                </ul>
                                                                <p>
                                                                    <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx" style="color: blue">
                                                                        Make an appointment with Technical Support. </a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Video Tutorials for self-paced training
                                                            </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/video-tutorials/"
                                                                        style="color: blue">here</a> for everything you need to know about Meaningful
                                                                    Use Stage 1, Meaningful Use Stage 2, AC Installation and Upgrading, AC new features,
                                                                    AC Office Flow, AC third parties integration, Helpful Hints, and more.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">System Requirements for Amazing Charts:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    One thing that makes the Amazing Charts Electronic Health Record (EHR/EMR) system
                                                                    so <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/?id=67" style="color: blue">
                                                                        affordable </a>is the ability to run on standard personal computers. In fact,
                                                                    you can run Amazing Charts on nearly any PC that you can purchase today.
                                                                </p>
                                                                <p>
                                                                    Amazing Charts works on most Microsoft Windows Operating Systems (e.g., Windows
                                                                    7, Vista, Small Business Server, and others), and even runs on tablets and netbooks.
                                                                </p>
                                                                <p>
                                                                    Click <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/support/hardware-os-requirements/"
                                                                        style="color: blue">here </a>for latest system and OS requirement from Amazing
                                                                    Charts.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Join the Discussion with Online Communities:
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Are you looking to meet other users of Amazing Charts so you can share tips, ask
                                                                    questions, or just chat with like-minded people?
                                                                </p>
                                                                <p>
                                                                    There are many ways to interact with our community of users. Click <a target="_blank"
                                                                        class="Boldcolor" href="http://amazingcharts.com/support/online-community/" style="color: blue">
                                                                        here </a>to view user groups.
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts Users Conference (ACUC):
                                                            </span>
                                                        </div>
                                                        <div class="acc-content">
                                                            <div class="acc-content-inner">
                                                                <p>
                                                                    Held in conjunction with <a target="_blank" class="Boldcolor" href="http://www.pri-med.com/pmo/Home.aspx"
                                                                        style="color: blue">Pri-Med </a>events, these one-day conferences feature informational
                                                                    sessions led by Amazing Charts staff and users and the opportunity to meet and share
                                                                    knowledge with other Amazing Charts users in your area.
                                                                </p>
                                                                <ul>
                                                                    <li>October 18, 2014: ACUC Midwest - Chicago, IL</li>
                                                                    <li>February 7, 2015: ACUC South - Fort Lauderdale, FL </li>
                                                                    <li>March, 2015: ACUC Southwest - Houston, TX</li>
                                                                    <li>March, 2015: ACUC West - Anaheim, CA</li>
                                                                    <li>September, 2014: ACUC East - Boston, MA</li></ul>
                                                                <p>
                                                                    Here are some images from past conferences. Click <a target="_blank" class="Boldcolor"
                                                                        href="https://www.facebook.com/media/albums/?id=346564170449" style="color: blue">
                                                                        here </a>to see more.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div id="benefits11" class="benefitsCls non-mobile hidebenefitsCls" style="width: 100% !important;
                    border-color: RGB(0,162,232)">
                    <table style="border: 2px solid RGB(0,162,232)">
                        <tbody>
                            <tr>
                                <td>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts on-Cloud - Just $39 Per Seat
                                                                Per Month </span>
                                                        </div>
                                                        <div class="acc-content open">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    Do you want to avoid the IT expense and headache of running an Electronic Health
                                                                    Record (EHR/EMR) system from your own computers?
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Amazing Charts is now available as a fully hosted service! All you need is a connection
                                                                    to the Internet, and you can start using a certified complete EHR in your practice
                                                                    today.
                                                                </p>
                                                                <h3 style="color: Black">
                                                                    Affordable Pricing &ndash; Just $39 Per Seat Per Month</h3>
                                                                <p style="color: black" class="Font">
                                                                    Our partner recently slashed the cost of Amazing Charts in the Cloud to just $39
                                                                    per seat per month, making this solution as affordable as running Amazing Charts
                                                                    from your own office, once you take technology costs into consideration.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Please note that this cost does not include one-time license fee ($1200/clinician),
                                                                    annual cost of Support and Maintenance ($1195/clinician), and any other required
                                                                    software and services.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Get Started Now with a Free 28-Day Trial
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    The best thing about Amazing Charts in the Cloud is how easy it is to try, buy,
                                                                    and use.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    First, start a <a target="_blank" class="Boldcolor" href="../DssUser/ContactUs.aspx"
                                                                        style="color: blue">FREE </a>trial today. You can create your own database with
                                                                    real patient database and even use your existing interfaces.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Next, if you like Amazing Charts in the Cloud you simply <a target="_blank" class="Boldcolor"
                                                                        href="../DssUser/ContactUs.aspx" style="color: blue">license </a>our software,
                                                                    and then our hosting partner handles all of the implementation and set up.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Financial Benefits of Amazing Charts on-Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Benefits that feed your bottom-line</h3>
                                                                <p style="color: black" class="Font">
                                                                    Amazing Charts in the Cloud offers financial benefits to your practice such as:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower upfront and ongoing financial investment:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>No extra hardware purchases</li>
                                                                    <li>No need for local server hardware </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower IT costs and requirements:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>System performance monitored centrally</li>
                                                                    <li>No need for dedicated IT person on staff</li>
                                                                    <li>Lower costs for software long term</li>
                                                                    <li>Windows Server 2008 R2 licensing included no added costs</li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Lower energy requirements:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Lower electrical usage</li>
                                                                    <li>Lower HVAC usage</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Accessing Amazing Charts in the Cloud
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    You can securely access Amazing Charts in the Cloud from any location:
                                                                </p>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Access from Office, Hospital, Home or even at a house call</li>
                                                                    <li>Rapid deployment for your practice no setup required by in-house staff </li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/interfaces/"
                                                                        style="color: blue">Interfaces </a>fully configured and ready to use</li>
                                                                    <li><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/remote-scanning/"
                                                                        style="color: blue">Remote scanning </a>supported (not on Mac) </li>
                                                                    <li>Remote printing supported</li>
                                                                    <li>Access from a PC, Mac, or even an iPad</li>
                                                                    <li>No VPN required</li>
                                                                    <li>24/7/365 availability</li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts in the Cloud Security
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <h3 style="font-weight: bolder">
                                                                    Two levels of security protect your practice</h3>
                                                                <h2 style="font-weight: bolder">
                                                                    Level One &ndash; System Security:
                                                                </h2>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Secure encrypted connectivity via 256-bit SSL</li>
                                                                    <li>Dedicated IP address and internal network for each practice</li>
                                                                    <li>Firewalled network connectivity</li>
                                                                    <li>VPN access is available if needed</li>
                                                                    <li>Windows Server Active Directory based authentication schemes for each practice</li>
                                                                    <li>Separate single server for every practice</li>
                                                                    <li>Separate SQL instance for each practice</li>
                                                                    <li>Proactive monitoring</li>
                                                                    <li>High availability for your practice </li>
                                                                </ul>
                                                                <h2 style="font-weight: bolder">
                                                                    Level Two &ndash; Cloud Data Center Security:
                                                                </h2>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>SAS 70 Type II Facilities</li>
                                                                    <li>Biometric authentication to all secure areas/doors</li>
                                                                    <li>Three-Factor man-trap authentication &amp; anti-pass back (Proximity card/biometric
                                                                        fingerprint reader/facial geometry scanner) </li>
                                                                    <li>Two-Factor access to cages (Proximity card/biometric fingerprint reader) </li>
                                                                    <li>24/7/365 on-site security</li>
                                                                    <li>High-definition CCTV network covering all interior and exterior strategic locations
                                                                        and access points, with 90-days video retention </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Data Protection with Built-in Disaster Recovery
                                                            </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    Worried about the cost of a Disaster Recovery solution on top of traditional backups?
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    With Amazing Charts in the Cloud, there are two levels of Data Protection. These
                                                                    include both local and offsite data storage, with the ability to restore a single
                                                                    file or the complete system, either locally or in a secondary facility.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Disaster Recovery is a standard component built into Amazing Charts in the Cloud.
                                                                    No extra cost to your practice, just added reliability and peace of mind ensuring
                                                                    maximum up-time.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Level One &ndash; Cloud data center local backups and server snapshots:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Full and incremental daily server snapshots</li>
                                                                    <li>Ability to recover SQL only</li>
                                                                    <li>Ability to recover imported items only</li>
                                                                    <li>Secure encrypted data storage while at rest</li>
                                                                    <li>Built-in disaster recovery </li>
                                                                    <li>Automated jobs to ensure no human error</li>
                                                                    <li>No tapes to change &ndash; all disk storage</li>
                                                                    <li>Eliminates headaches of traditional backups </li>
                                                                </ul>
                                                                <h3 style="font-weight: bolder">
                                                                    Level Two &ndash; Cloud data center failover to remote location:
                                                                </h3>
                                                                <ul style="margin-left: 40px" class="Font">
                                                                    <li>Ability to restore the entire server in a secondary offsite data center</li>
                                                                    <li>East Coast and West Coast site replication</li>
                                                                    <li>Full and incremental daily server snapshots to secondary offsite data center</li>
                                                                    <li>Ability to recover SQL only offsite</li>
                                                                    <li>Ability to recover imported items only offsite</li>
                                                                    <li>Secure encrypted data storage while at rest</li>
                                                                    <li>Redundant backups nightly</li>
                                                                    <li>Amazing availability for your practice and your data built into our solution
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Remote Scanning </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    There are two options for scanning documents into Amazing Charts in the Cloud:
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Quest Remote Scan</h3>
                                                                <p style="color: black" class="Font">
                                                                    You can use third-party software to scan directly into Amazing Charts. These applications
                                                                    must be purchased directly from third-party software vendors, not Amazing Charts.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <i>We recommend Quest Remote Scan and we have negotiated special pricing with them.
                                                                        A single license that regularly retails for $348 is priced at only $190 for clients
                                                                        of Amazing Charts in the Cloud. </i>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Import into Amazing Charts
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    You also have the option of scanning to Amazing Charts without third-party software.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    First, you scan the document to a folder on your computer/network. Then go into
                                                                    the patient's imported items, select "Import File," and browse to the location where
                                                                    you saved the file.
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Amazing Charts in the Cloud: Frequently Asked
                                                                Questions </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-1"
                                                                        style="color: blue"><u>What is Amazing Charts in the Cloud? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-2"
                                                                        style="color: blue"><u>How much will it cost? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                        style="color: blue"><u>What does the price include? </u></a>
                                                                </p>
                                                                <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                    style="color: blue"></a>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-3"
                                                                        style="color: blue"></a><a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-4"
                                                                            style="color: blue"><u>How can I try it for free? </u></a>
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    <a target="_blank" class="Boldcolor" href="http://amazingcharts.com/services/hosting1/frequently-asked-questions/#jfmulticontent_c2476-5"
                                                                        style="color: blue"><u>What are the top benefits of Amazing Charts in the Cloud?
                                                                        </u></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="acc-container">
                                                        <div class="acc-btn">
                                                            <span class="selected ContentHeadingStyle">Billing Services Priced Seven Percent or
                                                                Less! </span>
                                                        </div>
                                                        <div class="acc-content ">
                                                            <div class="acc-content-inner">
                                                                <p style="color: black" class="Font">
                                                                    What is the worst part about your practice? For many of us. it's the billing nightmare.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    To this end, Amazing Charts has contracted with a select few high-quality billing
                                                                    companies, willing to abide by our company's fundamental requirements of "amazing
                                                                    customer service at an amazing price with no nickle-and-diming allowed."
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    The result is that you can finally get paid quickly, appropriately, and without
                                                                    worrying that you aren't following the myriad of laws and regulations that make
                                                                    the practice of medicine so onerous.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    No more frustration dealing with individual payers or unorganized billers. No more
                                                                    angst trying to figure out complicated billing software that only an accountant
                                                                    should use. Instead, let our contracted partners deal with all your billing and
                                                                    show you how amazing and easy your cash flow can be.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    How does it work?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    As you sign your notes in Amazing Charts, an electronic superbill is automatically
                                                                    generated. Each night, easily export and upload this superbill data over a secured
                                                                    and encrypted (HIPAA-compliant) connection to our servers. The third-party billing
                                                                    company takes this data, reviews and scrubs it for errors, submits it, and deals
                                                                    with denials.
                                                                </p>
                                                                <p style="color: black" class="Font">
                                                                    Invoices for unpaid balances are sent out monthly, and uncollected charges can even
                                                                    be submitted directly to a collection agency on a case by case basis. Because using
                                                                    the Amazing Charts software allows improved efficiency and reduced data-entry expense
                                                                    for the billing companies, they are able to pass these savings back to you.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    What are the benefits?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    Our recommended billing partners are beyond experienced when it comes to coding.
                                                                    They are always up to speed on the constantly changing billing rules that none of
                                                                    us have the time to track. Being able to outsource your billing will lead to lower
                                                                    overhead expenses including software and labor hours, and many smaller expenses
                                                                    can be eliminated like postage and supplies. You will probably notice improved morale
                                                                    among your staff as one of the more stressful and time-consuming tasks is handed
                                                                    over to the experts. This will reduce employee turnover and training expenses. You
                                                                    will also benefit from the detailed account reporting all of our partners provide
                                                                    as well as cloud access to your account with many of them.
                                                                </p>
                                                                <h3 style="font-weight: bolder">
                                                                    Why is it worth the investment?
                                                                </h3>
                                                                <p style="color: black" class="Font">
                                                                    Beyond the savings you will realize from your overhead expenses, our billing partners
                                                                    pride themselves on maximizing your time. This means that maybe an updated coding
                                                                    may qualify you for more from the insurance carrier than the coding your staff has
                                                                    used. Being up to speed on the new coding means less denials and rejects which result
                                                                    in faster collections of the funds your practice is due to receive. In the end,
                                                                    you only will pay the billing company based on your net collections. We have negotiated
                                                                    with them to keep this <b class="Boldcolor"><u>rate of 7% or less of your net collections.
                                                                    </u></b>
                                                                </p>
                                                                <b class="Boldcolor">
                                                                    <p style="color: black" class="Font">
                                                                        You will be able to find cheaper options on the market from time to time. Remember,
                                                                        when you purchase a service, the price is a small factor in the value. Anyone of
                                                                        us has learned this in many other facets of life. Don’t overlook that insight in
                                                                        your business decisions.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        What do I get in return?
                                                                    </h3>
                                                                    <ul style="margin-left: 40px" class="Font">
                                                                        <li>24/7 access to account information (including A/R, daily billing information, and
                                                                            coding analysis). </li>
                                                                        <li>Denial resubmission without requiring your input (whenever possible). </li>
                                                                        <li>Checks sent/deposited directly to you from insurers and patients. </li>
                                                                        <li>Patient billing and invoicing (with no stamp or mailing fees). </li>
                                                                        <li>Toll-Free number for patients to call with billing issues/questions. </li>
                                                                    </ul>
                                                                </b>
                                                            </div>
                                                            <b class="Boldcolor"></b>
                                                        </div>
                                                        <b class="Boldcolor"></b>
                                                    </div>
                                                    <b class="Boldcolor">
                                                        <div class="acc-container">
                                                            <div class="acc-btn">
                                                                <span class="selected ContentHeadingStyle">Credit Card Processing for Medical Practices
                                                                </span>
                                                            </div>
                                                            <div class="acc-content ">
                                                                <div class="acc-content-inner">
                                                                    <p style="color: black" class="Font">
                                                                        In striving to make your office as profitable and easy to operate as possible, Amazing
                                                                        Charts has partnered with a proven merchant service provider to handle all your
                                                                        electronic payment processing.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        All Major Credit Cards Covered...and More</h3>
                                                                    <p style="color: black" class="Font">
                                                                        The service provider specializes in handling credit card payments for all major
                                                                        credit cards (Visa, MasterCard, American Express, and Discover), as well as handling
                                                                        transactions involving secured debit/ATM cards, electronic checks, and many other
                                                                        options available for securing payment for your services.
                                                                    </p>
                                                                    <h3 style="font-weight: bolder">
                                                                        On behalf of the Amazing Charts community, the following terms have been negotiated
                                                                        and placed into effect for your benefit:
                                                                    </h3>
                                                                    <ul style="margin-left: 40px" class="Font">
                                                                        <li><b class="Boldcolor">Timely Follow-up: </b>We have mandated that any Amazing Chart
                                                                            referral is contacted by an experienced representative within two business days.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Personal Assignment: </b>You will be assigned to a dedicated
                                                                            representative who is familiar with your situation and needs. This saves you time
                                                                            since it avoids having to explain things more than once to different representatives.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Association Pricing: </b>We have leveraged our size to obtain
                                                                            the lowest possible credit card processing rates and fees without ever sacrificing
                                                                            service. </li>
                                                                        <li><b class="Boldcolor">Transparency: </b>You will receive full disclosure on pricing…period.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Free Cost Analysis: </b>Many offices already have a payment
                                                                            processing arrangement in place. Our partner will evaluate your current program
                                                                            to see if a change would bring sufficient savings to justify switching. </li>
                                                                        <li><b class="Boldcolor">Discounted Equipment: </b>Terminals will be offered at a discount.
                                                                            Offices with terminals currently in place will have the option of using them whenever
                                                                            compatible. </li>
                                                                        <li><b class="Boldcolor">Next Day Funding: </b>There is no reason for an office to wait
                                                                            for their payments for any card type, even American Express. All payments will be
                                                                            made within 24 hours. </li>
                                                                        <li><b class="Boldcolor">Electronic Check Programs: </b>Checks are still a very popular
                                                                            form of payment for co-payments and other medical services. Processing those checks
                                                                            directly in your office will eliminate trips to the bank and bounced checks.
                                                                        </li>
                                                                        <li><b class="Boldcolor">Advanced Technology: </b>Whether it’s virtual terminals, on-line
                                                                            monitoring, or even smartphone payment applications, you are assured that the most
                                                                            advanced payment and monitoring solutions will be delivered to your office.
                                                                        </li>
                                                                        <li><b class="Boldcolor">24/7/365 Live Technical Support: </b>Experts are available
                                                                            to walk you through any questions you may have about your payment equipment, account,
                                                                            or anything else related to payment processing. </li>
                                                                        <li><b class="Boldcolor">Satisfaction Guaranteed </b></li>
                                                                        <b class="Boldcolor"></b>
                                                                    </ul>
                                                                </div>
                                                                <b class="Boldcolor"></b>
                                                            </div>
                                                            <b class="Boldcolor"></b>
                                                        </div>
                                                        <b class="Boldcolor"></b></b>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <!-- Footer -->
                <div class="wrapper row4">
                    <!-- ################################################################################################ -->
                    <div class="clear">
                    </div>
                </div>
            </div>
            <!-- Copyright -->
            <div class="wrapper row5" style="background: #0484cd;">
                <footer id="copyright">
    <p class="fl_left"><a class="Footerhyperlinks" href="http://developmentdss.azurewebsites.net/Footerpages/Copyright.aspx">Copyright©</a>
<span id="Span1" class="Footercomma">,</span>
<a class="Footerhyperlinks" href="http://developmentdss.azurewebsites.net/Footerpages/Privacypolicy.aspx">Legal Notices and Terms of Use </a>
<span id="Span2" class="Footercomma">,</span>
<a class="Footerhyperlinks" href="http://developmentdss.azurewebsites.net/Footerpages/Privacypolicy.aspx">Privacy Policy</a>
<span id="Span3" class="Footercomma">,</span>
<a class="Footerhyperlinks" href="http://developmentdss.azurewebsites.net/Sitemap/sitemap.aspx">Sitemap</a></p>
    
    <div class="clear"></div>
  </footer>
            </div>
        </div>
    </div>
    <!--Login section-->
    <div class="overlaybg hide">
    </div>
    <div class="fpPopUp hide">
        <div class="loginwindow">
            <div class="loginBgSection"><img class="disNone imgload" style="margin-top: -351px; z-index: 155555; position: relative;" src="AmazingCharts-Images/ajax-loader.gif" />
              
                <h3>
                    Forgot Password Form</h3>
                <img id="Img20" class="closebtn"  src="Content/Images/16x16-blue-delete-cross.png"
                    alt="close" onclick="" />
            </div>
            <div class="loginFgSection">
                <div class="loginsection">
                 <div class="errMsg" id="divFMsg">
                        </div>
                    <div class="Username">
                        <div class="usernamelbl">
                            <asp:Label ID="Label3" runat="server" Text="User Name :"></asp:Label>
                        </div>
                        <div class="usernametxt">
                            <input type="text" style="width:250px" runat="server" id="txtFPassword" />
                            <asp:RequiredFieldValidator ForeColor="Red" ID="rfvFPass" ValidationGroup="fpw" ControlToValidate="txtFPassword" runat="server" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                   
                </div>
                <div class="loginbutton">
                     <asp:Button ID="btnRtPassword" runat="server" ValidationGroup="fpw" Text="Reset Password" />
                </div>
                <div class="registrationlink">
                    <div class="forgotpswd">
                        <a href="#">Remembered</a></div>
                    &nbsp;&nbsp;&nbsp;<div class="registeruser">
                   <%--  <a id="ContentplaceholderData_ctl00_UserLogIn1_lnkRegister" style="width: 144px; color: rgb(128, 255, 255); font-size: 8pt; display: inline-block;" href='javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions("ctl00$ContentplaceholderData$ctl00$UserLogIn1$lnkRegister", "", true, "", "", false, true))'>* Register a New Account</a>--%>
                       <a target="_blank" id="a1" href="http://www.dsssolutions.com/DssUser/DssUserOverview.aspx?f=reg"> Register a new user</a></div> 
                </div>
            </div>
        </div>
    </div>
    <div class="loginReset hide">
        <div class="loginwindow">
            <div class="loginBgSection"><img class="disNone imgload" style="margin-top: -351px; z-index: 155555; position: relative;" src="AmazingCharts-Images/ajax-loader.gif" />
              
                <h3>
                    Change Password </h3>
                <img id="Img21" class="closebtn" src="Content/Images/16x16-blue-delete-cross.png"
                    alt="close" onclick="" />
            </div>
            <div class="loginFgSection">
                <div class="loginsection">
                    <div class="errMsg" id="divCPW">
                        </div>
                    <div class="Username">
                        <div class="usernamelbl">
                            <asp:Label ID="Label4" runat="server" Text="Old Password :"></asp:Label>
                        </div>
                        <div class="usernametxt">
                            <input runat="server" type="text" id="txtOldPW" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ControlToValidate="txtOldPW" ValidationGroup="cp" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                        </div>
                         </div>
                    <div class="Password1">
                        <div class="Passwordlbl">
                            <asp:Label ID="Label5" runat="server" Text="New Password :"></asp:Label>
                        </div>
                        <div class="Passwordtxt">
                            <input runat="server" type="password" id="txtNewPW" />
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor="Red" ControlToValidate="txtNewPW" ValidationGroup="cp" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                        </div>
                    </div>
                     <div class="Password1">
                        <div class="Passwordlbl">
                            <asp:Label ID="Label6" runat="server" Text="Confirm Password :"></asp:Label>
                        </div>
                        <div class="Passwordtxt">
                            <input runat="server" type="password" style="margin-left: -29px;" id="txtCnewPW" />
                            <asp:CompareValidator ID="rfcCV" ControlToCompare="txtNewPW" ControlToValidate="txtCnewPW" ForeColor="Red" Display="Dynamic" Text="*" ErrorMessage="*" ValidationGroup="cp" runat="server" Operator="Equal" SetFocusOnError="true" ></asp:CompareValidator>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red" ControlToValidate="txtCnewPW" ValidationGroup="cp" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                        </div>
                    </div>
                </div>
                <div class="loginbutton">
                    <asp:Button ID="btnReset" runat="server" ValidationGroup="cp" 
                        Text="Reset Password"  />
                </div>
               
            </div>
        </div>
    </div>
    <div class="loginPopUp hide">
        <div class="loginwindow">
            <div class="loginBgSection"><img class="disNone imgload" style="margin-top: -351px; z-index: 155555; position: relative;" src="AmazingCharts-Images/ajax-loader.gif" />
                <h3>
                    
                    Login Form</h3>
                <img id="closelogin" class="closebtn" src="Content/Images/16x16-blue-delete-cross.png"
                    alt="close" onclick="" />
            </div>
            <div class="loginFgSection">
                <div class="loginsection">
                    <div class="errMsg" id="divMsg">
                        </div>
                    <div class="Username">
                        <div class="usernamelbl">
                            <asp:Label ID="Usernamelbl" runat="server" Text="User Name :"></asp:Label>
                        </div>
                        <div class="usernametxt">
                            <input runat="server" type="text" id="Usernametxt" /> <asp:RequiredFieldValidator ID="rfvUser" runat="server" ForeColor="Red" ControlToValidate="Usernametxt" ValidationGroup="login" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                        </div>
                         </div>
                    <div class="Password">
                        <div class="Passwordlbl">
                            <asp:Label ID="Passwordlbl" runat="server" Text="Password :"></asp:Label>
                        </div>
                        <div class="Passwordtxt">
                            <input runat="server" type="password" id="Passwordtxt" />
                             <asp:RequiredFieldValidator ID="rfv" runat="server" ForeColor="Red" ControlToValidate="Passwordtxt" ValidationGroup="login" Display="Dynamic" Text="*" ErrorMessage="*"></asp:RequiredFieldValidator>
                  
                        </div>
                    </div>
                </div>
                <div class="loginbutton">
                    <asp:Button ID="loginbtn" CssClass="loginbtn" runat="server" ValidationGroup="login" Text="Login" />
                </div>
                <div class="registrationlink">
                <div class="forgotpswd">
                        <a id="aCP" href="#">Change password</a></div>
                    <div class="forgotpswd">
                        <a id="aFW" href="#">Forgot your password?</a></div>
                    &nbsp;&nbsp;&nbsp;<div class="registeruser">
                        <a target="_blank" id="aReg" href="http://www.dsssolutions.com/DssUser/DssUserOverview.aspx?f=reg"> Register a new user</a></div>
                </div>
            </div>
        </div>
    </div>
    <div class="RegisterPopUp hide">
        <div class="loginwindow">
            <div class="loginBgSection"><img class="disNone imgload" style="margin-top: -351px; z-index: 155555; position: relative;" src="AmazingCharts-Images/ajax-loader.gif" />
              
                <h3>
                    Register Form</h3>
                <img id="Img19" src="Content/Images/16x16-blue-delete-cross.png" alt="close" class="closebtn"
                    onclick="" />
            </div>
            <div class="registerFgSection">
                <div class="loginsection">
                    <div class="Username">
                        <div class="usernamelbl">
                            <asp:Label ID="Label1" runat="server" Text="User Name :"></asp:Label>
                        </div>
                        <div class="usernametxt">
                            <input type="text" id="Text1" />
                        </div>
                    </div>
                    <div class="Password">
                        <div class="Passwordlbl">
                            <asp:Label ID="Label2" runat="server" Text="Password :"></asp:Label>
                        </div>
                        <div class="Passwordtxt">
                            <input type="text" id="Text2" />
                        </div>
                    </div>
                </div>
                <div class="loginbutton">
                    <input type="button" value="Login" id="Button1" />
                </div>
                <div class="registrationlink">
                    <div class="forgotpswd">
                        <a href="#">Forgot your password?</a></div>
                    &nbsp;&nbsp;&nbsp;<div class="registeruser">
                        <a href="#">* Register a new user</a></div>
                </div>
            </div>
        </div>
    </div>
    </form>
    <%--<!--end--%>
</body>
</html>
