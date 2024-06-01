<!DOCTYPE html>
<html>
<head>
    <title>ListFriend</title>
    <meta type="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/listFriend.css">    
    <script src="JavaScript/userInfo.js"></script>
<head>
<body>
    <%@ page import="java.sql.*" %>
    <%
        String username = (String)session.getAttribute("username");
        String guestName = (String)session.getAttribute("guestName");
        String userID = (String)session.getAttribute("userID");
        String Friends[] = new String[100];
        String ID[] = new String[100];
        if (username != null)
        try{
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM userInfo LEFT JOIN Friends ON userInfo.userID = Friends.friendID WHERE Friends.userID = (SELECT userID FROM userInfo WHERE userInfo.username = '"+guestName+"');");
            int j = 0;
            while (rs.next()){
                Friends[j] = rs.getString("username");
                ID[j] = rs.getString("userID");
                session.setAttribute("friend", Friends[j]);
                j++;
            }  
            rs = stmt.executeQuery("SELECT * FROM userInfo LEFT JOIN Friends ON userInfo.userID = Friends.userID WHERE Friends.friendID = (SELECT userID FROM userInfo WHERE userInfo.username = '"+guestName+"');");
            while (rs.next()){
                Friends[j] = rs.getString("username");
                ID[j] = rs.getString("userID");
                session.setAttribute("friend", Friends[j]);
                j++;
            }
            con.close();
    %>
     <table>
        <% 
            for (int i = 0; i < j - (j%2); i++){ 
        %>
        <tr>
            <td> 
                <a class="btn btn-outline-dark" onclick="var friendID = '<%= ID[i] %>'; userDetail(friendID);" style="border: 0; color: #f3f5f6; width: 100%"><img src="img/avatar.png" alt="Avatar" style="width: 50px; height: 50px;"><%= Friends[i] %></a>
            </td>
            <% 
                if (i+1 < j - (j%2)){
                    i++;
            %>
            <td>                     
                <a class="btn btn-outline-dark" onclick="var friendID = '<%= ID[i] %>'; userDetail(friendID);" style="border: 0; color: #f3f5f6; width: 100%"><img src="img/avatar.png" alt="Avatar" style="width: 50px; height: 50px;"><%= Friends[i] %></a>
            </td>
            <%  } %>
        </tr>
        <%  
            } 
            if (j%2 == 1){
        %>
            <tr>
                <td> 
                    <a class="btn btn-outline-dark" onclick="var friendID = '<%= ID[j-1] %>'; userDetail(friendID);" style="border: 0; color: #f3f5f6; width: 100%"><img src="img/avatar.png" alt="Avatar" style="width: 50px; height: 50px;"><%= Friends[j-1] %></a>
                </td>
                <td></td>
            </tr>
        <% 
            }     
        %>
    </table>
    <%
        }
        catch(Exception e){
        }
    %>
</body>
</html>
