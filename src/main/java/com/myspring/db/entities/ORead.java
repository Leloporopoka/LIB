package com.myspring.db.entities;

import javax.persistence.*;

@Entity
@Table(name="oread")
public class ORead {


    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name="book_id")
    private Long book_id;

    @Column(name="file_name",length = 1025)
    private String file_name;

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

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public ORead(Long book_id, String file_name) {
        this.book_id = book_id;
        this.file_name = file_name;
    }

    public ORead(){ }

}
