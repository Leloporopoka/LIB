package com.myspring.db.entities;
import javax.persistence.*;
import java.util.Date;


@Entity
@Table(name="reserve_books")
public class Reserve_Books {


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

    @Column(name="date")
    private Date date;

    public Reserve_Books() {
    }

    public Reserve_Books(Users user, Book book, Date date) {
        this.user = user;
        this.book = book;
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }
}
