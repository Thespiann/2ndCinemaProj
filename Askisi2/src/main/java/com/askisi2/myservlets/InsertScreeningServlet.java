package com.askisi2.myservlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "InsertScreeningServlet", value = "/InsertScreeningServlet")
public class InsertScreeningServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //retrieve data from request parameters
        String username= request.getParameter("username");//remember to search content admin id
        String movies_name= request.getParameter("movies_name");//remember to search movie id
        String cinemas_idstr= request.getParameter("cinemas_id");
        int cinemas_id=Integer.parseInt(cinemas_idstr);
        String time_date=request.getParameter("time_date");
        String id= request.getParameter("id");

/*
* <form id="insertForm" class="form-box" action="${pageContext.request.contextPath}/InsertScreeningServlet" method="POST"><br><br><br>
        <input type="text" id="username" class="input" placeholder="Enter username" required name="username">
        <input type="text" id="movies_name"  class="input" placeholder="Enter Movie's Name" required name="movies_name">
        <input type="text" id="cinemas_id" class="input" placeholder="Enter Cinema's ID" required name="cinemas_id">
        <input type="text" id="time_date" class="input" placeholder="Enter time and date " required name="time_date">
        <input type="text" id="id" class="input" placeholder="Enter ID" required name="id">

* */
        RequestDispatcher dispatcher= null;
        Connection connection= null;
        try{
            //establishing conn
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection= DriverManager.getConnection("jdbc:mysql://localhost:3306/Cinema_last", "root","root");
            //validating user
            PreparedStatement prepStatement= connection.prepareStatement("select * from content_admin where user_username = ?");
            prepStatement.setString(1,username);

            ResultSet result= prepStatement.executeQuery();
            if (result.next()){//when i have validated the user, i get the content admin id
                String contentAdminIdStr= result.getString("ID");
                int contentAdminId=Integer.parseInt(contentAdminIdStr);//when i have gotten the id, i search whether the id of screening is non-existent.If it is, continue
                prepStatement= connection.prepareStatement("select * from provoles where id = ?");
                prepStatement.setString(1,id);

                result= prepStatement.executeQuery();

                if(!result.next()) {
                    //there is no screening with this id so continue
                    //find movie id
                    prepStatement= connection.prepareStatement("select * from movies where name = ?");//i search the movie by name
                    prepStatement.setString(1,movies_name);
                    result=prepStatement.executeQuery();
                    if(result.next()){
                        String movies_idstr= result.getString("ID");//if i find the movie i set the movie id
                        int movies_id=Integer.parseInt(movies_idstr);
                        prepStatement= connection.prepareStatement("select * from cinemas where id = ?");//check if there is a cinema by this id
                        prepStatement.setInt(1,cinemas_id);
                        result=prepStatement.executeQuery();
                        if(result.next()){//if there is a cinema by that id registered
                            //then i insert data into database
                            prepStatement = connection.prepareStatement("insert into provoles(movies_id,movies_name, cinemas_id,id,content_admin_id,time_date) values(?,?,?,?,?,?)");
                            prepStatement.setInt(1,movies_id);
                            prepStatement.setString(2,movies_name);
                            prepStatement.setInt(3,cinemas_id);
                            prepStatement.setString(4,id);
                            prepStatement.setInt(5,contentAdminId);
                            prepStatement.setString(6,time_date);
                            int rows = prepStatement.executeUpdate();
                            if (rows > 0) {
                                dispatcher = request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertScreening.jsp");
                                request.setAttribute("status", "Insert successful.");
                                dispatcher.forward(request, response);
                            } else {
                                dispatcher = request.getRequestDispatcher("errorPage.jsp");
                            }
                        }else{//no such cinema
                            dispatcher=request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertScreening.jsp");
                            request.setAttribute("status","Insert failed. There is no cinema with that ID registered.");
                        }
                    }else{
                        //no such movie
                        dispatcher=request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertScreening.jsp");
                        request.setAttribute("status","Insert failed. There is no movie with that name registered.");
                    }
                }else{
                    // if screening by that id already exists, i stop the process since id is unique
                    dispatcher=request.getRequestDispatcher("/LoggedIn/ContentAdmin/InsertScreening.jsp");
                    request.setAttribute("status","Insert failed. There is already a screening with that id registered.");
                }
            }else{
                //if there is no user by that username
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
