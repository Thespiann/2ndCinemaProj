package com.askisi2.myservlets;

import com.askisi2.cinema.Films;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import java.util.ArrayList;
import java.io.*;
import java.util.*;

@WebServlet(name = "AvailableMoviesServlet", value = "/available-movies-servlet")
public class AvailableMoviesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Films> films= retrieveAvailableMovies();
        request.setAttribute("Movies",films);
        RequestDispatcher dispatcher= request.getRequestDispatcher("LoggedIn/ContentAdmin/AvailableMovies.jsp");
        dispatcher.forward(request,response);
    }
    private List<Films> retrieveAvailableMovies(){
        //Making the empty list
        List<Films> films= new ArrayList<>();
        //establishing conn
        Connection connection= null;
        try{
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
        PreparedStatement prepStatement= connection.prepareStatement("select * from movies");

        ResultSet results=prepStatement.executeQuery();
        while(results.next()) {// getting attributes for each film
            int filmId=results.getInt("ID");
            String filmTitle= results.getString("NAME");
            String filmCategory= results.getString("TYPE");
            String filmDescription= results.getString("CONTENT");
            String filmDirector=results.getString("DIRECTOR");
            int filmLength= results.getInt("LENGTH");
            //making object
            Films film= new Films(filmId,filmTitle, filmCategory,filmDescription,filmDirector, filmLength);
            //adding it to the list
            films.add(film);
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
        return films;
    }
}
