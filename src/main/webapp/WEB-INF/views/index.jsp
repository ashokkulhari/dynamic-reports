<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Welcome to MY APP</title>

    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="${contextPath}/resources/css/style.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
	
        <div class="main_wrap">
            <div class="top_links_wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <nav class="navbar ">
                                <div class="navbar-header">
                                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false"><span class="sr-only">Toggle navigation</span> <i class="fa fa-bars" aria-hidden="true"></i></button>
                                </div>
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <ul class="nav navbar-nav">
                                        <li class="resizer"><a href="javascript:chooseStyle('small', 60);" title="Smaller Size" class="sm">अ-</a></li>
                                        <li class="resizer"><a href="javascript:chooseStyle('none', 60);" title="Default Size" class="md">अ</a></li>
                                        <li class="resizer"><a href="javascript:chooseStyle('bigger', 60);" title="Bigger Size" class="lg">अ+</a></li>

                                       
                                        <li><a href="screenreader.aspx">स्क्रीन रीडर</a></li>
                                        <li><a href="#templatemo_main">मुख्य कंटेंट की ओर</a></li>
                                        <li><a href="#mainmenu">नेविगेशन की ओर</a></li>
                                        <li>
                                            <ul class="social_links ">
                                                <li><a href="#"><i class="fb fa fa-facebook"></i></a></li>
                                                <li><a href="https://youtu.be/Yy8D8av8QCU" target="_blank"><i class="yt fa fa-youtube-play"></i></a></li>
                                                <li><a href="#"><i class="tw fa fa-twitter"></i></a></li>
                                            </ul>
                                        </li>
                                    </ul>
                                    <ul class="nav navbar-nav navbar-right">
                                        <li class="resizer">
                                            <input type="text" class="form-control" placeholder="खोजें …" />
                                        </li>
                                        <li class="resizer">
                                            <button class="search-submit" type="submit"><i class="fa fa-search"></i></button>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <header>
                <div class="container">
                    <div class="logo ">
                        <img src="assets/img/mp-logo.png" alt="" />
                    </div>
                    <div class="col-md-5 logo_text">
                        <h1>रेवेन्यू केस मैनेजमेंट सिस्टम </h1>
                        <p>राजस्व विभाग म. प्र. शासन</p>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="col-md-6">
                                <a href="#" class=" lg_btn_link bonfire-slideout-button">
                                    <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    रेवेन्यू कोर्ट लॉग इन
                                </a>
                            </div>
                            <div class="col-md-6">
                                <a href="http://164.100.196.245:8080/" class="lg_btn_link" target="_blank">
                                    <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                                    राजस्व मण्डल लॉग इन
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="header_right">
                        <div class="qr">
                       
                        </div>
                    </div>
                </div>
            </header>
            <div class="nav_wrap">
                <div class="container" id="mainmenu">
                    <ul class="slimmenu">
                        <li class="active"><a href="Default.aspx">मुख्य पृष्ठ</a></li>
                        <li><a href="CauseList.aspx">कॉज लिस्ट</a></li>
                        <li><a href="CaseDetail_Search_New.aspx">प्रकरण विवरण</a></li>
                        <li><a href="Order_Search.aspx">आदेश</a></li>
                         <li><a href="websitefeedback.aspx">प्रतिक्रिया</a></li>
                        <li>
                            <a href="#">आवेदन करें</a>
                            <ul>
                                <li><a href="publicapp.aspx">स्वतः आवेदन करे</a></li>
                            
                                <li><a href="../AvivaditNamantarn/AvivaditNamantarn_New.aspx">आविवादित नामान्तरण(ग्रामीण क्षेत्र)</a></li>
                                <li><a href="../AvivaditNamantarn/AvivaditBatwara.aspx">आविवादित बटवारा (ग्रामीण क्षेत्र)</a></li>
                               
                            </ul>
                        </li>
                       

                      
                        <li><a href="Downloads.aspx" target="_blank">डाउनलोड्स</a></li>
                        <li><a href="Help_New.aspx" target="_blank">सहायता</a></li>
                        <li><a href="Help_New.aspx">संपर्क करें</a></li>
                        
                        <li><a href="ReportsDetails.aspx">EODB</a></li>
                         <li><a href="DRDO.aspx">ROR</a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>

            <div class="main_slider">
                <ul class="rslides" id="slider4">
                    <li style="background: url(assets/img/banner.jpg)"></li>
                </ul>
                <div class="slider_strip">
                    <div class="container">
                        <div class="row ">
                            <div class="col-md-7">
                                <div class="breakingNews " id="bn10">
                                    <div class="bn-title"><span>नया क्या है</span></div>
                                    <ul>
                                        <li><a href="publicapp.aspx">नागरिक स्वतः आवेदन करने हेतु यहाँ क्लिक करें</a></li>
                                        <li><a href="AvivaditNamantarn/AvivaditNamantarn_New.aspx">आविवादित नामांतरण आवेदन करने हेतु यहाँ क्लिक करें(ग्रामीण क्षेत्र) </a></li>
                                        <li><a href="AvivaditNamantarn/AvivaditBatwara.aspx">आविवादित बटवारा आवेदन करने हेतु यहाँ क्लिक करें(ग्रामीण क्षेत्र) </a></li>
                                    </ul>
                                    <div class="bn-navi"><span><i class="fa fa-arrow-left" aria-hidden="true"></i></span><span><i class="fa fa-arrow-right" aria-hidden="true"></i></span></div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-md-7">
                        <div class="video_popup">
                            <div class="row">
                                <div class="col-md-6 mediacov">
                                   
                                                
                                                       <a href="Order_Search.aspx">
                                        <img src="images/fo.png" alt="Final Order" height="50" width="320" />
                                       
                                    </a>
                                                    
                                     
                                              
                                                  <a href="CaseDetail_Search_New.aspx">
                                                        <img src="images/casedtl.png" alt=""  height="50" width="320"/>
                                
                                    </a>
                                      <a href="CauseList.aspx">
                                                        <img src="images/cl.png" alt=""  height="50" width="320"/>
                                
                                    </a>
                                                 
                                          
                                  
                                </div>
                                <div class=" col-md-6">
                                    <div class="owl-carousel owl-theme rcmsvad ">
                                        <div class="item">
                                            <div id="Yy8D8av8QCU" class="youtubeVideoLoader">
                                            </div>
                                        </div>
                                        <div class="item">
                                            <div id="JaySSNNBUd8" class="youtubeVideoLoader">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5">
                        <div class="row">
                            <div class="block-wrapper">
                                  <ul id="slider-list3" >
       
        <li class="current"><img src="images/s1.jpeg" width="100" height="50" alt="CS visit"/></li>
                             
        <li><img src="images/s2.JPG" width="100" height="50" alt="CS visit"/></li>
     <li ><img src="images/s3.jpeg" alt="CS visit"/></li>
    </ul>


                       

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="main_content resizable-content">
                <section class="home_list_link">
                    <div class="dark_overlay"></div>
                    <div class="container overlay_con">
                        <div class="row row-eq-height">
                            <div class="col-md-6 col-sm-6 col-xs-12 pad_0 color_bx reg_case_bx ">
                                <div class="ribbon">
                                    <a href="#">Top 5</a>
                                </div>
                                <h1 class="">प्रकरण दर्ज करने में
                                </h1>
                                <div class="cont_box">
                                    <div class="box_content">
                                     
                                        <div>
	<table cellspacing="2" cellpadding="2" id="gvreg">
		<tr style="font-size:Large;font-weight:bold;">
			<th scope="col">&nbsp;</th><th scope="col">न्यायालय का नाम</th>
		</tr><tr>
			<td style="width:10px;">
            <span id="gvreg_lblRowNumber_0">1</span>
        </td><td>न्यायालय अनुविभागीय अधिकारी राजस्व,जबलपुर ग्रामीण</td>
		</tr><tr>
			<td style="width:10px;">
            <span id="gvreg_lblRowNumber_1">2</span>
        </td><td>तहसीलदार कोर्ट चितरंगी</td>
		</tr><tr>
			<td style="width:10px;">
            <span id="gvreg_lblRowNumber_2">3</span>
        </td><td>न्‍यायालय अनुविभागीय अधिकारी राजस्‍व  छिन्‍दवाडा</td>
		</tr><tr>
			<td style="width:10px;">
            <span id="gvreg_lblRowNumber_3">4</span>
        </td><td>न्‍यायालय तहसीलदार, तहसील सिहोरा जिला जबलपुर (म.प्र.)</td>
		</tr><tr>
			<td style="width:10px;">
            <span id="gvreg_lblRowNumber_4">5</span>
        </td><td>न्यायालय अनुविभागीय अधिकारी राजस्व,सिहोरा</td>
		</tr>
	</table>
</div>
</div>
</div>
</div>
</div>
</div>	
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
