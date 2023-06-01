package com.askisi2.myservlets;
import java.sql.*;
import java.io.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.util.Objects;

@WebServlet(name = "RegistrationServlet", value = "/RegistrationServlet")

public class RegistrationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data from request parameters
        String username = request.getParameter("regUsername");
        String firstname= request.getParameter("firstName");
        String email = request.getParameter("email");
        String password = request.getParameter("regPassword");
        RequestDispatcher dispatcher= null;
        Connection connection= null;
        try{
            //establishing conn
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
            PreparedStatement prepStatement= null;
            Timestamp create_time= new Timestamp(System.currentTimeMillis());

            //If the username is already taken
            prepStatement= connection.prepareStatement("select * from user where username = ?");
            prepStatement.setString(1,username);
            ResultSet result= prepStatement.executeQuery();
            if (result.next()){
                dispatcher=request.getRequestDispatcher("index.jsp");
                request.setAttribute("status","Register failed. Username is already taken, please try again.");
                dispatcher.forward(request,response);
            }else{
                //If the password is imadmin123, then the user i create will be an admin

                if(password.equals("ImAdmin123")){
                    prepStatement= connection.prepareStatement("insert into user(username, email, password, create_time, role) values (?, ?, ?, ?, ?)");
                    prepStatement.setString(1,username);
                    prepStatement.setString(2,email);
                    prepStatement.setString(3,"ImAdmin123");
                    prepStatement.setTimestamp(4, create_time);
                    prepStatement.setString(5,"ADMIN");
                    int rows= prepStatement.executeUpdate();
                    if(rows>0){

                        prepStatement= connection.prepareStatement("insert into ADMINS(NAME, user_username) values ( ?, ?)");
                        prepStatement.setString(1,firstname);
                        prepStatement.setString(2,username);
                        rows=prepStatement.executeUpdate();
                        if(rows>0){//if values have been inserted to both the admin and user table
                            dispatcher=request.getRequestDispatcher("LoggedIn/loggedAdmin.jsp");//i forward the admin to the logged in page
                        }else{
                            dispatcher=request.getRequestDispatcher("errorPage.jsp");//if the values werent inserted to the admin table i forward the admin to my error page
                        }
                    }else{
                        dispatcher=request.getRequestDispatcher("errorPage.jsp");//if the values werent inserted to the user table i forward the admin to my error page
                    }
                    dispatcher.forward(request, response);//forwarding
                }

                //if the password is imcontentadmin123, the user i create will be a content admin
                if(password.equals("ImContentAdmin123")){
                    //user table insert statement
                    prepStatement= connection.prepareStatement("insert into user(username, email, password, create_time, role) values (?, ?, ?, ?, ?)");
                    //setting values
                    prepStatement.setString(1,username);
                    prepStatement.setString(2,email);
                    prepStatement.setString(3,"ImContentAdmin123");
                    prepStatement.setTimestamp(4, create_time);
                    prepStatement.setString(5,"CONTENT_ADMIN");
                    int rows= prepStatement.executeUpdate();
                    if(rows>0){//if tthe user table was updated, i add values into the content admin table
                        prepStatement= connection.prepareStatement("insert into CONTENT_ADMIN(NAME, user_username) values ( ?, ?)");
                        prepStatement.setString(1,firstname);
                        prepStatement.setString(2,username);
                        rows=prepStatement.executeUpdate();
                        if(rows>0){
                            dispatcher=request.getRequestDispatcher("LoggedIn/loggedContentAdmin.jsp");//i forward the content admin to the logged in page
                        }else{//if values havent been inserted to the content admin table i forward the cont admin to the error page
                            dispatcher=request.getRequestDispatcher("errorPage.jsp");
                        }
                    }else{//if values havent been added to the user table
                        dispatcher=request.getRequestDispatcher("errorPage.jsp");
                    }
                    dispatcher.forward(request, response);
                }
                //if password is anything else
                if(password!=null){
                    //user table insert statement
                    prepStatement= connection.prepareStatement("insert into user(username, email, password, create_time, role) values (?, ?, ?, ?, ?)");
                    //setting values
                    prepStatement.setString(1,username);
                    prepStatement.setString(2,email);
                    prepStatement.setString(3,password);
                    prepStatement.setTimestamp(4, create_time);
                    prepStatement.setString(5,"CUSTOMER");
                    int rows= prepStatement.executeUpdate();
                    if(rows>0){//if the user table was updated, i add values into the customer table
                        prepStatement= connection.prepareStatement("insert into CUSTOMERS(NAME, user_username) values ( ?, ?)");
                        prepStatement.setString(1,firstname);
                        prepStatement.setString(2,username);
                        rows=prepStatement.executeUpdate();
                        if(rows>0){
                            dispatcher=request.getRequestDispatcher("LoggedIn/loggedCustomer.jsp");//i forward the customer to the logged in page
                        }else{//if values havent been inserted to the customer table i forward the customer to the error page
                            dispatcher=request.getRequestDispatcher("errorPage.jsp");
                        }
                    }else{//if values havent been added to the user table
                        dispatcher=request.getRequestDispatcher("errorPage.jsp");
                    }
                    dispatcher.forward(request, response);
                }else{
                    dispatcher=request.getRequestDispatcher("errorPage.jsp");
                    dispatcher.forward(request, response);
                }

            }

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
        //String logedinPage="loggedCustomer.jsp";
        // redirect to the login page
        //response.sendRedirect(logedinPage);
    }
}
