<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="BIG5">
	<title>Insert title here</title>
    <link rel="stylesheet" href="../../vendors/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet type" href="./css/index_backstage.css">
</head>
<body>
	<div class="container-fluid login-container">
        <div class="row">
            <div class="col login_col">
                <div class="row header">
                    <div class="col-4 img-div">
                        <img src="./images/white_LOGO.png">
                    </div>
                    <div class="col-8 img-div">
                        <p>後臺管理系統</p>
                    </div>
                </div>
                <div class="row account-row">
                    <div class="col">
                        <p>帳號:</p><input type="text"></input>
                        <p>密碼:</p><input type="text"></input>
                    </div>
                </div>
                <div class="row forget-row">
                    <div class="col-10">
                        <button type="button" class="btn btn-warning forget-btn">登入</button>
                        <button type="button" class="btn btn-warning forget-btn">忘記密碼</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>


    <script src="../../vendors/jquery/jquery-3.5.1.min.js"></script>
    <script src="../../vendors/popper/popper.min.js"></script>
    <script src="../../vendors/bootstrap/js/bootstrap.min.js"></script>
    <script src="./js/index_backstage.js"></script>
</body>
</html>