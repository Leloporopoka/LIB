package com.myspring.db.entities;

import com.myspring.db.entities.Book;
import com.myspring.db.entities.Tag;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Book.class)
public class Book_ {

    public static volatile SingularAttribute<Book, String> name;
    public static volatile SingularAttribute<Book, String> description;
    public static volatile SingularAttribute<Book, byte[]> image;
    public static volatile SingularAttribute<Book, String> author;
    public static volatile SetAttribute<Book, String> base64;
    public static volatile SetAttribute<Book, Tag> tags;
    public static volatile SingularAttribute<Book, Long> id;
    public static volatile SingularAttribute<Book, Integer> edition;
    public static volatile SingularAttribute<Book, Integer> amount;
}
