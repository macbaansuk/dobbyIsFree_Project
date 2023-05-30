<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

    <title>Login</title>
    <style>
        body {
            background-color: #f2f2f2;
        }

        .login-form {
            width: 300px;
            margin: 0 auto;
            margin-top: 100px;
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
        }

        .login-input {
            width: 100%;
            margin-bottom: 10px;
            padding: 10px;
            box-sizing: border-box;
        }

        .login-btn {
            width: 100%;
            background-color: #4CAF50;
            color: #fff;
            padding: 10px;
            border: none;
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="login-form">
    <form action="" method="post">
        <h2>관리자 로그인</h2>
        <input type="text" name="id" placeholder="ID" class="login-input" required>
        <input type="password" name="pwd" placeholder="Password" class="login-input" required>
        <button type="submit" class="login-btn">로그인</button>
    </form>
</div>
</body>


<script >
   let msg = "${msg}";
    if (msg=="login_ERR") alert("로그인 정보를 다시 확인해주세요.")

</script>
</html>
