function personalPost() {
    document.getElementById("userContent").src = "personalPost.jsp";
}

function personalInformation() {
    document.getElementById("userContent").src = "personalInformation.jsp";
}

function friendLists() {
    document.getElementById("userContent").src = "listFriend.jsp";
}

function personalPictures() {
    document.getElementById("userContent").src = "personalPictures.jsp";
}

function personalVideos() {
    document.getElementById("userContent").src = "personalVideos.jsp";
}

function personalMusic() {
    document.getElementById("userContent").src = "personalMusic.jsp";
}

function Normalize() {
    var topDistance = document.getElementById("nav-top").clientHeight;
    var wallpaperHeight = window.innerHeight / 2;
    var avatarHeight = document.getElementById("avatar").clientHeight;
    var contentPosition = document.getElementById("avatar").clientHeight + wallpaperHeight;
    document.getElementsByClassName("wall")[0].style.marginTop = topDistance + "px";
    document.getElementsByClassName("user-info")[0].style.marginTop = wallpaperHeight - avatarHeight / 5 * 2 + "px";
    document.getElementsByClassName("user-info")[0].style.width = window.innerWidth / 1.7 + "px";
    document.getElementsByClassName("personalPost")[0].style.marginTop = contentPosition + "px";
}



function userDetail(friendID){
    var url = "userInfo.jsp?userID=" + friendID;
    console.log(url);
    window.parent.location.href = url;
}

function Infomation(){
    var url = window.location.href;
    var userID = url.split("?")[1].split("=")[1];
    console.log(userID);
}

function checkFriend(){
    
}