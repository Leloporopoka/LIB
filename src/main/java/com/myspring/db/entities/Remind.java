package com.myspring.db.entities;

import javax.persistence.*;

@Entity
@Table(name="remind")
public class Remind {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @ManyToOne(optional = false, cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "user_id")
    private Users user;

    @ManyToOne(optional = false, cascade = {CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinColumn(name = "book_id")
    private Book book;

    @Column(name = "availabilty")
    private boolean availabilty;

    Remind(){

    }

    public Remind(Users user, Book book) {
        this.user = user;
        this.book = book;
        this.availabilty=false;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public boolean isAvailabilty() {
        return availabilty;
    }

    public void setAvailabilty(boolean availabilty) {
        this.availabilty = availabilty;
    }
}
