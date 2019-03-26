package com.myspring.db.entities;

import com.myspring.db.entities.Book;
import com.myspring.db.entities.Tag;

import javax.annotation.Generated;
import javax.persistence.metamodel.SetAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value = "org.hibernate.jpamodelgen.JPAMetaModelEntityProcessor")
@StaticMetamodel(Tag.class)
public class Tag_ {
    public static volatile SingularAttribute<Tag, String> name;
    public static volatile SingularAttribute<Tag, Long> id;
    public static volatile SingularAttribute<Tag, Long> parents_id;
    public static volatile SingularAttribute<Tag, Integer> type;
}
