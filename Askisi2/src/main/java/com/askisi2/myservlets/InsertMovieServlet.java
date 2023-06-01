package com.askisi2.myservlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "InsertMovieServlet", value = "/InsertMovieServlet")
public class InsertMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve data from request parameters
        String username= request.getParameter("username");
        String name= request.getParameter("name");
        String type= request.getParameter("type");
        String content=request.getParameter("content");
        String director= request.getParameter("director");
        String strlength= request.getParameter("length");
        int length=Integer.parseInt(strlength);

        RequestDispatcher dispatcher= null;
        Connection connection= null;
        try{
            //establishing conn
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
            PreparedStatement prepStatement= connection.prepareStatement("select * from content_admin where user_username = ?");
            prepStatement.setString(1,username);

            ResultSet result= prepStatement.executeQuery();
            if (result.next()){
                String contentAdminIdStr= result.getString("ID");
                int contentAdminId=Integer.parseInt(contentAdminIdStr);
                prepStatement=connection.prepareStatement("select * from movies where name= ?");
                prepStatement.setString(1,name);
                result=prepStatement.executeQuery();
                if(!result.next())
                {
                    prepStatement = connection.prepareStatement("insert into movies(name,content,length,type,director,content_admin_id) values(?,?,?,?,?,?)");
                    prepStatement.setString(1, name);
                    prepStatement.setString(2, content);
                    prepStatement.setInt(3, length);
                    prepStatement.setString(4, type);
                    prepStatement.setString(5, director);
                    prepStatement.setInt(6, contentAdminId);
                    int rows = prepStatement.executeUpdate();
                    if (rows > 0) {
                        dispatcher = request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertMovie.jsp");
                        request.setAttribute("status", "Insert successful.");
                        dispatcher.forward(request, response);
                    } else {
                        dispatcher = request.getRequestDispatcher("errorPage.jsp");
                    }
                }else{
                    dispatcher=request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertMovie.jsp");
                    request.setAttribute("status","Insert failed. There is already a movie with that name registered.");
                }
            }else{
                dispatcher=request.getRequestDispatcher("index.jsp");
                request.setAttribute("status","Insert failed. There is no such username for a content admin.");
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
