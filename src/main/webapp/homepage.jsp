<!DOCTYPE>
<html>
<head>
    <title>VibeTalk</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta type="text/html" charset="UTF-8">
</head>

<body>
    <% 
        String username = request.getParameter("username");
        String password = request.getParameter("password");
    %>
    <p>Username: <%= username %></p>
    <p>Password: <%= password %></p>





</body>
</html>