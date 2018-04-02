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
<link rel="stylesheet" type="text/css" href="${ctx}/file/fintestData/css/index.css?ver=${nowDate}" />

</head>
<body>

	<header>
		<img alt="" src="${ctx}/file/fintestData/images/logo.jpg"/>
		<a class="share_btn" onClick="shareFriend()">分享</a>
	</header>
	
	<div id="main">	
		<!-- 关键字搜索框 -->
		<form action="${ctx}/PtlTest!search.action" method="post">
		<div id="search_bar">
			<input type="text" class="search_input" name="qryName" placeholder="请输入项目关键字或项目名称"/>
			<input type="submit" value="" class="search_btn"/>
		</div>
		</form>
		<!-- 公告栏 -->
		<div id="notice_bar">
			<img alt="" src="${ctx}/file/fintestData/images/notice_btn.jpg" height="30"/>
			<div class="notice_text">
				<ul >
				<c:forEach var="tf" items="${tfList }" varStatus="tfSts">
					<li>${tf.compName }，${tf.crtTimeStr }进行了融测测~~</li>
					<!--li>
						<span class="compname">${tf.compName }</span>
						<span class="username">${tf.userName }</span>
						<span class="timer">${tf.crtTimeStr }</span>进行了融测测~~
					</li-->
				</c:forEach>
				</ul>
				
			</div>
		</div>
		<div class="line_bar"></div>
		
		<!-- 地区分布 -->
		<div id="area_main">
			<div class="title"><img alt="" src="${ctx}/file/fintestData/images/title1.jpg"/></div>
			<div class="select_bar">
				<select>
					<option value="0">全部行业</option>
					<c:forEach var="compRang" items="${compRangList }" varStatus="compRangSts">
						<option value="${compRang.fieldVal }">${compRang.fieldValChNm }</option>
					</c:forEach>
				</select>
				<span class="project_num_span">项目总计：${numberTotal }</span>
			</div>
			<div class="content_area">
				<div id="map_area"></div>
				
			</div>
			
			<ul id="map_area_link" data-type="0" ></ul>
			<a class="more_area_btn" data-type="0">点击展开</a>

		</div>
		<div class="line_bar"></div>
		<!-- 维度分布 -->
		<div id="dimension_main">
			<div class="title"><img alt="" src="${ctx}/file/fintestData/images/title2.jpg"/></div>
			<div class="select_bar">
				<select>
					<option value="tt_n">年龄</option>
					<option value="tt_x">学历</option>
				</select>
			</div>
			<div class="content_area">
				
			</div>
			<ul id="dimension_ul">
			<c:forEach var="sels" items="${selsList }" varStatus="selsSts">
				<li>
					<span></span>
					<a>${sels.fieldValChNm }（${sels.ext1 }）</a>
				</li>
			</c:forEach>
			</ul>
		</div>
		
	</div>
	<div class="line_bar"></div>
	<!-- 我要测试按钮 -->
	<a class="default_big_btn" href="${ctx}/PtlTest!fin.action">我要融测测</a>
	<br />
	<!-- 分享引导 -->
	<div id="share_mask"><img alt="" src="${ctx}/file/fintest/img/share_arrow.png" width="218"/></div>
	<script type="text/javascript" src="${ctx}/file/commonJs/jquery-2.11.min.js"></script>  
	<script type="text/javascript" src="${ctx}/file/commonJs/raphael.js"></script>  
	<script type="text/javascript" src="${ctx}/file/commonJs/chart.min.js"></script>  
	<script type="text/javascript" src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
	<script type="text/javascript" src="${ctx}/js/sha1.js"></script>
	 
	<script language="javascript" charset="UTF-8">
	
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
	var userId = "${userId}";
	var userName = "${userName}";
	var userMobile = "${userMobile}";
	
	//饼状图数据
	var pieValDataArr = [];
	var pieLabelsDataArr = [];
	<c:forEach var="sels" items="${selsList }" varStatus="selsSts">
		pieValDataArr.push(parseInt(${sels.ext1}));
		pieLabelsDataArr.push("${sels.fieldValChNm }");
	</c:forEach>
	
	//中国地图初始化项目数
	var mapProjectsDataArr = [];
	<c:forEach var="valData" items="${valData }" varStatus="addressSts">
	mapProjectsDataArr.push(${valData});
	</c:forEach>
	
	//行业分类初始化
	var compRangStrArr = [];
	<c:forEach var="compRang" items="${compRangList }" varStatus="compRangSts">
	compRangStrArr.push("${compRang.fieldValChNm }");
	</c:forEach>
	
	//公告
	var noticeArrObj = [];
	<c:forEach var="tf" items="${tfList }" varStatus="tfSts">
	noticeArrObj[${tfSts.index}]= {
		compName:"${tf.compName }",
		userName:"${tf.userName }",
		crtTimeStr : "${tf.crtTimeStr }"
	};
	</c:forEach>

	</script>
	<script type="text/javascript" src="${ctx}/file/fintestData/js/common.js" charset="UTF-8"></script> 
	<script type="text/javascript" src="${ctx}/file/fintestData/js/chinamapPath.js" charset="UTF-8"></script>  
	<script type="text/javascript" src="${ctx}/file/fintestData/js/index.js" charset="UTF-8"></script> 
		
</body>
</html>