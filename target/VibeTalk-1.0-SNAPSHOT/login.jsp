<!DOCTYPE>

    <head>
        <meta type = "text/html" charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <%@ page import="java.sql.*" %>
        
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username != null && password != null)
            try{
                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=UserDB; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo WHERE account = '"+ username +"'AND passcode = '"+ password +"';");
                if (rs.next()){
                    //if (rs.getString(1).equals(username) && rs.getString(2).equals(password)){
                        session.setAttribute("username", username);
                        response.sendRedirect("homepage.jsp");
                    } else { %>
                        <script>alert("Invalid username or password")</script>
                    <%
                    }
                
                con.close();
            }
            catch(Exception e){
            }
        %>
        
    </head>

    <body>
        <div class="navbar navbar-expand-lg border-bottom bg-white sticky-top shadow-sm justify-content-between navbar-light">
            <div class="container">
                <a href="homepage.jsp" class="navbar-brand text-dark">VibeTalk</a>
                <ul class="navbar-nav">
                    <li class="nav-item"><a href="homepage.jsp" class="nav-link text-dark">Home</a></li>
                    <li class="nav-item"><a href="login.jsp" class="nav-link text-dark">Login</a></li>
                    <li class="nav-item"><a href="register.jsp" class="nav-link text-dark">Register</a></li>
                </ul>
            </div>
        </div>


        <div class="container">
            <div class="row-3">
                <div class="col-lg-4 m-auto">
                    <div class="card bg-white mt-5">
                        <div class="card-title bg-primary text-white mt-3">
                            <h3 class="text-center py-3">Login</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                <input type="text" name="username" placeholder="Username" class="form-control mb-3">
                                <input type="password" name="password" placeholder="Password" class="form-control mb-3">
                                <button class="btn btn-success mt-2" style="position: relative; left: 38%" name="login">Login</button>
                                <p class="text-center mt-3">Don't have an account? <a style="text-decoration: none" href="register.jsp">Register</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>

