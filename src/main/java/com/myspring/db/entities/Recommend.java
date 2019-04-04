package com.myspring.db.entities;


import javax.persistence.*;

@Entity
@Table(name="recom")
public class Recommend {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name="book_id")
    private Long book_id;

    @Column(name="user_id")
    private Long user_id;

    public Recommend(Long book_id, Long user_id) {
        this.book_id = book_id;
        this.user_id = user_id;
    }
    public Recommend() {

    }


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getBook_id() {
        return book_id;
    }

    public void setBook_id(Long book_id) {
        this.book_id = book_id;
    }

    public Long getUser_id() {
        return user_id;
    }

    public void setUser_id(Long user_id) {
        this.user_id = user_id;
    }
}
