let currentTab = "post_tab.jsp";
let boxchat = document.createElement("div");

function postTab() {
    document.getElementById("content").innerHTML = "<iframe src=\"post_tab.jsp\" id=\"switchTab\" width=\"100%\" onload=\"resizeIframe(this)\" scrolling=\"no\" style=\"border: none\"></iframe>";
    //document.getElementById("switchTab").src = "post_tab.jsp";
    currentTab = "post_tab.jsp";
}
function videoTab() {
    document.getElementById("content").innerHTML = "<iframe src=\"video_tab.jsp\" id=\"switchTab\" width=\"100%\" onload=\"resizeIframe(this)\" scrolling=\"no\" style=\"border: none\"></iframe>";
    //document.getElementById("switchTab").src = "video_tab.jsp";
    currentTab = "video_tab.jsp";
}
function musicTab() {
    document.getElementById("content").innerHTML = "<iframe src=\"music_tab.jsp\" id=\"switchTab\" width=\"100%\" onload=\"resizeIframe(this)\" scrolling=\"no\" style=\"border: none\"></iframe>";
    //document.getElementById("switchTab").src = "music_tab.jsp";
    currentTab = "music_tab.jsp";
}

function Resize() {
    if (document.getElementById("music-frame").clientHeight === 160) {
        document.getElementById("music-frame").style.height = "80px";
    } else {
        document.getElementById("music-frame").style.height = "160px";
    }

    var PanelHeight = document.getElementById("music-chat").clientHeight;
    var musicHeight = document.getElementById("music-frame").clientHeight;
    document.getElementById("chat-frame").style.height = PanelHeight - musicHeight + "px";
}

function closeIframe() {
    console.log("Close");
    if (boxchat != null) {
        boxchat.remove();
    }
}

function chatBox(Friend) {
    boxchat.id = "chat-box";
    boxchat.style.width = "300px";
    boxchat.style.height = "400px";
    boxchat.style.backgroundColor = "#ddd";
    boxchat.style.border = "1px solid black";
    boxchat.style.borderRadius = "10px";
    boxchat.style.position = "fixed";
    boxchat.style.bottom = "0";
    boxchat.style.right = "20px";
    boxchat.style.zIndex = "1000";
    ChatFrame(Friend);

    document.body.appendChild(boxchat);
}

function ChatFrame(Friend) {
    boxchat.innerHTML = `<link rel=\"stylesheet\" href=\"css/boxchat.css\">`;

    boxchat.innerHTML+=`<table class="chat-box">
                            <th id=\"chatHeader\">` + Friend + `<button id=\"close\" onclick = \"closeIframe();\">x</button> </th>
                            <tr>
                                <td>
                                    <iframe id=\"chatBox\"></iframe>
                                </td>
                            </tr>
                            <tr id=\"chatForm\">
                                <td>
                                <form id=\"messageForm\">
                                    <input type=\"textarea\" height=\"90%\" name=\"comment\" id=\"comment\" placeholder=\"Comment\">
                                    <button id=\"send\" type=\"submit\" onclick=\"ChatHandler();\" class=\"btn btn-primary\">Send</button>
                                </form>
                                </td>
                            </tr>
                        </table>`;
}

function ChatHandler() {
    console.log("FUCK ME UP");
    document.getElementById('messageForm').addEventListener('submit', function (event) {
        event.preventDefault();

        var comment = document.getElementById('comment').value;
        var chatBox = document.getElementById('chatBox');

        // Send the message
        chatBox.contentWindow.postMessage(comment, '*');

        // Display the sent message in the chat box
        var p = document.createElement('p');
        p.textContent = 'Sent: ' + comment;
        chatBox.contentDocument.body.appendChild(p);

        // Clear the input field
        document.getElementById('comment').value = '';
    });

    window.addEventListener('message', function (event) {
        // Receive the message
        var message = event.data;

        // Display the received message in the chat box
        var chatBox = document.getElementById('chatBox');
        var p = document.createElement('p');
        p.textContent = 'Received: ' + message;
        chatBox.contentDocument.body.appendChild(p);
    });
} 
                            
function Normalize() {
    var navHeight = document.getElementById("nav-top").clientHeight;
    document.getElementById("music-chat").style.top = navHeight + "px";
    document.getElementById("content").style.top = navHeight + "px";
}

function setCenter(obj) {
    var width = window.innerWidth;
    var height = window.innerHeight;
    var objWidth = obj.clientWidth;
    var objHeight = obj.clientHeight;
    alert(objWidth);
    obj.style.left = (width - objWidth) / 2 + "px";
    obj.style.top = (height - objHeight) / 2 + "px";

}

function LoadMore() {
    var content = document.getElementById("content");
    var newContent = document.createElement("div");
    newContent.style.padding = "0";
    newContent.style.top = "0";
    newContent.innerHTML = "<iframe src=\"" + currentTab + "\" id=\"switchTab\" width=\"100%\" onload=\"resizeIframe(this)\" scrolling=\"no\" style=\"border: none\"> </iframe>";
    content.appendChild(newContent);
}

window.onscroll = function () {
    var position = window.scrollY + window.innerHeight;
    var maxHeight = window.document.body.scrollHeight;
    if (position === maxHeight) {
        LoadMore();
    }
};
