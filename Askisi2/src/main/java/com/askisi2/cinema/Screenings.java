package com.askisi2.cinema;

public class Screenings {
    private int movies_id,cinema_id, content_admin_id;
    private String movies_name,id,time_date;

    public Screenings(int movies_id,String movies_name,int cinema_id,int content_admin_id,String id,String time_date){
        this.movies_id=movies_id;
        this.movies_name=movies_name;
        this.cinema_id=cinema_id;
        this.content_admin_id= content_admin_id;
        this.id=id;
        this.time_date=time_date;
    }
}
