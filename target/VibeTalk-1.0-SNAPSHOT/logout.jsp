<!DOCTYPE>
<html>
    <head>
        <meta type = "text/html" charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>

    <body>
        <% 
            session.invalidate();
            response.sendRedirect("login.jsp");
        %>
     
    </body>
</html>
