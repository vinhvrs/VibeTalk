<!DOCTYPE>
<html>
    <head>
        <title>VibeTalk</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
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
        </script>

        <% 
            String username;
            boolean loggedIn = false;

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
        %>
    </head>
    <body>
        <div class="grid-container">
            <div id="nav-top" class="nav-top">
                <div class="left-nav">
                    <a class="nav-brand" href="homepage.jsp">
                        <img src="logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="logo" loading="lazy"> 
                        <p>VibeTalk</p>
                    </a>
                    <form class="form-inline">
                        <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchText">
                        <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                    </form>
                </div>

                <div class="center-nav" id="tab-content">
                    <a class="btn btn-outline-light" href="http://localhost:8080/VibeTalk/home.jsp#post" onclick="postTab()" style="border: 0">Post</a>
                    <a class="btn btn-outline-light" href="http://localhost:8080/VibeTalk/home.jsp#video" onclick="videoTab()"style="border: 0">Video</a>
                    <a class="btn btn-outline-light" href="http://localhost:8080/VibeTalk/home.jsp#music" onclick="musicTab()" style="border: 0">Music</a>
                </div>

                <div class="right-nav">
                    <div id="login"></div>
                </div>
                <script>
                    var loggedIn = "<%=loggedIn%>";
                    var username = "<%=username%>";
                    const loginHTML = "<a class='nav-brand' href='userInfo.jsp'>Guest</a>"
                        + "<a class='btn btn-outline-light' id='button' href='login.jsp'>Login</a>";
                    const logoutHtml = "<a class='nav-brand' href='userInfo.jsp'>" + username + "</a>"
                        + "<a class='btn btn-outline-light' id='button' href='logout.jsp'>Logout</a>";
                    if (loggedIn === "false") {
                        document.getElementById("login").innerHTML = loginHTML;
                    } else {
                        document.getElementById("login").innerHTML = logoutHtml;
                    }
                </script>
            </div>
            <div class="wall">
                <img src="imgs/wallpaper.png" id="wallpaper" alt="wallpaper" onload="setCenter(this);">
                <div class="user-info">
                    <img src="imgs/avatar.jpg" id="avatar" alt="avatar"> 
                    <p> <%=username%> </p>
                    <div class="center-nav info" id="tab-content">
                        <a class="btn btn-outline-light" href="#post" onclick="personalPost()" style="border: 0">Post</a>
                        <a class="btn btn-outline-light" href="#interview" onclick="personalInformation()"style="border: 0">Interview</a>
                        <a class="btn btn-outline-light" href="#friends" onclick="friendLists()" style="border: 0">Friends</a>
                        <a class="btn btn-outline-light" href="#pictures" onclick="personalPictures()" style="border: 0">Pictures</a>
                        <a class="btn btn-outline-light" href="#videos" onclick="personalVideos()" style="border: 0">Videos</a>
                        <a class="btn btn-outline-light" href="#music" onclick="personalMusic()" style="border: 0">Music</a>
                    </div>
                </div>
            </div>
            <div class="personalPost">
                <iframe id="userContent" src="personalPost.jsp" width="100%" height="1000px" frameborder="0" scrolling="no"></iframe>
            </div>
        </div>
        <script>
            var topDistance = document.getElementById("nav-top").clientHeight;
            var wallpaperHeight = window.innerHeight/2;
            var avatarHeight = document.getElementById("avatar").clientHeight;
            var contentPosition = document.getElementById("avatar").clientHeight + wallpaperHeight;
            console.log(window.innerWidth/1.7);
            document.getElementsByClassName("wall")[0].style.marginTop = topDistance + "px";
            document.getElementsByClassName("user-info")[0].style.marginTop = wallpaperHeight - avatarHeight/5*2 + "px";
            document.getElementsByClassName("user-info")[0].style.width = window.innerWidth/1.7 + "px";
            document.getElementsByClassName("personalPost")[0].style.marginTop = contentPosition + "px";
        </script>
    </body>
</html>