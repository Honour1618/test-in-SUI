<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/content/common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="description" content="${indexDesc}"/>
<meta name="keywords" content="${indexKeys}"/>
<title>爱就投——创业者的贴身导师</title>
<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
<%-- <link rel="stylesheet" type="text/css" href="${ctx}/file/commonCss/af.ui.base.css" /> --%>
<link rel="stylesheet" href="${ctx}/file/commonCss/sm.min.css">
<link rel="stylesheet" type="text/css" href="${ctx}/file/commonCss/animate.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/file/tf/fintest/css/app.css?ver=${nowDate}" />
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
<script language="javascript" src="${ctx}/file/commonJs/require.js"  data-main="${ctx}/file/tf/fintest/js/app.js?ver=${nowDate}"></script>
<script language="javascript" src="${ctx}/file/tf/fintest/js/regDataAjax.js?ver=${nowDate}"></script>
<script type="text/javascript" src="${ctx}/js/sha1.js"></script>
<script language="javascript">
var imgFileArr = [];
var webroot = "${ctx}";
<c:forEach  var="fname" items="${files}" varStatus="status">
imgFileArr.push("${fname}");
</c:forEach>
//wechat share start
var shareTitle = "${title}";
var shareDesc_s = "${desc_s}";
var shareDesc_d = "${desc_d}";
var shareAppId = "${jsapi.appId}";
var shareTimestamp = "${jsapi.timestamp}";
var shareNonceStr = "${jsapi.nonceStr}";
var shareTicket = "${jsapi.jsapi_ticket}";
//wechat share end
var userId = "${userId}";
var userName = "${userName}";
var userMobile = "${userMobile}";
</script>
</head>
<body>
	<div id="splashscreen" class='ui-loader heavy'>
		<div class="loading_num"></div>
		<div class="loader-inner ball-spin-fade-loader">
	        <div></div>
	        <div></div>
	        <div></div>
	        <div></div>
	        <div></div>
	        <div></div>
	        <div></div>
	        <div></div>
		</div>
		<img alt="" src="${ctx}/file/tf/fintest/img/loading.png" width="100"  class="loading_text"/>
    </div>
    
    
            
    <div class="view" id="mainview">
        <div class="page-group">
        	<!-- 欢迎页 -->
            <div class="page" id="main" data-title="Main" data-selected="true">
            	
            	<div class="animate_el main_el_1"></div>
            	<div class="animate_el main_el_2"></div>
            	<div class="animate_el main_el_3"></div>
            	<!-- <div class="animate_el main_el_4"></div> -->
            	
            	<a class="start_btn" onClick="startApp()">下一步</a>
            </div>
            
            <!-- 测试前，项目分类 -->
		    <div class="page" id="MENU_INFO" data-title="MENU_INFO" data-array="" data-load="finEndCallback">
		    	<img alt="" src="${ctx}/file/tf/fintest/img/start_title.png" width="100%"/>
				<ul class="form_main" data-userId="${userId}">
					<li class="h5_input_border">
						<i class="ico_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/qiye.png" class="ico_img"/> --%>
						<input type="text" placeholder="3个字及以上项目名称" id="reg_comname"/>
						<span class="error_tips" id="reg_comname_tips">请输入3个字及以上项目名称</span>
					</li>
					<li class="h5_input_border">
						<i class="ico_img ico_stage_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/diqu.png" class="ico_img"/> --%>
						<select id="reg_jd_select">
							<option value="0">所属阶段</option>
							<c:forEach  var="item" items="${finStageList}" varStatus="status">
								<option value="${item.fieldVal}">${item.fieldValChNm}</option>
							</c:forEach>
						</select>
						<span class="error_tips" id="reg_select_jd_tips">请选择所属阶段</span>
						<img alt="" src="${ctx}/file/tf/fintest/img/xiala.png" class="xia_img">
					</li>
					<li class="h5_input_border">
						<i class="ico_img ico_ind_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/hangye.png" class="ico_img"/> --%>
						<select id="reg_select">
							<option value="0">所属行业</option>
							<c:forEach  var="item" items="${compRangList}" varStatus="status">
								<option value="${item.fieldVal}">${item.fieldValChNm}</option>
							</c:forEach>
						</select>
						<span class="error_tips" id="reg_select_tips">请选择所属行业</span>
						<img alt="" src="${ctx}/file/tf/fintest/img/xiala.png" class="xia_img">
					</li>
					<li><a class="reg_btn start_quiz" onClick="recordInfoFunction()">开始测试</a></li>
				</ul>

		    </div>
            
            <!-- 心理测试引导页 -->
			<div class="page innerWelcome" id="innerWelcome">
				<header>
					<a class="backButton back_btn back"  onClick="javascript:void(0);"></a>
		        </header>
            	<div class="animate_el left_el animated fadeInLeftBig" style="background-image: url(${ctx}/file/tf/fintest/img/t_c_el_3.png);display:block;"></div>
				<a class="goon_btn" onClick="next_quiz();">下一步</a>
			</div>
          
			<c:forEach  var="sub" items="${dicts}" varStatus="status_sub"> 
	            <div class="page qa_main" id="${sub.fieldEnNm}_${status_sub.index}" data-title="${sub.fieldEnNm}_${status_sub.index}" data-load="transformCallback" data-next="#${sub.fieldEnNm}_${status_sub.index+1}" page-code="">
					<header>
						<a class="backButton back_btn back" onClick="javascript:void(0);"></a>
			        </header>
					<div class="qa_title fadeInLeftBig animated">${sub.fieldValChNm}</div>
					<ul class="qa_ul">
						<c:forEach  var="item" items="${sub.subDictList}" varStatus="status">
							<!-- 问答列表 -->
							<li><a class="qa_li bounceInLeft animated delay0${status.index + 1}" user-data="${item.fieldEnNm}:${item.fieldVal}">${item.fieldValChNm}</a></li>
						</c:forEach>
					</ul>
					<div class="rightBottom">${status_sub.index+1}/13</div>
	            </div>
			</c:forEach>
			
			 <!-- 问卷结束注册页（用于移动端H5登录注册） -->
            <div class="page" id="REG_H5" data-title="REG_H5" data-array="" >
            	<img alt="" src="${ctx}/file/tf/fintest/img/reg_title.png" width="100%"/>
				<ul class="form_main" data-userId="${userId}">
					<li class="h5_input_border">
						<i class="ico_img ico_name_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/input_name.png" class="ico_img"/> --%>
						<input type="text"  id="reg_name" maxlength="20" placeholder="真实姓名"/>
						<span class="error_tips" id="reg_name_tips">请输入中文姓名(2-20)字</span>
					</li>
					<li class="h5_input_border">
						<i class="ico_img ico_tel_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/input_phone.png" class="ico_img"/> --%>
						<input type="tel"  maxlength="11" id="reg_mobile" placeholder="请输入手机号"/>
						<span class="error_tips" id="reg_mobile_tips">请正确输入手机号</span>
					</li>
					<!--li class="h5_input_border">
						<input type="tel" value="图形验证码" class="short" id="randCode" maxlength="4"/>
						<a href="javascript:changeImagelabel();" title="换一张" ><img alt="" src="/genVerifyCode.do" class="yzm_img" height="48" width="100"/></a>
						<span class="error_tips" id="reg_randcode_tips">请正确输入验证码</span>
					</li-->
					<li class="h5_input_border">
						<i class="ico_img ico_yzm_img"></i>
						<%-- <img alt="" src="${ctx}/file/tf/fintest/img/input_pwd.png" class="ico_img"/> --%>
						<input type="tel"  class="short"  id="reg_code" maxlength="6" placeholder="短信验证码"/>
						<button class="getCode_btn" name="btnSendCode" id="btnSendCode" type="button" onclick="sendMessage()"><span id="v_btn_view" >点击获取</span></button>
						<span class="error_tips" id="reg_code_tips">请正确输入短信验证码</span>
					</li>
					<li>
						<a class="reg_btn" onClick="checkResultPage()">查看得分</a>
					</li>
				</ul>
            </div>
		</div>
	</div>

	
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/tf/fintest/img/share_arrow.png" width="218"/></div>
	<!-- 背景音乐 -->
	<audio id="media_obj" data-media="false" src="${ctx}/file/tf/fintest/audio/default.mp3"  loop="loop" width="0" height="0"></audio>
	<a class="media_btn"  onClick="javascript:mediaPlayObj(this)"></a>
	<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "https://hm.baidu.com/hm.js?94963b429d3987631a51ad33ad34473f";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
</body>
</html>