/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.vibetalk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MakeDecision {
    private static Map<Integer, User> users = new HashMap<>();
    private static Map<Integer, List<Integer>> friendships = new HashMap<>();

    static {
        // Simulating some initial users
        users.put(1, new User(1, "Alice"));
        users.put(2, new User(2, "Bob"));
        users.put(3, new User(3, "Charlie"));
        users.put(4, new User(4, "David"));
        users.put(5, new User(5, "Emma"));
    }

    public User getUserById(int id) {
        return users.get(id);
    }

    public boolean addFriend(int userId, int friendId) {
        if (!users.containsKey(userId) || !users.containsKey(friendId)) {
            return false;
        }

        if (!friendships.containsKey(userId)) {
            friendships.put(userId, new ArrayList());
        }

        List<Integer> userFriendships = friendships.get(userId);
        if (userFriendships.contains(friendId)) {
            return false; // Already friends
        }

        userFriendships.add(friendId);
        return true;
    }

    public boolean removeFriend(int userId, int friendId) {
        if (!users.containsKey(userId) || !users.containsKey(friendId)) {
            return false;
        }

        List<Integer> userFriendships = friendships.getOrDefault(userId, new ArrayList());
        if (userFriendships.contains(friendId)) {
            userFriendships.remove(Integer.valueOf(friendId));
            return true;
        }

        return false; // No such friend relationship found
    }

    public List<User> getFriends(int userId) {
        List<User> friendsList = new ArrayList<>();
        List<Integer> friendIds = friendships.getOrDefault(userId, new ArrayList());

        for (int friendId : friendIds) {
            User friend = users.get(friendId);
            if (friend != null) {
                friendsList.add(friend);
            }
        }

        return friendsList;
    }
}
