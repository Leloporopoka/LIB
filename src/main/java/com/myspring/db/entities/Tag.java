package com.myspring.db.entities;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Set;

@Entity
@Table(name = "tags")
public class Tag implements Serializable {

    @Id
    @GeneratedValue(strategy= GenerationType.AUTO)
    @Column(name = "id")
    private Long id;
    @Column(name = "name")
    private String name;
    @Column(name = "type")
    private int type;
    @Column(name = "parent")
    private Long parents_id;



    public Tag() {
    }

    public Tag(String name, int type, Long parents_id) {
        this.name = name;
        this.type = type;
        this.parents_id = parents_id;
    }

    public Long getParents_id() {
        return parents_id;
    }

    public void setParents_id(Long parents_id) {
        this.parents_id = parents_id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Long getId() {
        return id;
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

    public Tag(String name , int type) {
        this.name = name;
        this.type = type;
    }

    @Override
    public String toString() {
        return "Tag{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type=" + type +
                ", parents_id=" + parents_id +
                '}';
    }
}
