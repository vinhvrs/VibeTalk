<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
    crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/post.css">
    <title>Insert title here</title>
    <style>
    body{
        background-color: #17151a;
    }
    </style>
</head>
<body>
    <div class="container">
        <div class="row">
            <%@ page import="java.sql.*" %>
            <%
                int Posted = Integer.parseInt(session.getAttribute("Posted").toString());
                try{
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                    Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=WebDev; encrypt=true; trustServerCertificate=true; username=sa; password=nguyentritue;");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT COUNT(Post.postID) FROM Post;");
                    int countPost = 0;
                    if (rs.next())
                        countPost = rs.getInt(1);
                    // int newPost = countPost - Posted;
                    // if (newPost <= 0){
                    %>
                        <div class="newPost" style="display: none;">0</div>
                        <!-- <div class="card border-success mb-3 " style="max-width: 38rem;">
                            <div class="card-body text-success">
                                <h5 class="card-title">End of page</h5>
                            </div>
                        </div> -->
                    <%
                    //} else {
                        rs = stmt.executeQuery("SELECT * FROM Post LEFT JOIN userInfo ON Post.Author = userInfo.userID ORDER BY postID DESC;");
                        //rs = stmt.executeQuery("SELECT * FROM Post LEFT JOIN userInfo ON Post.Author = userInfo.userID WHERE postID = " + newPost + ";");
                        while (rs.next()){
                            Posted++;
                            String authorName = rs.getString("username");
                            String postID = rs.getString("postID");
                            String date = rs.getString("Date");
                            String type = rs.getString("Type");
                            String postData = rs.getString("Data");
            %>
                <div class="card border-success mb-3 " style="max-width: 38rem;">
                    <div class="card-header bg-transparent border-success"><%= authorName %></div>
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
                }
                catch(Exception e){
                    e.printStackTrace();
                }
                session.setAttribute("Posted", Posted);
            %>            

        </div>
    </div>
</body>
</html>
