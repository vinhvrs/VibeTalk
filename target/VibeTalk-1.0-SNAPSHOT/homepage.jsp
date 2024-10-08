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
    <nav>
        <div class="navbar fixed-top navbar-dark" style="background-color:#242526; height:10%">
            <table style="margin-left: 0; width: 100%">
                <tr>
                    <td style="width: 43%">
                        <div class="form-inline" style="padding-bottom: 0px; margin-top: 4px;">
                            <a class="navbar-brand" href="homepage.jsp" style="margin-bottom:2.0%">
                                <img src="logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="logo" loading="lazy">
                                VibeTalk
                            </a>

                            <form class="form-inline" style="margin-top:0.2%; padding: 0; margin-right: 0">
                                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchText">
                                <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                            </form>
                        </div>
                    </td>
                    
                    <td style="width: 40%">
                        <a class="btn btn-outline-light" href="#post" onclick="postTab()" style="border: 0">Post</a>
                        <a class="btn btn-outline-light" href="#video" onclick="videoTab()"style="border: 0">Video</a>
                        <a class="btn btn-outline-light" href="#music" onclick="musicTab()" style="border: 0">Music</a>
                    </td>
                    
                    <td style = "display: inline-flex; width: auto">
                        <div id="login" style="margin-top:3.7%">  </div>
                    </td>

                </tr>
            </table>

            
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
    </nav>

    <div class="tab-content" style="margin-top: 4.7%">
        <div class="container-fluid">
            <div class="row">
                <div class="col-3" style="padding-left: 0px; padding-right: 0px; background-color: #18191a">
                    <nav class="nav flex-column leftPanel">
                        <a class="nav-link" href="listFriend.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Friends</button>
                        </a>
                        <a class="nav-link" href="personalVideo.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Your video</button>
                        </a>
                        <a class="nav-link" href="bookmark.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Bookmark</button>
                        </a>
                        <a class="nav-link" href="Group.jsp">
                            <button type="button" class="btn btn-outline-light" style="width: 100%; text-align: left">Groups</button>
                        </a>
                        <hr style="border: 1px solid #2c2d2e; width: 90%">
                        <h4 style="text-align: center; font-size: large; color: #f3f5f6">Recommendation</h4>
                        <iframe src="recommendation.jsp" style="border-radius:12px; margin-left: 2%" width="96%" height="39%" frameBorder="0" loading="eager"></iframe>
                    </nav>
                </div>
            
                <div class="col-6">
                    <iframe src="post_tab.jsp" id="switchTab" style="width:100%; height: 2000px; border: none"> </iframe>
                    <script>
                        function postTab(){
                            document.getElementById("switchTab").src = "post_tab.jsp";
                        }
                        function videoTab(){
                            document.getElementById("switchTab").src = "video_tab.jsp";
                        }
                        function musicTab(){
                            document.getElementById("switchTab").src = "music_tab.jsp";
                        }
                    </script>
                </div>

                <div class="col-auto" style="padding: 0; position: relative; width: auto;">
                    <nav class="nav flex-column rightPanel">
                        <table>
                            <tr>
                                <div class="playlist" style="margin-top: 10px">
                                    <iframe style="border-radius:12px" src="https://open.spotify.com/embed/artist/6eUKZXaKkcviH0Ku9w2n3V?utm_source=generator" width="100%" height="352" frameBorder="0" allowfullscreen="" allow="autoplay; clipboard-write; encrypted-media; fullscreen; picture-in-picture" loading="lazy"></iframe>
                                </div>
                            </tr>
                            <tr style="margin-top: 10px">
                                <iframe src="listFriend.jsp" style="border-radius:12px" width="100%" height="35%" frameBorder="0" loading="eager"></iframe>
                            </tr>
                        </table>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
