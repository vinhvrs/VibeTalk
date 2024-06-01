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
    <script src="JavaScript/userInfo.js"></script>
    <%@ page import="java.sql.*" %>
    <%@ page import="javax.servlet.jsp.JspContext" %>
    <%@ page import="javax.servlet.http.HttpServletRequest" %>
    
</head>
<body>
    <% 
        String findName = session.getAttribute("searchText").toString();
        if (findName == ""){
            findName = "xxxxx";
        }
        String User[] = new String[100];
        String GuestID[] = new String[100];
        int j = 0;
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo WHERE username LIKE '%"+ findName +"%';");
            while (rs.next()){
                User[j] = rs.getString("username");
                GuestID[j] = rs.getString("userID");
                j++;
            }             
            con.close();
        }
        catch(Exception e){
        }
    %>

    <table>
        <% 
            for (int i = 0; i < j; i++){
        %>
        <tr>
            <td> 
                <a class="btn btn-outline-dark" onclick="var GuestID = '<%= GuestID[i] %>'; userDetail(GuestID);" style="border: 0; color: #f3f5f6; width: 100%"><img src="img/avatar.png" alt="Avatar" style="width: 50px; height: 50px;">  <%= User[i] %></a>
            </td>
        </tr>
        <% } %>

    </table>
</body>
</html>