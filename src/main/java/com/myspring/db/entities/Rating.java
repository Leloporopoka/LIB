package com.myspring.db.entities;

import javax.persistence.*;

@Entity
@Table(name="rating")
public class Rating {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id")
    private Long id;


    @Column(name="user_id")
    private Long user_id;


    @Column(name="book_id")
    private Long book_id;


    @Column(name="rate")
    private double rate;

    public Rating(Long user_id, Long book_id, int rate) {
        this.user_id = user_id;
        this.book_id = book_id;
        this.rate = rate;
    }

    public Rating(){

    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }

    public Long getBook_id() {
        return book_id;
    }

    public void setBook_id(Long book_id) {
        this.book_id = book_id;
    }

    public double getRate() {
        return rate;
    }

    public void setRate(double rate) {
        this.rate = rate;
    }
}
