
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="/WEB-INF/views/include.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Android & Smart</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Fira+Sans|Roboto:300,400|Questrial|Satisfy">
<link rel="stylesheet" type="text/css" href="plugins/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="plugins/mdl/material.min.css" type="text/css">
<link rel="stylesheet" href="css/login.css" type="text/css">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-6 col-md-4 col-md-offset-4">
            <h1 class="text-center login-title" style="color:white;">ANDROID & SMART</h1>
            <div class="account-wall">
                <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
                    alt="">
                <form:form class="form-signin" action="login" method="post" commandName="usuario">
                <input type="text" class="form-control" placeholder="Email" required autofocus name="correo">
                <input type="password" class="form-control" placeholder="Password" required name="contraseña">
                <button class="btn btn-lg btn-primary btn-block" type="submit">
                    Ingresar</button>
                </form:form>
            </div>
        </div>
    </div>
</div>
  </body>
<script type="text/javascript">

</script>
<script src="plugins/jquery/jquery-3.2.1.slim.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/mdl/material.min.js"></script>
</body>
</html>