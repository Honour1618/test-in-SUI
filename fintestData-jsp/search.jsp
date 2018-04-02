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
<link rel="stylesheet" type="text/css" href="${ctx}/file/fintestData/css/search.css?ver=${nowDate}" />

</head>
<body>

	<header>
		<img alt="" src="${ctx}/file/fintestData/images/logo.jpg"/>
		<a class="back_btn" onClick="javascript:history.back()">返回</a>
		<a class="share_btn" onClick="shareFriend()">分享</a>
	</header>
	
	<div id="main">	
		<c:if test="${compList != null && compList.size() > 0}">
		<ul>
			<li class="second">
				<span class="name"><strong>公司名</strong></span>
				<span><strong>评测时间</strong></span>
			</li>
			<c:forEach var="comp" items="${compList }" varStatus="compSts">
			<li class="${compSts.index%2 != 0 ? 'second' : ''}">
				<a class="name"  href="${ctx}/PtlTest!getCompSelsAjax.action?id=${comp.objId }">${compSts.index+1 }、${comp.compName }</a>
				<span class="timer">${comp.crtTimeStr }</span>
			</li>
			</c:forEach>
		</ul>
		</c:if>
		<c:if test="${compList == null ||  compList.size() == 0}">
		<div style="text-align:center;height:300px;line-height:300px;font-size:14px;">没有搜索结果！</div>
		</c:if>
	</div>
	<a class="default_big_btn" href="${ctx}/PtlTest!fin.action">我要融测测</a>
	<br />
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/fintest/img/share_arrow.png" width="218"/></div>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery-2.11.min.js"></script>  
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
	<script type="text/javascript" src="${ctx}/js/sha1.js"></script>
	<script type="text/javascript" src="${ctx}/file/fintestData/js/common.js" charset="UTF-8"></script> 
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

	</script>

		
</body>
</html>