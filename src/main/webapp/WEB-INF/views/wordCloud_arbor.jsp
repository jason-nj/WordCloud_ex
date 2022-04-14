<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>
<script src="js/arbor.js"></script>
<script src="js/arbor-tween.js"></script>
<script src="js/arbor-graphics.js"></script>
<script src="js/site.js"></script>

<link rel="stylesheet" href="css/style.css"/>

<script>
$(function(){
	fn_wordCloud();
});

// 워드클라우드 생성 함수
function fn_wordCloud(){
	var word1 =['갤럭시','인증','정보','반도체'];
	var word2 = 
	[
		['시리즈', '플래그십', '출시', '삼성', '모바일', '전자', '스마트'],
		['보안', '서버', '사이버', '정보', '접속', '시스템', '데이터', '사용', '계정', '해킹', '업무'],
		['인증', '시스템', '전자', '보안', '사이버', '과기정', '서울'],
		['산업', '당선', '공장', '평택', '삼성', '네덜란드', '우리나라']
	];
	
	if(word1.length > 0 && word2.length > 0) {
		$("#canvasTag").html('<canvas id="wordCloud" width="1100px" height="600px" class="linkable"></canvas>');
		
		var sys = arbor.ParticleSystem();
		sys.parameters({stiffness:900, repulsion:2000, gravity:true, dt:0.015});
	    sys.renderer = Renderer("#wordCloud");
	
	    // 검색어 마스터노드
	    sys.addNode("MasterNode", {name: '삼성', color:"red" ,query: '삼성', shape : "dot"});
	    
	    $(word1).each(function(idx, data){
			// 1depth 
	    	sys.addNode("Node" + idx, {name : data, color : "#b2b19d", query : data[0], shape : "dot"});
	    	sys.addEdge("MasterNode", "Node" + idx, {});
			
			// 2depth
			$(word2[idx]).each(function(idx2, data2){
				sys.addNode("Node" + idx + idx2, {name : data2, color : "orange", query : data2, shape : "dot"});
		    	sys.addEdge("Node" + idx , "Node" + idx + idx2, {});
			});
	    });
	}
}
</script>

<html>
<head>
	<title>wordCloud</title>
</head>
<body>
	<div id="canvasTag" style="width: 1100px; height: 600px;opacity: 1;border: 5px solid #e2e2e2;border-radius: 15px;">
	</div>
</body>
</html>