/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.gwainblog;

import java.util.Date;

/**
 *
 * @author kerch
 */
public class Article {

    private int id;
    private String title;
    private String shortDescription;
    private String content;
    private String author;
    private int amountOfView;
    private int amountOfVouting;
    private Date date;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getShortDescription() {
        return shortDescription;
    }

    public void setShortDescription(String shortDescription) {
        this.shortDescription = shortDescription;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getAmountOfView() {
        return amountOfView;
    }

    public void setAmountOfView(int amountOfView) {
        this.amountOfView = amountOfView;
    }

    public int getAmountOfVouting() {
        return amountOfVouting;
    }

    public void setAmountOfVouting(int amountOfVouting) {
        this.amountOfVouting = amountOfVouting;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    

}
