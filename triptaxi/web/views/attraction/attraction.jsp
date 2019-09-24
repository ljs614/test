<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.triptaxi.attraction.model.vo.Attraction,java.util.List" %>
<%
	Attraction a =(Attraction)request.getAttribute("selectatt");
	String attId=a.getAttractionId();
	String attName=a.getAttractionName();
	String attEng=a.getAttractionEng();
	String city=a.getCity();
	double attLat=a.getAttractionLat();
	double attLng=a.getAttractionLng();
	String[] imageUrl=a.getImageUrl().split(",");
	String attComment=a.getAttractionComment();
	int clipCount=a.getClipCount();
	int reviewScore=a.getReviewScore();
	String category=a.getCategory();
	int count=0;
	List<Attraction> list=(List)request.getAttribute("list");
	
%>
<%@ include file="/views/common/header.jsp" %>
<style>

div{
    border: 2px solid hotpink;
  border-radius: 5px;   
}

table{
margin:0 auto;
width:1024px;
border: 1px solid #444444;
}

tr{
border: 1px solid #444444;
}

td{
   border: 1px solid #444444; 
}

	#root{
		color:gray;
	}
	#root1:hover{
		color:skyblue;
	}
	.attractionName{
		color:gray;
		width:500px;
		text-align:left;
		font-family: 'Nanum Gothic', sans-serif;
	}
	.button {
  padding: 15px 25px;
  font-size: 15px;
  text-align: right;
  cursor: pointer;
  outline: none;
  color: #fff;
  background-color: #4CAF50;
  border: none;
  border-radius: 15px;
  box-shadow: 0 5px #999;
}
.button:hover {background-color: #3e8e41}

.button:active {
  background-color: #3e8e41;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
 
}
#topButtonClip{
	font-size: 50px;
	color: gray;
	text-align:center;
}
#topButtonMap{
	font-size: 50px;
	color: gray;
	text-align:center;
}
#topButtonReview{
	font-size: 50px;
	color: gray;
	text-align:center;
}
#topButtonAdd{
	font-size: 50px;
	color: gray;
	text-align:center;
}

.topButton{
	width:500px;
	text-align:right;
}
#topButtonClip:hover{
	font-size: 52px;
	color: orange;
		-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}
#topButtonMap:hover{
	font-size: 52px;
	color: skyblue;
		-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}
#topButtonReview:hover{
	font-size: 52px;
	color: green;
		-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}
#topButtonAdd:hover{
	font-size: 52px;
	color: hotpink;
		-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}

#imageText{
	font-size: 15px;
}
#clipText{
	color:skyblue;
}

#sectionBody{
  background-color: rgb(238, 238, 238);
  border-top: 2px solid rgb(132, 220, 255);
  border-bottom: 2px solid rgb(132, 220, 255);
}

#imagebody {
  font-family: Arial;
}

img {
  vertical-align: middle;
}

/* Position the image container (needed to position the left and right arrows) */
.container {
  position: relative;
  height:300px;

}
.mySlides{
  	height:400px;

}

/* Hide the images by default */
.mySlides {

  display: none;
	-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;

}

/* Add a pointer when hovering over the thumbnail images */
.cursor {
  cursor: pointer;
}

/* Next & previous buttons */
.prev,
.next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: 50px;
  color: white;
  font-weight: bold;
  font-size: 20px;
  border-radius: 0 3px 3px 0;
  user-select: none;
  -webkit-user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover,
.next:hover {
  background-color: rgba(0, 0, 0, 0.8);
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* Container for image text */
.caption-container {
  text-align: center;
  background-color: #222;
  padding: 2px 16px;
  color: white;
    	 

}

.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Six columns side by side */
.column {
  float: left;
  width: 25%;
  opacity: 0.7;
   overflow:hidden;
   

}

.column:hover {
  opacity: 1;
	-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;

  
}

/* Add a transparency effect for thumnbail images */
.demo {
	height:100px;

}

.demo:hover {
  	cursor:pointer;
    transform:scale(1.5);
	transition: transform 10s;  
  	opacity: 1;
	
}

#info{
	margin-left:15px;
	width:500px;
    font-family: Arial;
}

