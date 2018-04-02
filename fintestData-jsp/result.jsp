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
<title>${indexTitle}</title>
<link rel="shortcut icon" href="${ctx}/file/favicon.ico" type="image/x-icon" />
<link rel="stylesheet" type="text/css" href="${ctx}/file/fintestData/css/common.css?ver=${nowDate}" />
<link rel="stylesheet" type="text/css" href="${ctx}/file/fintestData/css/result.css?ver=${nowDate}" />

</head>
<body>

	<header>
		<img alt="" src="${ctx}/file/fintestData/images/logo.jpg"/>
		<a class="back_btn" onClick="javascript:history.back()">返回</a>
		<a class="share_btn" onClick="shareFriend()">分享</a>
	</header>
	
	<div id="main">	
		<div class="title">${tfBean.compName }</div>
		
		<canvas id="myChart"></canvas>

		<ul class="wuli_text">
		<c:forEach var="finTest" items="${finTests }" varStatus="finTestsSts">
			<li><strong>${finTest.fieldValChNm}:</strong>${finTest.ext3}</li>
		</c:forEach>
		</ul>
		<div class="zj_div"><strong>总结：</strong>${orLevDesc}</div>
		<div class="line_bar"></div>
		<div class="content_div">
			<div class="content">${tfBean.scoresStr }</div>
				<ul class="content_ico">
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
				<li></li>
			</ul>
		</div>
		
		<a class="more_area_btn" data-type="0">点击展开详细测评结果</a>
		
		
	</div>
	<br />
	<a class="default_big_btn" href="${ctx}/PtlTest!fin.action">我要融测测</a>
	<br />
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/fintest/img/share_arrow.png" width="218"/></div>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery-2.11.min.js"></script>  
	<script type="text/javascript" src="${ctx}/file/commonJs/chart.min.js"></script>
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
	<script type="text/javascript" src="${ctx}/js/sha1.js"></script>
	<script type="text/javascript" src="${ctx}/file/fintestData/js/common.js" charset="UTF-8"></script> 
	<script type="text/javascript" src="${ctx}/file/fintestData/js/result.js"></script>
	 
	<script language="javascript">
	
	var webroot = "${ctx}";
	//wechat share start
	var shareTitle = "${title}";
	var shareDesc_s = "${desc_s}";
	var shareDesc_d = "${desc_d}";
	var shareAppId = "${jsapi.appId}";
	var shareTimestamp = "${jsapi.timestamp}";
	var shareNonceStr = "${jsapi.nonceStr}";
	var shareTicket = "${jsapi.jsapi_ticket}";
	//wechat share end
	var chartNameArr = [];
	var chartDataArr = [];
	<c:forEach var="finTest" items="${finTests }" varStatus="finTestsSts">
	
	chartNameArr.push("${finTest.fieldValChNm}");
	chartDataArr.push(${finTest.ext2});
	
	</c:forEach>

	</script>

		
</body>
</html>