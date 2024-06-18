<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.jsp.JspContext" %>
<%@ page import="javax.servlet.http.HttpServletRequest" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link href="css/personalPost.css" rel="stylesheet">
    <meta type="text/html" charset="UTF-8">
    <style>
    body{
        background-color: #17151a;
    }
    </style>
</head>
<body>
    <script>
        function setCenter(){
            var i = 0;
            while (document.getElementsByClassName("card")[i] != null){
                var cardWidth = document.getElementsByClassName("card")[i].offsetWidth;
                var screenWidth = window.innerWidth;
                var marginLeft = (screenWidth - cardWidth) / 2;
                document.getElementsByClassName("card")[i].style.marginLeft = marginLeft + "px";
                i++;
            }
        }
        var href = parent.window.location.href;
        href = href.substring(51);
        if (href.indexOf("#") != -1)
            href = href.substring(0, href.indexOf("#"));
        
        var userID = href;
    </script>

    <% 
        String userID = session.getAttribute("userID").toString();
        String guestID = session.getAttribute("guestID").toString();
        String guestName = session.getAttribute("guestName").toString();
    %>

    <div class="containter">
        <div class="row">
            <% 
                try{
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM Post WHERE Author = '" + guestID + "';");
                    int i = 0;

                    while (rs.next()){
                        i++;
                        String postID = rs.getString("postID");
                        String date = rs.getString("Date");
                        String type = rs.getString("Type");
                        String postData = rs.getString("Data");
            %>

            <div class="card border-success mb-3 " style="max-width: 38rem;">
                <div class="card-header bg-transparent border-success"><%= guestName %></div>
                    <div class="card-body text-success">
                        <h5 class="card-title"><%=type%></h5>
                        <div class="card-content">
                            <p class="card-text"><%=postData%></p>
                            <img src="logo.jpg" class="card-img-top" alt="...">
                        </div>
                    </div>
                <div class="card-footer bg-transparent border-success">
                    <%
                        Statement getReaction = con.createStatement();
                        ResultSet Reaction = getReaction.executeQuery("SELECT * FROM Reaction LEFT JOIN userInfo ON Reaction.userID = userInfo.userID WHERE postID = '" + postID + "';");
                        while (Reaction.next()){
                            String userIDReaction = Reaction.getString("userID");
                            String comment = Reaction.getString("comment");
                            String usernameReaction = Reaction.getString("username");
                    %>
                        <div class="reaction">
                            <p><%=usernameReaction%>: <%=comment%></p>
                        </div>
                    <%
                        }
                    %>
                    <form action="comment.jsp">
                        <input type="text" name="comment" placeholder="Comment here">
                        <input type="submit" value="Comment">
                    </form>
                </div>
            </div>


            <%
                    }  
                    if (i == 0){
            %>
                            
            <div class="card border-success mb-3 " style="max-width: 38rem;">
                <div class="card-header bg-transparent border-success"><%= guestName %></div>
                <div class="card-body text-success">
                    <h5 class="card-title">No post yet</h5>
                </div>
            </div>

            <%
                    } else {
            %>
                        
            <div class="card border-success mb-3 " style="max-width: 38rem;">
                <div class="card-body text-success">
                    <h5 class="card-title">End of page</h5>
                </div>
            </div>
            <%
                    }

                    con.close();
                }
                catch(Exception e){
                    e.printStackTrace();
                }
            %>
            <script>
                setCenter();
            </script>
        </div>
    </div>


</body>

</html>