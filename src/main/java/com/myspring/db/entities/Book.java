package com.myspring.db.entities;
import org.hibernate.annotations.Type;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="book")
public class Book {

    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name="name",length = 255)
    private String name;

    @Column(name="description",length = 1025)
    private String description;
    @Lob
    @Column(name="image",length = 255, nullable = false, columnDefinition = "mediumblob")
    private byte[] image;

    @Column(name="amount")
    private int amount;

    @Column(name = "author")
    private String author;

    @Column(name ="edition")
    private int edition;

    @Column(name="eversion")
    private int eversion;

    @Lob
    @Column( nullable = false, columnDefinition = "mediumblob")
    private String base64;

    @Column(name = "tags")
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(joinColumns = {@JoinColumn(name = "Book_id")} , inverseJoinColumns = {@JoinColumn(name="tags_id")})
    private Set<Tag> tags ;

    public Set<Tag> getTags() {
        return tags;
    }

    public void setTags(Set<Tag> tags) {
        this.tags = tags;
    }

    public int getEdition() {
        return edition;
    }

    public void setEdition(int edition) {
        this.edition = edition;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Book(){

    }

    public int getEversion() {
        return eversion;
    }

    public void setEversion(int eversion) {
        this.eversion = eversion;
    }

    public Book(String name, String description, byte[] image, int amount, String author, int edition, String base64, Set<Tag> tags,int eversion) {
        this.name = name;
        this.description = description;
        this.image = image;
        this.amount = amount;
        this.author = author;
        this.edition = edition;
        this.base64 = base64;
        this.tags = tags;
        this.eversion=eversion;
    }

    public Long getId() {
        return id;
    }

    public String getBase64() {
        return base64;
    }

    public void setBase64(String base64) {

        this.base64 = base64;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public byte[] getImage() {
        return image;
    }

    public void setImage(byte[] image) {
        this.image = image;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
