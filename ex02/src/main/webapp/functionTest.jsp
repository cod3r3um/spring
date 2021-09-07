<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		(function print(a) {
			console.log("적시실행" +a);
		})(5);
		
		
			function b() { console.log("b");}
			function c() { console.log("c");}
			return {a:a, b:b, c:c}
		}) ();
		
		// print(5);
	</script>

</body>
</html>