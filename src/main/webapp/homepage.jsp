<!DOCTYPE>
<html>
<head>
    <title>VibeTalk</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/homepage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta type="text/html" charset="UTF-8">
    <style>
        body{
            margin: 0px;
            font-family: Arial, Helvetica, sans-serif;
            height: 100%;
            width: 100%;
        }
        ul{
            list-style-type: none;
            margin: 0;
            padding: 0;
            width: 100%;
            background-color: #f1f1f1;
            position: fixed;
            height: 100%;
            overflow: auto;
        }
        a{
            text-decoration: none;
        }
    </style>
</head>

<body>
    <% 
        String username = (String) session.getAttribute("username");
        boolean loggedIn = false;
        if (username == null){
            username = "Guest";
            loggedIn = false;
        } else {
            username = username;
            loggedIn = true;
        }
    %>
    <div class="navbar">
        <div class="navbar fixed-top navbar-dark" style="background-color:#242526; height:9%">
            <div class="logo-VibeTalk form-inline">
                <a class="navbar-brand" href="homepage.jsp" style="margin-bottom:2.7%">
                    <img src="logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="logo" loading="lazy">
                    VibeTalk
                </a>
                <form class="form-inline" style="margin-top:0.2%">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchText">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>

            <div id="login" style="margin-bottom:0.9%;">
            </div>

            <script>
                var loggedIn = "<%=loggedIn%>";
                var username =  "<%=username%>";
                const loginHTML = "<a class='navbar-brand' href='userInfo.jsp'>Guest</a>"
                                + "<a class='btn btn-outline-light' href='login.jsp'>Login</a>";
                const logoutHtml = "<a class='navbar-brand' href='userInfo.jsp'>" + username +"</a>"
                                + "<a class='btn btn-outline-light' href='logout.jsp'>Logout</a>";
                if (loggedIn == "false"){
                    document.getElementById("login").innerHTML = loginHTML;
                } else {
                    document.getElementById("login").innerHTML = logoutHtml;    
                }
            </script>
        </div>
    </div>
    <div class="" style="margin-top: 3.3%">
        <div class="container-fluid">
            <div class="row">
                <div class="col-3" style="padding-left: 0px; padding-right: 0px; background-color: #18191a">
                    <nav class="nav flex-column leftPanel">
                        <a class="nav-link" href="userInfo.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Username</button>
                        </a>
                        <a class="nav-link" href="saved.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Saved</button>
                        </a>
                        <a class="nav-link" href="bookmark.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Bookmark</button>
                        </a>
                    </nav>
                </div>
                <div class="col-6 middlePanel" >
                    <div class="container">
                        <div class="row">
                            <div class="col-8">
                                <div class="card" style="margin-top: 10px; margin-bottom: 10px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Author</h5>
                                        <img src="logo.jpg" class="card-img-top" alt="...">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <form action="post.jsp">
                                            <button type="submit" class="btn btn-primary">Go somewhere</button>
                                            <input type="textarea" name="comment" id="comment" placeholder="Comment">
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-8">
                                <div class="card" style="margin-top: 10px; margin-bottom: 10px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Author</h5>
                                        <img src="logo.jpg" class="card-img-top" alt="...">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <form action="post.jsp">
                                            <button type="submit" class="btn btn-primary">Go somewhere</button>
                                            <input type="textarea" name="comment" id="comment" placeholder="Comment">
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-8">
                                <div class="card" style="margin-top: 10px; margin-bottom: 10px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Author</h5>
                                        <img src="logo.jpg" class="card-img-top" alt="...">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <form action="post.jsp">
                                            <button type="submit" class="btn btn-primary">Go somewhere</button>
                                            <input type="textarea" name="comment" id="comment" placeholder="Comment">
                                        </form>
                                    </div>
                                </div>
                            </div>

                            <div class="col-8">
                                <div class="card" style="margin-top: 10px; margin-bottom: 10px;">
                                    <div class="card-body">
                                        <h5 class="card-title">Author</h5>
                                        <img src="logo.jpg" class="card-img-top" alt="...">
                                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                        <form action="post.jsp">
                                            <button type="submit" class="btn btn-primary">Go somewhere</button>
                                            <input type="textarea" name="comment" id="comment" placeholder="Comment">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-auto" style="margin-left: 0px; padding-left: 0px">
                    <nav class="nav flex-column rightPanel">
                        <a class="nav-link" href="#">Active</a>
                        <a class="nav-link" href="#">Link</a>
                        <a class="nav-link" href="#">Link</a>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
