<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 파일 업로드</title>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<input type="file" name="upfile" id="upfile" multiple/>
	<button id="up-btn">업로드</button>
	<div id="preview"></div>
	<script>
	//사진 미리보기 기능
		$(function(){
			$("#upfile").change(function(){
				$("#preview").html("");
				$.each($(this)[0].files,function(i,item){
					var reader=new FileReader();
					reader.onload=function(e){
					var img=$("<img>").attr({"src":e.target.result}).css({"width":"200px","height":"200px"});
					$("#preview").append(img);
					}
					reader.readAsDataURL(item);
				})
				/* var reader=new FileReader();
				reader.onload=function(e){
					var img=$("<img>").attr({"src":e.target.result}).css({"width":"200px","height":"200px"});
					$("#preview").html(img);
					
					
				}
				reader.readAsDataURL($(this)[0].files[0]); */
			});
			$("#up-btn").on("click",function(){
				//ajax를 통한 파일전송을 할때
				//FormData() 객체를 이용
				var fd=new FormData();
				$.each($("#upfile")[0].files,function(i,item){
					fd.append("file"+i,item);
				})
				fd.append("upfile",$("#upfile")[0].files[0]);
				
				$.ajax({
					url:"<%=request.getContextPath()%>/ajaxFile",
					data:fd,
					type:"post",
					processData:false,
					contentType:false,
					success:function(data){
						console.log(data);
						$("#preview").html("");
						$("#upfile").val("");
					}
				})
			});
		});
	
	
	</script>






</body>
</html>