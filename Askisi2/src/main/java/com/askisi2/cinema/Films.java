package com.askisi2.cinema;


public class Films{
    private int filmId, filmLength;
    private String filmTitle,filmCategory,filmDescription, filmDirector;

    public Films(){

    }

    public Films(int filmId, String filmTitle, String filmCategory, String filmDescription,String filmDirector, int filmLength){
        this.filmId =  filmId;
        this.filmTitle = filmTitle;
        this.filmCategory = filmCategory;
        this.filmDescription = filmDescription;
        this.filmDirector= filmDirector;
        this.filmLength= filmLength;
    }

    public void setFilmId(int filmId) { this.filmId = filmId;}
    public void setFilmTitle(String filmTitle) { this.filmTitle = filmTitle;}
    public void setFilmCategory(String filmCategory) { this.filmCategory = filmCategory;}
    public void setFilmDescription(String filmDescription) { this.filmDescription = filmDescription;}

    public int getFilmId(){return filmId;}
    public String getFilmTitle(){return filmTitle;}
    public String getFilmCategory(){return filmCategory;}
    public String getFilmDescription(){ return filmDescription;}


    public int getFilmLength() {
        return filmLength;
    }

    public void setFilmLength(int filmLength) {
        this.filmLength = filmLength;
    }

    public String getFilmDirector() {
        return filmDirector;
    }

    public void setFilmDirector(String filmDirector) {
        this.filmDirector = filmDirector;
    }
}