#infoMent{
	width:500px;
}

#recommendTB{
 text-align: center;
}

#recommendTitle{
	color:gray;
}

#recommendDiv{
  position: relative;
  text-align: center;
  color: black;
 overflow:hidden;
}

#recommendPic1{
 width:230px;
 height:200px;
 opacity: 0.8;
}
#recommendPic1:hover{
  	   cursor:pointer;
       transform:scale(1.5);
		transition: transform 5s;  
  		opacity: 1;
  			-webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
}


 #reviewTitle{
 	text-align: center;
 }
 
 #reviewTitleR{
text-align: center;
    background-color: rgb(175, 230, 255);
    width:50%;
	color:gray;
 }

 
 #reviewTitleQ{
    background-color: rgb(246, 196, 102);
    text-align: center;
    color:gray;
 }
 
 #reviewComment{
 	height:500px;
 }
 
  #mapTd{
 	height:500px;
 }
 

 div#map{
      position: relative;
      width: 100%;
      height: 100%;
      padding: 0px;
      top: 0px;
      z-index: 1;
        border: 2px solid skyblue;

    }

 @-webkit-keyframes fade {
  from {opacity: 0} 
  to {opacity: 1}
}

 
</style>
	<section id=sectionHead>
	<br><br>
	<table>
	<tr>
	<td>
	<div id=root>
		<h5><a href="" id="root1">여행지</a> > <a href="" id="root1">나라</a> > <a href="" id="root1"><%=city%></a> > <a href="" id="root1">관광명소</a> > <a href="" id="root1"><%=attName%></a></h5>
	</div>
	</td>
	</tr>
	<tr>
	<br>
	<td>
	<div class=attractionName>
	<h2><%=attName%> (<%=attEng%>)</h2>
	<h5><i class="fas fa-map-marker-alt"></i>Trần Phú, 냐짱, Tỉnh Khánh Hòa, 베트남</h5>
  <h5><i class="fas fa-paperclip"><%=clipCount%></i> | 
      <i class="fas fa-heart" style="color:hotpink">1</i> | 
	<a href=""><span id=clipText><i class="fas fa-camera-retro"></i>사진추가</span></a>
	</h5>
	</div>
	</td>
	<td class=topButton>
	<div class=topButton>
	<a id="clipClick"><i class="fas fa-paperclip" id="topButtonClip"><h4 id="imageText">클립보드 </h4></i></a>&nbsp
	<a href=""><i class="fas fa-map-marked-alt" id="topButtonMap"><h4 id="imageText">지도보기</h4></i></a>&nbsp
	<a href=""><i class="fas fa-edit" id="topButtonReview"><h4 id="imageText">리뷰작성</h4></i></a>&nbsp
	<a href=""><i class="far fa-calendar-plus" id="topButtonAdd"><h4 id="imageText">일정추가</h4></i></a>
	</div>
	</td>
	
	</tr>
	</table>
	<script>
	var count=0;
		$("#clipClick").click(function(){
			count++;
			console.log(count);
			if(parseInt(count)%2!=0){
			$("#topButtonClip").css("color","orange");
			$("#imageText").html("클립해제");
        	alert("클립보드에 추가됐습니다.")
			}else{$("#topButtonClip").css("color","gray");
			$("#imageText").text("클립보드");
      		alert("클립보드에서 제거됐습니다.")
      }
		});
	</script>
	</section>
	
	<section id=sectionBody>
	<br>
	<table>
	<tr>
		<td id="imagebody"> 
		<div class="container">
  <div class="mySlides">
    <div class="numbertext">1 / 4</div>
    <img src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[0]%>" style="width:600px;height:400px">
    <%-- <img src="images/"<%=attName%>/<%=thumbnailUrl%>" style="width:600px;height:400px"> --%>
  </div>

  <div class="mySlides">
    <div class="numbertext">2 / 4</div>
    <img src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[1]%>" style="width:600px;height:400px">
  </div>

  <div class="mySlides">
    <div class="numbertext">3 / 4</div>
    <img src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[2]%>" style="width:600px;height:400px">
  </div>
    
  <div class="mySlides">
    <div class="numbertext">4 / 4</div>
    <img src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[3]%>" style="width:600px;height:400px">
  </div>


  <a class="prev" onclick="plusSlides(-1)">❮</a>
  <a class="next" onclick="plusSlides(1)">❯</a>



  <div class="row">
    <div class="column">
      <img class="demo cursor" src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[0]%>" style="width:100%" onclick="currentSlide(1)">
    </div>
    <div class="column">
      <img class="demo cursor" src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[1]%>" style="width:100%" onclick="currentSlide(2)">
    </div>
    <div class="column">
      <img class="demo cursor" src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[2]%>" style="width:100%" onclick="currentSlide(3)">
    </div>
    <div class="column">
      <img class="demo cursor" src="<%=request.getContextPath() %>/images/<%=city%>/<%=attName%>/<%=imageUrl[3]%>" style="width:100%" onclick="currentSlide(4)">
    </div>
	</div>
	</div>
	</td>
	<td>
	<div id="info">
		<div id="infoTitle"><h3>상세설명</h3></div><br>
		<div id="infoMent">
			<%=attComment %>
		</div>
	</div>
	</td>
	</tr>
	</table>
	<br><br>
	
	 <table>
	 <tr>
	 <td id="mapTd">
	 		<div id="map"></div>
	 </td>
	 </tr><br>
	 </table>
	 
	 <table>
  <tr>
  <td>
  <div id="recommendTitle">
	<h3>이장소와 함께 포함된 장소</h3>
	</div>
	</td>
  </tr>
  	<tr>
  <% for(Attraction arr : list){ count++; String[] recommendImageUrl=arr.getImageUrl().split(",");%>
  <td id="recommendTD">
  <div id="recommendDiv">
  <a href="<%=request.getContextPath()%>/attraction/select?attId=<%=arr.getAttractionId()%>" name="attId"><img id="recommendPic1" src="<%=request.getContextPath() %>/images/<%=arr.getCity()%>/<%=arr.getAttractionName()%>/<%=recommendImageUrl[0]%>"></a></div>
   <h4 style="color:gray;margin-top:-1px;text-align:center;font-size:13px;"><i class="fas fa-paperclip"><%=arr.getClipCount() %></i>
   &nbsp <%=arr.getAttractionName()%> </h4>
 </td>
  <%if(count==4){%>
    </tr>
    <tr>
 <%count=0;}} %>
   
 </tr>
 </table>
 <br><br>
 <table>
 	<tr>
 		<td id=reviewTitleR>
 		<a href=""><h2>Review</h2></a>
 		</td>
 
 		<td id=reviewTitleQ>
 		<a href=""><h2>Q&A</h2></a>
 		</td>
 		</tr>
 		</table>
 		<table>
 		<tr>
 		<td id=reviewComment>
 		</td>
 		</tr>
 		
	 </table>
	</section>
	<script>

var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demo");
  var captionText = document.getElementById("caption");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";

}

var map;
var d = { lat: <%=attLat%>, lng: <%=attLng%> };
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: d,
    zoom: 15,
    gestureHandling: 'cooperative',
    /* mapTypeControl: true,
    mapTypeControlOptions: {
        style: google.maps.MapTypeControlStyle.HORIZONTAL_BAR
    } */
  });

  // google.maps.event.addListener(map,'click',function(event){
  //   placeMarker(event.latLng);
  // });

  var marker = new google.maps.Marker({ position: d, map: map });

}


</script>
   
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDaRHnlHeqjt3QdNCzoC3PYBnyPuvr6caE&callback=initMap"></script> 
	
<%@ include file="/views/common/footer.jsp"%>