<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="https://rawgit.com/jasondavies/d3-cloud/master/build/d3.layout.cloud.js" type="text/JavaScript"></script>

<script>
$(function(){
	fn_wordCloud();
});

var color = d3.scale.linear() 			// 선형적인 스케일로 표준화를 시킨다.
.domain([0,1,2,3,4,5,6,10,15,20,100])   // 데이터의 범위, 입력 크기
.range([0.50]);							// 표시할 범위, 출력 크기

function fn_wordCloud(){
	$("#wordCloud > svg").remove();
	
	var keywords = [
		{subject: '갤럭시', mount: 25},
		{subject: '시리즈', mount: 22},
		{subject: '플래그십', mount: 21},
		{subject: '출시', mount: 20},
		{subject: '삼성', mount: 20},
		{subject: '모바일', mount: 19},
		{subject: '전자', mount: 18},
		{subject: '스마트', mount: 16},
		{subject: '인증', mount: 20},
		{subject: '보안', mount: 17},
		{subject: '서버', mount: 17},
		{subject: '사이버', mount: 16},
		{subject: '정보', mount: 16},
		{subject: '접속', mount: 16},
		{subject: '시스템', mount: 15},
		{subject: '데이터', mount: 15},
		{subject: '사용', mount: 15},
		{subject: '계정', mount: 14},
		{subject: '해킹', mount: 14},
		{subject: '업무', mount: 14},
		{subject: '과기정', mount: 17},
		{subject: '서울', mount: 16},
		{subject: '반도체', mount: 28},
		{subject: '산업', mount: 20},
		{subject: '당선', mount: 20},
		{subject: '공장', mount: 19},
		{subject: '평택', mount: 19},
		{subject: '네덜란드', mount: 17},
		{subject: '우리나라', mount: 17}
	];
	
	d3.layout.cloud().size([850, 350]) //[width,height]
	.words(keywords)
	.rotate(0)
    .fontSize(function(d) { return d.mount; })
    .on("end", draw)
    .start();
}

function draw(words) {
	var width = 900;
	var height = 400;
	
    d3.select("#wordCloud").append("svg")//wordcloud 테이블에 svg를 붙이고
            .attr("width", width)
            .attr("height", height)
            .append("g")
            .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")
            .selectAll("text")
            .data(words)
            .enter().append("text")
            .style("font-size", function(d) { return d.mount + "px"; })
            .style("fill", function(d, i) {
            	if(i <= 2){
            		return "#FF7F0E";
            	} else {
	            	return color(i); 
            	}
           	})
            .attr("transform", function(d) {
                return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
            })
            .text(function(d) { return d.subject; });
}
</script>

<html>
<head>
	<title>wordCloud</title>
</head>
<body>
	<div id="wordCloud" style="width:900px;height:400px;text-align: center;border: 5px solid #e2e2e2;border-radius: 15px;padding-top: 20px;"></div>
</body>
</html>