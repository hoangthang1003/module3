package controller;

import model.User;
import service.impl.UserService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@javax.servlet.annotation.WebServlet(name = "UserServlet", value = "/user")
public class UserServlet extends javax.servlet.http.HttpServlet {
    UserService userService = new UserService();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        } switch (action) {
            case "add":
                newUser(request,response);
                break;
            case "update":
                updateUser(request,response);
                break;
            case "delete":
                deleteUser(request,response);
            case "search":
                searchUser(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void searchUser(HttpServletRequest request, HttpServletResponse response) {
        String country = request.getParameter("country");
        List<User> userList = userService.findByCountry(country);
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.delete(id);
        showList(request,response);

    }

    private void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int id  = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String country = request.getParameter("country");
        User user = new User(id,name,email,country);
        userService.update(user);
        showList(request,response);
    }

    private void newUser(HttpServletRequest request, HttpServletResponse response) {
        String name =request.getParameter("name");
        String email =request.getParameter("email");
        String country =request.getParameter("country");
        User user = new User(name,email,country);
        userService.add(user);
        showList(request,response);
    }


    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        } switch (action) {
            case "add":
                showNewUser(request,response);
                break;
            case "update":
                showUpdateForm(request,response);
                break;
            default:
                showList(request,response);
                break;
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       int id = Integer.parseInt(request.getParameter("id"));
       request.setAttribute("user",  userService.findById(id));
        request.getRequestDispatcher("/view/update.jsp").forward(request,response);
    }

    private void showNewUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("view/add.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<User> userList = userService.showList();
        request.setAttribute("userList",userList);
        try {
            request.getRequestDispatcher("view/list.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

