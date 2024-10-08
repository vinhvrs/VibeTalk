<!DOCTYPE>
<html>
    <head>
        <title>VibeTalk</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/userInfo.css">
        <link rel="stylesheet" href="css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta type="text/html" charset="UTF-8">
        <script src="JavaScript/userInfo.js"></script>
        <script>
            function setCenter(obj){
                obj.style.height = window.innerHeight/2 + "px";
                obj.style.width = window.innerWidth/1.4 + "px";
                obj.style.marginLeft = (window.innerWidth - obj.width) / 2 + "px";
            }
            function resizeIframe(obj) {
                obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
            }
        </script>

        <%@ page import="java.sql.*" %>
        <%@ page import="javax.servlet.jsp.JspContext" %>
        <%@ page import="javax.servlet.http.HttpServletRequest" %>
        <% 
            pageContext.setAttribute("javax.servlet.forward.request_uri", request.getRequestURI());
            String hash = (String) request.getAttribute("javax.servlet.forward.request_url");
            if (hash == null){
                hash = (String) request.getQueryString();
                hash = hash.substring(7);
            }

            String username = "Guest";
            String guestName = "";
            String userID = (String) session.getAttribute("userID");
            boolean loggedIn = false;

            String guestID = hash;
            session.setAttribute("guestID", guestID);

            if (session.getAttribute("username") == null){
                username = "Guest";
            } else {
                username = (String) session.getAttribute("username");
                if (username == null){
                    username = "Guest";
                    loggedIn = false;
                } else {
                    username = username;
                    loggedIn = true;
                }
            }

            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT username FROM userInfo WHERE userID = '"+ guestID +"';");
                if (rs.next()){
                    guestName = rs.getString("username");
                    session.setAttribute("guestName", guestName);
                } 
                con.close();
            }
            catch(Exception e){
            }
        %>
        <style>
            body{
                background-color: #17151a;
            }
            a {
            text-decoration: none;
            }
            a:hover{
            text-decoration: none;
            }
            .my-dropdown-toggle::after {
            content: none;
        }
    </style>
    </head>
    <body>
        <nav class="navbar bg-dark fixed-top" style="padding-top: 0px;padding-bottom: 0px;padding-left: 0px;">
        <div class="navbar-brand d-inline text-white">
            <a class="nav-brand text-white" href="home.jsp">
                <img src="logo.png" id="logo" width="70" height="70" class="d-inline-block align-top ml-1" alt="logo">
                <p id="brandname" class="d-inline-block align-middle">VibeTalk</p>
            </a>
        </div>

            <form class="form-inline d-inline ml-1 mt-3 text-white" id="searchForm">
                <input class="form-control mr-sm-2 d-inline" type="text" placeholder="Search" aria-label="Search" id="searchText"
                    name="searchText">
                <button class="btn btn-outline-light my-2 my-sm-0 d-inline" type="submit" onclick="Search();">Search</button>
            </form>

            <div class="space"></div>

            <div class="navbar d-inline text-white" id="tab-content">
                <a class="btn btn-outline-light" href="home.jsp#post" style="border: 0">Post</a>
                <a class="btn btn-outline-light" href="home.jsp#video" style="border: 0">Video</a>
                <a class="btn btn-outline-light" href="home.jsp#music" style="border: 0">Music</a>
            </div>

            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>
            <div class="space"></div>

            <script>
                var form=document.getElementById("searchForm");
                function submitForm(event){
                    event.preventDefault();
                }
                form.addEventListener('submit', submitForm);
            </script>

            <% 
                String searchText = request.getParameter("searchText");
                session.setAttribute("searchText", searchText);
            %>

            <a class="nav-brand" href="#notification">
                <img src="bell.png" height="30" width="30" alt="notification" loading="lazy">
            </a>

            <div class="nav-brand ml-2" id="userDetail"></div>

            <div class="dropdown bg-dark float-lg-end" id="login"></div>

            <script>
                var loggedIn = "<%=loggedIn%>";
                var username = "<%=username%>";
                const space = "<div class='space d-inline'></div>";
                const image = "<img src='imgs/avatar.jpg' alt='avatar' style='width: 40px; height: 40px; border-radius: 50%; margin-left: 30px; margin-right: 10px'>";
                const loginHTML = "<a class='nav-brand d-inline mr-4' href=''>Guest</a>" + space
                                + "<a class='btn btn-outline-light' id='button' href='login.jsp'>Login</a>";
                const logoutHtml = "<a class='nav-brand' onclick = 'userDetail(userID);'>" + image +"   "+ username + "</a>";
                const button =  "<button class='btn btn-secondary dropdown-toggle my-dropdown-toggle navbar-light' type='button' id='userAction' data-bs-toggle='dropdown'"
                                + " aria-haspopup='true' aria-expanded='false'> "
                                +    "<span class='navbar-toggler-icon'></span>"
                                + "</button>"
                                + "<div class='dropdown-menu dropdown-menu-end bg-secondary' aria-labelledby='userAction'>"
                                +    "<a class='dropdown-item' type='button' href='changePassword.jsp'>Change Password</button>"
                                +    "<a class='dropdown-item' type='button' href='logout.jsp'>Logout</button>"
                                + "</div>";
                if (loggedIn === "false") {
                    document.getElementById("login").innerHTML = loginHTML;
                } else {
                    document.getElementById("userDetail").innerHTML = logoutHtml;
                    document.getElementById("login").innerHTML = button;
                }
            </script>
        </nav>

        <div class="grid-container">
            <div class="wall">
                <img src="imgs/wallpaper.png" id="wallpaper" alt="wallpaper" onload="setCenter(this);">
                <div class="user-info">
                    <img src="imgs/avatar.jpg" id="avatar" alt="avatar"> 
                    <p id="username"> <%=guestName%> </p>
                    <%
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                        Statement getFriend = con.createStatement();
                        ResultSet friend = getFriend.executeQuery("SELECT * FROM Friends WHERE userID = '"+ guestID +"';");
                        boolean friendCheck = false;
                        while (friend.next()){
                            String friendID = friend.getString("friendID");
                            if (friendID.equals(userID)){
                                friendCheck = true;
                            }
                        }
                        if (!friendCheck){
                            friend = getFriend.executeQuery("SELECT * FROM Friends WHERE friendID = '"+ guestID +"';");
                            while (friend.next()){
                                String friendID = friend.getString("userID");
                                if (friendID.equals(userID)){
                                    friendCheck = true;
                                }
                            }
                        }
                        if (friendCheck){
                            out.println("<div id='friendCheck'>");
                            out.println("<button class='btn btn-outline-light' style='border: 0; display: inline' >Friend</button>");
                            out.println("</div>");
                        } else {
                            out.println("<div id='friendCheck'>");
                            out.println("<button class='btn btn-outline-light' style='border: 0; display: inline' >Add Friend</button>");
                            out.println("</div>");    
                        }
                        con.close();
                    %>
                    <script>
                        var guestID = "<%=guestID%>";
                        guestID = parseInt(guestID);
                        var userID = ${userID};
                        var friendCheck = document.getElementById("friendCheck");
                        if (guestID == userID){
                            friendCheck.style.display = "none";
                        }
                    </script>
                    <div class="center-nav info" id="tab-content">
                        <a class="btn btn-outline-light" href="#post" onclick="personalPost()" style="border: 0">Post</a>
                        <a class="btn btn-outline-light" href="#friends" onclick="friendLists()" style="border: 0">Friends</a>
                        <a class="btn btn-outline-light" href="#pictures" onclick="personalPictures()" style="border: 0">Pictures</a>
                        <a class="btn btn-outline-light" href="#videos" onclick="personalVideos()" style="border: 0">Videos</a>
                        <a class="btn btn-outline-light" href="#music" onclick="personalMusic()" style="border: 0">Music</a>
                    </div>
                </div>
            </div>
            <div class="personalPost">
                <iframe id="userContent" src="personalPost.jsp" frameborder="0" scrolling="no" onload="resizeIframe(this);"></iframe>
            </div>
        </div>
        <script>
            var topDistance = document.getElementsByClassName("navbar")[0].clientHeight;
            var wallpaperHeight = window.innerHeight / 2;
            var avatarHeight = document.getElementById("avatar").clientHeight;
            var contentPosition = document.getElementById("avatar").clientHeight + wallpaperHeight;
            document.getElementsByClassName("wall")[0].style.marginTop = topDistance + "px";
            document.getElementsByClassName("user-info")[0].style.marginTop = wallpaperHeight - avatarHeight / 5 * 2 + "px";
            document.getElementsByClassName("user-info")[0].style.width = window.innerWidth / 1.7 + "px";
            document.getElementsByClassName("personalPost")[0].style.marginTop = contentPosition + "px";

            document.getElementById("userContent").style.width = window.innerWidth/1.4;
            document.getElementById("userContent").style.marginLeft = (window.innerWidth - parseInt(document.getElementById("userContent").style.width)) / 2;
            document.getElementById("userContent").style.height = window.innerHeight;

            if (window.location.hash == '#friends'){
                friendLists();
            } else if (window.location.hash == '#interview'){
                personalInformation();
            } else if (window.location.hash == '#pictures'){
                personalPictures();
            } else if (window.location.hash == '#videos'){
                personalVideos();
            } else if (window.location.hash == '#music'){
                personalMusic();
            } else {
                personalPost();
            }
        </script>
    </body>
</html>