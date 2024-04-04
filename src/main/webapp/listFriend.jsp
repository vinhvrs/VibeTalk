<!DOCTYPE>
<html>
<head>
    <title>ListFriend</title>
    <meta type="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/homepage.css">
    <style>
        body{
            background-color: #18191a;
        }
    </style>
    <%@ page import="java.sql.*" %>
        
    <%
        String username = request.getParameter("username");
        String Friends[] = new String[100];
        if (username != null)
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=UserDB; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT username FROM userFriend WHERE userID = (SELECT userID FROM userInfo WHERE username = "+username+");");
            while (rs.next()){
                Friends[rs.getRow()] = rs.getString(1);
            } 
            
            con.close();
        }
        catch(Exception e){
        }
    %>
<head>
<body>
    <table>
        <% for (int i = 0; i < Friends.length; i++){ %>
        <tr>
            <button class="btn btn-outline-dark" style="border: 0; color: #f3f5f6; width: 100%"><%= Friends[i] %></button>
        </tr>
        <% } %>
    </table>

</body>
</html>