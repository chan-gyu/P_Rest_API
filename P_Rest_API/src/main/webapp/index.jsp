<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="${path }/resources/js/jquery-3.6.0.min.js"></script>
</head>
<body>
<header>

<nav class="navbar navbar-expand-sm bg-light">
  <!-- Links -->
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="#">Link 1</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 2</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Link 3</a>
    </li>
  </ul>
</nav>
	
	<div>
		<textarea id="books" cols="150" rows="3" name="books"readonly></textarea>
		<button type="button" onclick="booksView()">조회</button>
	</div>
	
	<div>
		<input type="number" id="userid" name="id">id
		<input type="text" id="username" name="name">name
		<input type="text" id="author" name="author">author
		<input type="number" id="price" name="price">price
		<button type="button" onclick="enroll()">등록</button>
	</div>
	<br>
	<div>
		<input type="number" id="Did" name="id">Delete Id
		<input type="text" id="DName" name="name">Delete Name
		<button type="button" onclick="deleteBook()">삭제</button>
	</div>
	<br>
	<div>
		<input type="number" id="Pid" name="id">Put id
		<input type="text" id="PName" name="name">Put name
		<input type="text" id="Pauthor" name="author">Put author
		<input type="number" id="Pprice" name="price">Put price
		<button type="button" onclick="putBook()">수정</button>
	</div>
	

<script>
		function booksView(){
			
			var viewarea = document.getElementById("books");
			
			$.ajax({
				url:"${path}/books",
				type:"GET",
				success:function(data){
					viewarea.innerText=data;
				}
			})	
		}

		function enroll(){
			var id = document.getElementById("userid").value;
			var name = document.getElementById("username").value;
			var author = document.getElementById("author").value;
			var price = document.getElementById("price").value;
			console.log(id,name,author,price);
			
			$.ajax({
				url:"${path}/add",
				type:"POST",
				dataType:'json',
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringify({
					id:id,
					name:name,
					author:author,
					price:price
				}),
				success:function(data){
					console.log(data);
				}
			})
		}
		
		function deleteBook(){
			var id = document.getElementById("Did").value;
			var name = document.getElementById("DName").value;
			console.log(id, name);
			
			$.ajax({
				url:"${path}/delete/"+id+"/"+name,
				type:"DELETE",
				dataType:"text",
				success: function(data){
					console.log(data);
				}
				
			})
		}
		
		function putBook(){
			var id = document.getElementById("Pid").value;
			var name = document.getElementById("PName").value;
			var author = document.getElementById("Pauthor").value;
			var price = document.getElementById("Pprice").value;
			console.log(id,name,author,price);
			
			$.ajax({
				url:"${path}/update/"+id,
				type:"PUT",
				dataType:'json',
				contentType:"application/json;charset=UTF-8",
				data:JSON.stringify({
					id:id,
					name:name,
					author:author,
					price:price
				}),
				success:function(data){
					console.log(data);
				}
			})
		}
		
</script>
</header>
</body>

</html>