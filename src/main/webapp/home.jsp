<!DOCTYPE html>
<html>
<head>
    <title>VibeTalk</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta type="text/html" charset="UTF-8">
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
    <script src="JavaScript/homepage.js"></script> 
    <script>
        function resizeIframe(obj) {
            obj.style.height = obj.contentWindow.document.documentElement.scrollHeight + 'px';
        }
    </script>

</head>

<body>
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
            <a class="btn btn-outline-light" href="#post" onclick="postTab()" style="border: 0">Post</a>
            <a class="btn btn-outline-light" href="#video" onclick="videoTab()"style="border: 0">Video</a>
            <a class="btn btn-outline-light" href="#music" onclick="musicTab()" style="border: 0">Music</a>
        </div>

        <div class="right-nav">
            <div id="login"></div>
        </div>
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


    <div class="wrapper" id = "wrapper-content">
        <div class="nav-side">
            <div class="flex-column">
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
            </div>
        </div>    

        <div class="post-content" id ="content">
            <iframe src="post_tab.jsp" id="switchTab" width="100%" onload="resizeIframe(this)" scrolling="no" style="border: none"></iframe>
        </div>
        <div class="music-chat" id ="music-chat">
            <button id ="Music-Expand" onclick = "Resize()"></button>
            <iframe id ="music-frame" height="80px" width="300px" src="https://open.spotify.com/embed/artist/6eUKZXaKkcviH0Ku9w2n3V?utm_source=generator" frameBorder="0" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture" loading="lazy"></iframe>
            <%-- <iframe id ="chat-frame" class="chat-frame" width="300px" src="listFriend.jsp" frameBorder="0" loading="eager"></iframe> --%>
            <div id="chat-frame" class="chat-frame">
                <%@ page import="java.sql.*" %>
                <%
                    String Friends[] = new String[100];
                    if (username != null)
                    try{
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery("SELECT username FROM userInfo LEFT JOIN Friends ON userInfo.userID = Friends.friendID WHERE Friends.userID = (SELECT userID FROM userInfo WHERE userInfo.username = '"+username+"');");
                        int j = 0;
                        while (rs.next()){
                            Friends[j] = rs.getString("username");
                            session.setAttribute("friend", Friends[j]);
                            j++;
                        }             
                        con.close();
                        %>
                        <table>
                            <% 
                                for (int i = 0; i < j; i++){ 
                            %>
                            <tr>
                                <a class="btn btn-outline-dark" onclick="var friendName = '<%= Friends[i] %>'; chatBox(friendName);" style="border: 0; color: #f3f5f6; width: 100%"><%= Friends[i] %></a>
                            </tr>
                            <% } %>
                        </table>
                        <%
                    }
                    catch(Exception e){
                    }
                %>
            </div>
        </div>
       
    </div>
</body>
<script> Normalize(); </script>
</html>
