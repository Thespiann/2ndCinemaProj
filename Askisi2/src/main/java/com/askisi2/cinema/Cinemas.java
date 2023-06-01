package com.askisi2.cinema;

public final class Cinemas {
    private String cinemaName;
    private int cinemaNumberOfSeats;
    private int cinemaId;
    private String cinemaIs3d;
    public Cinemas(String cinemaName, int cinemaNumberOfSeats , int cinemaId , String cinemaIs3d){
        this.cinemaName = cinemaName;
        this.cinemaNumberOfSeats = cinemaNumberOfSeats;
        this.cinemaId = cinemaId;
        this.cinemaIs3d = cinemaIs3d;
    }
    public String getCinemaName(){
        return cinemaName;
    }

    public int getCinemaNumberOfSeats(){
        return cinemaNumberOfSeats;
    }
    public int getCinemaId(){
        return cinemaId;
    }

    public String getCinemaIs3d(){
        return cinemaIs3d;
    }




}