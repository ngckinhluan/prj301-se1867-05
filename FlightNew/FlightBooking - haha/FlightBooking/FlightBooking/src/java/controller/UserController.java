package controller;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebServlet(name = "UserController", urlPatterns = {"/UserController", "/AdminUser"})
public class UserController extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user") == null) {
                response.sendRedirect("home");
                return;
            }

        if (action == null) {
            // Default action if 'action' parameter is not provided
            action = "list";
        }

        switch (action) {
            case "list":
                listUsers(request, response);
                break;
            case "add":
                showAddForm(request, response);
                break;
            case "detail":
                showUserDetail(request, response);
                break;
            case "delete":
                banUser(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        

        switch (action) {
            case "add":
                addUser(request, response);
                break;
            case "update":
                updateUser(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action parameter");
        }
    }

    // List users 
    private void listUsers(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setAttribute("userList", new UserDAO().getAllUsers());

        request.getRequestDispatcher("/admin/AdminUser.jsp").forward(request, response);

    }

    // Show add user form 
    private void showAddForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Show user detail 
    private void showUserDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Add a user 
    private void addUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    // Delete a user 
    private void banUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        int status = Integer.parseInt(request.getParameter("status"));
        
        new UserDAO().updateUserStatus(username, status);
        response.sendRedirect("AdminUser");
    }

    // Show update user form (Empty method, provide the actual code here)
    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        request.setAttribute("user", new UserDAO().getUserByUsername(username));
        request.getRequestDispatcher("/admin/AddEditUser.jsp").forward(request, response);
    }

    // Update a user (Empty method, provide the actual code here)
    private void updateUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int role = Integer.parseInt(request.getParameter("role"));
        int status = Integer.parseInt(request.getParameter("status"));

        User user = new UserDAO().getUserByUsername(username);

        user.setFullName(fullName);
        user.setEmail(email);
        user.setDob(dob);
        user.setGender(gender);
        user.setRole(role);
        user.setStatus(status);
        
        new UserDAO().updateUser(user);
        
        response.sendRedirect("AdminUser");
    }
}
