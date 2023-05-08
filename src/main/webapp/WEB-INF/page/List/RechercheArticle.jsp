<%@ page import="miniprojet.miniprojetbo.Model.Article" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: mickl
  Date: 07/05/2023
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>

<%
    List<Article> list = (List<Article>) request.getAttribute("liste");
%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Recherche - Informations sur l’intelligence artificielle">
    <title>Recherche - Informations sur l’intelligence artificielle</title>
    <link rel="stylesheet" href="public/css/simplebar.css">
    <link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,100;0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="public/css/feather.css">
    <link rel="stylesheet" href="public/css/daterangepicker.css">
    <link rel="stylesheet" href="public/css/app-light.css" id="lightTheme" disabled>
    <link rel="stylesheet" href="public/css/app-dark.css" id="darkTheme">
</head>
<body class="vertical  dark  ">
<div class="wrapper">
    <nav class="topnav navbar navbar-light">
        <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
            <i class="fe fe-menu navbar-toggler-icon"></i>
        </button>

        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link text-muted my-2" href="#" id="modeSwitcher" data-mode="dark">
                    <i class="fe fe-sun fe-16"></i>
                </a>
            </li>
        </ul>
    </nav>

    <aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
        <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
            <i class="fe fe-x"><span class="sr-only"></span></i>
        </a>
        <nav class="vertnav navbar navbar-light">
            <div class="w-100 mb-4 d-flex">
                <a class="navbar-brand mx-auto mt-2 flex-fill text-center">
                    <strong>INFORMATION I.A</strong>
                </a>
            </div>

            <p class="text-muted nav-heading mt-4 mb-1">
                <span>Article</span>
            </p>
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="<%= request.getContextPath() %>/AddArticle">
                        <i class="fe fe-plus-circle fe-16"></i>
                        <span class="ml-3 item-text">Ajouter</span>
                    </a>
                </li>
                <li class="nav-item w-100">
                    <a class="nav-link" href="<%= request.getContextPath() %>/PageListArticle">
                        <i class="fe fe-layers fe-16"></i>
                        <span class="ml-3 item-text">Listes</span>
                    </a>
                </li>
            </ul>
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                <li class="nav-item w-100">
                    <a class="nav-link" href="<%=request.getContextPath()%>/LogoutAdmin">
                        <i class="fe fe-log-out fe-16"></i>
                        <span class="ml-3 item-text">Se deconnecter</span>
                    </a>
                </li>
            </ul>
        </nav>
    </aside>
    <main role="main" class="main-content">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="row align-items-center mb-4">
                        <div class="col">
                            <h2 class="h5 page-title">Recherche dans les informations</h2>
                        </div>
                    </div>
                    <form class="form-inline mr-auto searchform text-muted" action="<%= request.getContextPath() %>/search" method="get">
                        <input class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted" type="search" name="search" placeholder="Faire une recherche..." aria-label="Search">
                    </form>
                    <div class="row my-4">
                        <div class="col-md-9">
                            <%for(Article p: list) {%>
                            <div class="card shadow mb-4">
                                <div class="card-header">
                                    <strong class="card-title"><%=p.getTitre()%></strong>
                                </div>
                                <div class="card-body">
                                    <div class="row align-items-center mb-4">
                                        <div class="col">
                                            <div class="mb-2"><%=p.getContenu()%></div>
                                            <small class="text-muted"><%=p.getDatepublication()%></small>
                                        </div>
                                        <div class="col-auto">
                                            <a href="<%=request.getContextPath()%>/PageModification?id=<%=p.getIdArticle()%>">
                                      <span class="circle circle-sm bg-light" title="Modifier cet article">
                                        <i class="fe fe-edit"></i>
                                      </span>
                                            </a>
                                        </div>
                                        <div class="col-auto">
                                            <a href="<%=request.getContextPath()%>/DeleteArticle?id=<%=p.getIdArticle()%>">
                                      <span class="circle circle-sm bg-light" title="Supprimer cet article">
                                        <i class="fe fe-delete"></i>
                                      </span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</div>
<script src="public/js/jquery.min.js"></script>
<script src="public/js/popper.min.js"></script>
<script src="public/js/moment.min.js"></script>
<script src="public/js/bootstrap.min.js"></script>
<script src="public/js/simplebar.min.js"></script>
<script src='public/js/daterangepicker.js'></script>
<script src='public/js/jquery.stickOnScroll.js'></script>
<script src="public/js/tinycolor-min.js"></script>
<script src="public/js/config.js"></script>
<script src="public/js/apps.js"></script>

<script async src="https://www.googletagmanager.com/gtag/js?id=UA-56159088-1"></script>
<script>
    $('.input-phoneus').mask('(+261) 00-000-00');
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