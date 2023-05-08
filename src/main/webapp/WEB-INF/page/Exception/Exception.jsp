<%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 07/05/2023
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Exception - Informations sur l’intelligence artificielle">
    <title>Exception INFORMATION Intelligence artificielle</title>
    <link rel="stylesheet" href="css/simplebar.css">
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/feather.css">
    <link rel="stylesheet" href="css/daterangepicker.css">
    <link rel="stylesheet" href="css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="css/app-dark.css" id="darkTheme">
</head>
<body class="dark ">
<div class="wrapper vh-100">
    <div class="align-items-center h-100 d-flex w-50 mx-auto">
        <div class="mx-auto text-center">
            <h1 class="mb-1 text-muted font-weight-bold">OOPS!</h1>
            <h6 class="mb-3 text-muted"><%= request.getAttribute("message")%></h6>
            <a href="<%=request.getContextPath()%>/AddArticle" class="btn btn-lg btn-primary px-5">Revenir</a>
        </div>
    </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/moment.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src='js/daterangepicker.js'></script>
<script src='js/jquery.stickOnScroll.js'></script>
<script src="js/tinycolor-min.js"></script>
<script src="js/config.js"></script>
<script src="js/apps.js"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script>
    window.dataLayer = window.dataLayer || [];

    function gtag()
    {
        dataLayer.push(arguments);
    }
    gtag('js', new Date());
    gtag('config', 'UA-56159088-1');
</script>
</body>
</html>
</body>
</html>
