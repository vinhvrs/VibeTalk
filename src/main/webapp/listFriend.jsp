<!DOCTYPE html>
<html>
<head>
    <title>ListFriend</title>
    <meta type="text/html" charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <%-- <link rel="stylesheet" type="text/css" href="style.css"> --%>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <%-- <style>
        @font-face {
    font-family: 'Calibri';
    src: url();
}

body{
    margin: 0px;
    font-family: 'Calibri';
    height: 100%;
    width: 100%;
    background-color: #18191a;
}
ul{
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
    background-color: #f1f1f1;
    position: fixed;
    height: 100%;
    overflow: auto;
}
a{
    text-decoration: none;
}

.leftPanel {
    float: left;
    margin-left: 0px;
    margin-right: 0px;
    height: 100%;
    width: 25%;
    padding: 0px;
    padding-right: 0px;
    position: fixed;
}
.leftPanel button{
    width: 100%;
    height: 50px;
    background-color: #18191a;
    color: white;
    border: none;
    border-bottom: 1px solid #242526;
    font-size: 20px;
    cursor: pointer;
    transition: 0.3s;

}

.rightPanel {
    float: right;
    margin-left: 0px;
    margin-right: 0px;
    margin-top: 5%;
    height: 50%;
    padding: 0px;
    position: relative;
    display: block;
    background-color: #18191a;
}

#right-panel{
    padding: 0;
    display: flex;
    position: fixed;
    right: 2%;
    width: inherit;
}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
  }
  

  .tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
  }
  .notShow{
       display: none; 
  }

  .nav .flex-column .righPanel{
      height: 100%;
  }

    </style> --%>
    <style>
        body{
            background-color: #18191a;
        }
    </style>

    <script>
        function chatBox(){
            var boxchat = document.createElement("iframe");
            console.log("create iframe");
            boxchat.style.width = "100%";
            boxchat.src = "boxChat.jsp";
            boxchat.style.height = "200px";
            boxchat.style.backgroundColor = "#ddd";
            boxchat.style.border = "1px solid black";
            document.getElementsByTagName("body")[0].appendChild(boxchat);
            console.log("chatBox");
        }
    </script>
<head>
<body>
    <%@ page import="java.sql.*" %>
    <%
        String username = (String)session.getAttribute("username");
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
                j++;
            }             
            con.close();
    %>
     <table>
        <% 
            for (int i = 0; i < j; i++){ 
        %>
        <tr>
            <a class="btn btn-outline-dark" onclick="chatBox();" style="border: 0; color: #f3f5f6; width: 100%"><%= Friends[i] %></a>
        </tr>
        <% } %>
    </table>
    <%
        }
        catch(Exception e){
        }
    %>
</body>
</html>
