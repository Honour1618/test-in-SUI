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
<link rel="stylesheet" type="text/css" href="${ctx}/file/commonCss/animate.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx}/file/tf/fintest/css/app.css?ver=${nowDate}" />
<style>

body , html{
height: auto;

}
#share_main{
background:#ffffff;
}
</style>
<script language="javascript">

var webroot = "${ctx}";
var prePrjCode = "${prj.prePrjCode}";
//wechat share start
var shareTitle = "${title}";
var shareDesc_s = "${desc_s}";
var shareDesc_d = "${desc_d}";
var shareAppId = "${jsapi.appId}";
var shareTimestamp = "${jsapi.timestamp}";
var shareNonceStr = "${jsapi.nonceStr}";
var shareTicket = "${jsapi.jsapi_ticket}";
//wechat share end

var prjCode = "${prjCode}";
var chartDataArr = [];
var chartNameArr = [];
<c:forEach  var="item" items="${finTests}" varStatus="status">
chartDataArr.push("${item.ext2}");
chartNameArr.push("${item.fieldValChNm}");
</c:forEach>
var IDTSRank = "${IDTSRank}";
var InDNum = "${InDNum}";
</script>
<script type="text/javascript" src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>  
<script language="javascript" src="${ctx}/file/commonJs/require.js"  data-main="${ctx}/file/tf/fintest/js/share.js?ver=${nowDate}"></script>
<script type="text/javascript" src="${ctx}/js/sha1.js"></script>

</head>
<body>       
	<div id="share_main">
    <!-- 注册成功查看分数 -->

		<div class="result_list_div">
			<img alt="" src="${ctx}/file/tf/fintest/img/result_bg_1.jpg" width="100%"/>
			<dl class="result_score_main">
				<dt class="score_num totalScore">${totalScore }分</dt>
				<c:if test="${IDTSRank == 1 and InDNum == 1}">
					<dd class="score_desc">恭喜你!你的总排名为${TSRank}<br/>战胜了同行业 <fmt:formatNumber pattern="#" value="100" type="number"/> %的小伙伴！</dd>
				</c:if>
				<c:if test="${(100 * (1- IDTSRank/InDNum)) < 20 and InDNum != 1}">
					<dd class="score_desc">恭喜你!你的总排名为${TSRank}<br/></dd>
				</c:if>
				<c:if test="${(100 * (1- IDTSRank/InDNum)) >= 20}">
					<dd class="score_desc">恭喜你!你的总排名为${TSRank}<br/>战胜了同行业 <fmt:formatNumber pattern="#" value="${100 * (1- IDTSRank/InDNum)}" type="number"/> %的小伙伴！</dd>
				</c:if>
			</dl>
		</div>
		<%-- <img alt="" src="${ctx}/file/fintest/img/result_bg_2.jpg" width="100%"/> --%>
		<div class="result_list_div"><img alt="" src="${ctx}/file/tf/fintest/img/result_bg_3.jpg" width="100%"/><canvas id="myChart" width="300" height="300"></canvas></div>
		<img alt="" src="${ctx}/file/tf/fintest/img/result_bg_5.jpg" width="100%"/>
		<div class="five_ul">
			<ul class="five_ul_con">
				<c:forEach  var="item" items="${finTests}" varStatus="status">
					<li>${item.ext3}</li>
				</c:forEach>				
			</ul>
			<img src="${ctx}/file/tf/fintest/img/result_bg_one.png" width="100%" />
		</div>
		<div class="result_list_div">
			<img alt="" src="${ctx}/file/tf/fintest/img/result_title_rg.png" width="100%"/>
			<div class="result_desc">${answer }</div>
			<img alt="" src="${ctx}/file/tf/fintest/img/result_bg_two.png" width="100%"/>
		</div>
		<div class="result_app_none">
			<img src="${ctx}/file/tf/fintest/img/result_choose.jpg" class="result_bp_choose" />
			<div class="tipPCScan">
				<p>浏览器打开网址：<b id="tipLink">www.ijointoo.com/scan</b>选择创业者身份，登陆系统发起你的助创</p>
			</div>
			<div class="guidePC">
				<img src="${ctx}/file/tf/fintest/img/guidePC.jpg" />
			</div>
		</div>
		<div class="stageGroup">
			<div class="stageOne stageSpec">
				<p>你还可以选择下载APP，提交商业计划书</p>
				<a class="result_default_btn" href="javascript:_hmt.push(['_trackEvent', '潜力测试结果页', '下载APP', '点击按钮', '0']);window.open('http://a.app.qq.com/o/simple.jsp?pkgname=com.i9tou')">下载APP</a>
			</div>
			<img src="${ctx}/file/tf/fintest/img/guideApp.jpg" class="guideApp" />
			<img src="${ctx}/file/tf/fintest/img/striping.png" class="striping" />
			<div class="stageTwo">
				<p>独乐乐不如众乐乐，分享爱就投众创生态系统到朋友圈，让大家一起来玩~</p>
				<a class="result_default_btn" onclick="shareFriend()">立即分享</a>
			</div>
		</div>
		<div class="stageApp">
			<div class="stageOne">
				<p>现在，邀你完善项目信息并上传商业计划书喽！有了商业计划书，知名创业者导师才有机会为你提供专业服务！</p>
				<a class="result_default_btn" onclick="gotoActivity()" href="javascript:_hmt.push(['_trackEvent', '潜力测试结果页', '上传商业计划书', '点击按钮', '0']);window.open('FaS')">上传商业计划书</a>
			</div>
		</div>
		<dl class="result_list_div result_contact_main">
			<dt>
				<div class="title">联系方式</div>
				<div class="desc">
					客服电话：400-639-1229<br />
					投稿邮箱：market@ijointoo.com<br/>
					<p class="copyright">上海爱就投金融信息服务股份有限公司 All Rights Reserved<br/>
					沪ICP备14047237号-1</p>
				</div>
				<div class="desc"></div>
			</dt>
			<dd>
				<%--<a class="result_default_btn" onClick="gotoActivity()" href="javascript:window.open('FaS')" target="_blank">看看同行</a>   javascript:window.open('${ctx }/PtlTest!index.action')--%>
				<!-- <a class="result_default_btn" onClick="shareFriend()">分享好友</a> -->
			</dd>
			<%-- <a class="more_project_btn" onClick="javascript:window.open('${ctx }/PtlWeixin!prjPubList.action')">查看更多项目>></a> --%>
		</dl>


		<div class="arrow_bottom"></div>
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