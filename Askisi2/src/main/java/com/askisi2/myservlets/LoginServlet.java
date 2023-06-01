package com.askisi2.myservlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "LoginServlet", value = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from request parameters
        String username= request.getParameter("loginUsername");
        String password= request.getParameter("loginPassword");
        RequestDispatcher dispatcher= null;
        Connection connection= null;

        try{
            //establishing conn
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
            PreparedStatement prepStatement= connection.prepareStatement("select * from user where username = ? and password = ?");
            prepStatement.setString(1,username);
            prepStatement.setString(2, password);


            ResultSet result= prepStatement.executeQuery();
            if (result.next()){
                if(password.equals("ImContentAdmin123")){
                    dispatcher=request.getRequestDispatcher("LoggedIn/loggedContentAdmin.jsp");
                }if(password.equals("ImAdmin123")){
                    dispatcher=request.getRequestDispatcher("LoggedIn/loggedAdmin.jsp");
                }else if(!(password.equals("ImContentAdmin123")||password.equals("ImAdmin123"))){
                    dispatcher=request.getRequestDispatcher("LoggedIn/loggedCustomer.jsp");
                }
                String loggedInUsername = result.getString("username");
                request.setAttribute("username", loggedInUsername);
            }else{
                dispatcher=request.getRequestDispatcher("index.jsp");
                request.setAttribute("status","Login failed. There is no such username that matches this password.");
            }
            dispatcher.forward(request,response);
        }catch(Exception e){
            throw new RuntimeException(e);
        }finally{
            try {
                if(connection!= null){
                    connection.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }


}
