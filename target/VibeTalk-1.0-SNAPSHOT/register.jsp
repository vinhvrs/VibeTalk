<!DOCTYPE>
<html>
<head>
    <title>VibeTalk Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta type="text/html" charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/style.css">
    <%@ page import="java.sql.*" %>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        if(username != null && password != null)
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo WHERE account = '"+username+"';");
            if (rs.next()){
    %>          
                <script>alert("Username already exists! Please choose another username!")</script>
    <%
            }
            else{
                stmt.executeUpdate("INSERT INTO userInfo VALUES('"+username+"', '"+password+"', '"+email+"', '"+phone+"')");
                response.sendRedirect("home.jsp");
            }
            
            con.close();
        }
        catch(Exception e){
        }
    %>

    <style>

        #registerForm{
            padding: 0;
            background-color: #f8f9fa;
            border-radius: 5px;
            box-shadow: 0 0 5px 0 rgba(0, 0, 0, 0.1);
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

    <div class="container" style="margin-top: 8%;">
        <div class="row-3">
            <div class="col-lg-4 m-auto">
                <div class="card bg-white mt-5" id="registerForm">
                    <div class="card-title bg-primary text-white mt-3">
                        <h3 class="text-center py-3">Register</h3>
                    </div>
                    <div class="card-body">
                        <form action="" method="post">
                            <table>
                                <tr>
                                    <td class="text-dark"> Username </td>
                                    <td> <input type="text" name="username" placeholder="Username" class="form-control mb-3"> </td>
                                </tr>
                                <tr>
                                    <td class="text-dark"> Password </td>
                                    <td> <input type="password" name="password" placeholder="Password" class="form-control mb-3"> </td>
                                </tr>
                                <tr>
                                    <td class="text-dark"> Email </td>
                                    <td> <input type="email" name="email" placeholder="Email" class="form-control mb-3"> </td>
                                </tr>
                                <tr>
                                    <td class="text-dark" style="display: inline"> Phone Number </td>
                                    <td> <input type="text" name="phone" placeholder="Phone Number" class="form-control mb-3"> </td>
                                </tr>
                            </table>
                            <button class="btn btn-success mt-2" style="position: relative; margin-left: 36%" name="register" >Register</button>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
                    
</body>
</html>
