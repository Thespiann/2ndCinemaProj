package com.askisi2.myservlets;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "InsertCinemaServlet", value = "/InsertCinemaServlet")
public class InsertCinemaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve data from request parameters
        String idstr= request.getParameter("id");
        int id= Integer.parseInt(idstr);
        String name= request.getParameter("name");
        String seats= request.getParameter("seats");
        String is3D=request.getParameter("is3D");
        RequestDispatcher dispatcher= null;
        Connection connection= null;
        try{
            //establishing conn
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
            PreparedStatement prepStatement= connection.prepareStatement("select * from cinemas where id = ?");
            prepStatement.setInt(1,id);

            ResultSet result= prepStatement.executeQuery();

            if(!result.next()) {
                prepStatement = connection.prepareStatement("insert into cinemas(id,name,seats,3D) values(?,?,?,?)");
                prepStatement.setInt(1, id);
                prepStatement.setString(2,name);
                prepStatement.setString(3,seats);
                prepStatement.setString(4, is3D);

                int rows = prepStatement.executeUpdate();
                if (rows > 0) {
                    dispatcher = request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertCinema.jsp");
                    request.setAttribute("status", "Insert successful.");
                    dispatcher.forward(request, response);
                } else {
                    dispatcher = request.getRequestDispatcher("errorPage.jsp");
                }
            }else{
                dispatcher=request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertCinema.jsp");
                request.setAttribute("status","Insert failed. There is already a cinema with that id registered.");
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

