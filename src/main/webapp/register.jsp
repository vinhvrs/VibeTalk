<!DOCTYPE>
<html>
<head>
    <title>VibeTalk Register</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta type="text/html" charset="UTF-8">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <%@ page import="java.sql.*" %>

    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        
        if(username != null && password != null)
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=UserDB; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo WHERE account = '"+username+"';");
            if (rs.next()){
    %>          
                <script>alert("Username already exists! Please choose another username!")</script>
    <%
            }
            else{
                stmt.executeUpdate("INSERT INTO userInfo VALUES('"+username+"', '"+password+"', '"+email+"', '"+phone+"')");
                response.sendRedirect("homepage.jsp");
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
                            <h3 class="text-center py-3">Register</h3>
                        </div>
                        <div class="card-body">
                            <form action="" method="post">
                                <table>
                                    <tr>
                                        <td> Username </td>
                                        <td> <input type="text" name="username" placeholder="Username" class="form-control mb-3"> </td>
                                    </tr>
                                    <tr>
                                        <td> Password </td>
                                        <td> <input type="password" name="password" placeholder="Password" class="form-control mb-3"> </td>
                                    </tr>
                                    <tr>
                                        <td> Email </td>
                                        <td> <input type="email" name="email" placeholder="Email" class="form-control mb-3"> </td>
                                    </tr>
                                    <tr>
                                        <td style="display: inline"> Phone Number </td>
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