/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vibetalk;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AddFriendServlet extends HttpServlet {
    private MakeDecision friendshipService = new MakeDecision();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int friendId = Integer.parseInt(request.getParameter("friendId"));
        String action = request.getParameter("action");

        boolean success = false;
        String message = "";

        if ("add".equals(action)) {
            success = friendshipService.addFriend(userId, friendId);
            if (success) {
                message = "Friend added successfully.";
            } else {
                message = "Failed to add friend.";
            }
        } else if ("remove".equals(action)) {
            success = friendshipService.removeFriend(userId, friendId);
            if (success) {
                message = "Friend removed successfully.";
            } else {
                message = "Failed to remove friend.";
            }
        }

        PrintWriter out = response.getWriter();
        out.println(message);
        out.close();
    }
}
