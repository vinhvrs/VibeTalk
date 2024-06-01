<!DOCTYPE html>
<html>
<head>
    <title>Change Password</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="JavaScript/userInfo.js"></script>
    <link rel="stylesheet" href="css/style.css">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta type="text/html" charset="UTF-8">
    <%@ page import="java.sql.*" %>

</head>
    <% 
        String username;
        String userID = (String) session.getAttribute("userID");
        session.setAttribute("userID", userID);
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

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmNewPassword = request.getParameter("confirmNewPassword");
        String password = "";

        if (oldPassword != null && newPassword != null && confirmNewPassword != null)
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            try (Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;")) {
                try (Statement stmt = con.createStatement()){
                    ResultSet rs = stmt.executeQuery("SELECT password FROM userInfo WHERE username = '" + username + "';");
                    if (rs.next()){
                        password = rs.getString("password");

                        if (password.equals(oldPassword)) {
                            if (newPassword.equals(confirmNewPassword)) {
                                stmt.executeUpdate("UPDATE userInfo SET password = '"+newPassword+"' WHERE username = '"+username+"';");
                                out.println("<script>alert('Password updated successfully')</script>");
                                response.sendRedirect("userInfo.jsp?userID="+userID);
                            } else {
                                out.println("<script>alert('New password and confirm new password do not match')</script>");
                            }
                        } else {
                            out.println("<script>alert('Old password is incorrect')</script>");
                        }
                    }
                }
            }
        }
        catch(Exception e){
        }
    %>

    <style>
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
<body>
    <nav class="navbar bg-dark fixed-top">
        <div class="navbar-brand d-inline text-white">
            <a class="nav-brand text-white" href="home.jsp">
                <img src="logo.jpg" width="30" height="30" class="d-inline-block align-top ml-2" alt="logo">
                <p class="d-inline mt-3">VibeTalk</p>
            </a>
        </div>

        <form class="form-inline d-inline ml-1 text-white" id="searchForm">
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

        <div class="nav-brand ml-2" id="userDetail">
        </div>

        <div class="dropdown bg-dark float-lg-end" id="login">
            
        </div>

        <script>
            var loggedIn = "<%=loggedIn%>";
            var username = "<%=username%>";
            var userID = "<%=userID%>";
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

    <div class="container mt-5">
        <form id="changePasswordForm" action="" method="POST">
            <div class="form-group">
                <label for="oldPassword">Old password</label>
                <input type="password" class="form-control" id="oldPassword" name="oldPassword" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New password</label>
                <input type="password" class="form-control" id="newPassword" name="newPassword" required>
            </div>
            <div class="form-group">
                <label for="confirmNewPassword">Confirm new password</label>
                <input type="password" class="form-control" id="confirmNewPassword" name="confirmNewPassword" required>
            </div>
            <button class="btn btn-primary">Update password</button>
            <button type="button" class="btn btn-secondary">I forgot my password</button>
        </form>
    </div>
    <script>
        var topDistancce = document.getElementsByClassName("navbar")[0].offsetHeight;
        document.body.style.paddingTop = topDistancce + 20 + "px";
    </script>
    
    

</body>
</html>