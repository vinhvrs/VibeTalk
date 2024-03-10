<!DOCTYPE>
<html>
<head>
    <title>VibeTalk</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-grid.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-reboot.css">
    <link rel="stylesheet" href="css/homepage.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta type="text/html" charset="UTF-8">
    <style>
        body{
            margin: 0px;
            font-family: Arial, Helvetica, sans-serif;
            height: 100%;
            width: 100%;
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
    </style>
</head>

<body>
    <% 
        String username = (String) session.getAttribute("username");
        boolean loggedIn = false;
        if (username == null){
            username = "Guest";
            loggedIn = false;
        } else {
            username = username;
            loggedIn = true;
        }
    %>
    <div class="navbar">
        <div class="navbar fixed-top navbar-dark" style="background-color:#242526; height:9%">
            <div class="logo-VibeTalk form-inline">
                <a class="navbar-brand" href="homepage.jsp" style="margin-bottom:2.7%">
                    <img src="logo.jpg" width="30" height="30" class="d-inline-block align-top" alt="logo" loading="lazy">
                    VibeTalk
                </a>
                <form class="form-inline" style="margin-top:0.2%">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" name="searchText">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>

            <div id="login" style="margin-bottom:0.9%;">
            </div>

            <script>
                var loggedIn = "<%=loggedIn%>";
                var username =  "<%=username%>";
                const loginHTML = "<a class='navbar-brand' href='userInfo.jsp'>Guest</a>"
                                + "<a class='btn btn-outline-light' href='login.jsp'>Login</a>";
                const logoutHtml = "<a class='navbar-brand' href='userInfo.jsp'>" + username +"</a>"
                                + "<a class='btn btn-outline-light' href='logout.jsp'>Logout</a>";
                if (loggedIn == "false"){
                    document.getElementById("login").innerHTML = loginHTML;
                } else {
                    document.getElementById("login").innerHTML = logoutHtml;    
                }
            </script>
        </div>
    </div>
    <div class="" style="margin-top: 3.3%">
        <div class="container-fluid">
            <div class="row">
                <div class="col-2" style="margin-left: 0px; padding-left: 0px">
                    <nav class="nav flex-column leftPanel">
                        <a class="nav-link" href="#">Active</a>
                        <a class="nav-link" href="#">Link</a>
                        <a class="nav-link" href="#">Link</a>
                    </nav>
                </div>
                <div class="col-7" style="background-color:yellow">
                    What is Lorem Ipsum?
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.

Why do we use it?
It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


Where does it come from?
Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.

Where can I get some?
There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
                </div>
                <div class="col-auto" style="margin-left: 0px; padding-left: 0px">
                    <nav class="nav flex-column rightPanel">
                        <a class="nav-link" href="#">Active</a>
                        <a class="nav-link" href="#">Link</a>
                        <a class="nav-link" href="#">Link</a>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
