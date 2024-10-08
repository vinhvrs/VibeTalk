<!DOCTYPE>
<html>
    <head>
        <meta type = "text/html" charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
        <title>Login page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
        crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="css/style.css">
        <script src="JavaScript/CheckLogin.js"></script>
        <%@ page import="java.sql.*" %>
        
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String userID = "";
           
            if (username != null && password != null)
            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo WHERE username = '"+ username +"'AND password = '"+ password +"';");
                if (rs.next()){
                        session.setAttribute("username", username);
                        userID = rs.getString("userID");
                        session.setAttribute("userID", userID);
                        response.sendRedirect("home.jsp#post");
                    } else { %>
                        <script>alert("Invalid username or password")</script>
                    <%
                    }
                con.close();
            }
            catch(Exception e){
            }
        %>
        <script>
            function login(){
                var userID = '${userID}';
                console.log(userID);
            }
        </script>

        <style>
        body{
            <%-- background-color: #333031; --%>
        }

        #loginForm{
            padding: 0;
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.1);
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
            <div class="space"></div>

            <div class="navbar d-inline text-white bg-dark" id="tab-content">
                <a class="btn btn-outline-light" href="home.jsp" style="border: 0">Home</a>
                <a class="btn btn-outline-light" href="login.jsp" style="border: 0">Login</a>
                <a class="btn btn-outline-light" href="register.jsp" style="border: 0">Register</a>
            </div>
        </nav>

        <div class="container" style="margin-top: 10%;">
            <div class="row-3">
                <div class="col-lg-4 m-auto">
                    <div class="card bg-white mt-5 rounded" id="loginForm">
                        <div class="card-title bg-primary text-white mt-3">
                            <h3 class="text-center py-3">Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                <input type="text" name="username" placeholder="Username" class="form-control mb-3">
                                <input type="password" name="password" placeholder="Password" class="form-control mb-3">
                                <button class="btn btn-success mt-2" style="position: relative; left: 38%" name="login" >Login</button>
                                <p class="text-center mt-3">Don't have an account? <a style="text-decoration: none" href="register.jsp">Register</a></p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
