package com.myspring.beans;

import com.myspring.db.entities.Book;
import com.myspring.db.entities.Tag;
import com.myspring.db.entities.Users;
import com.myspring.db.entities.Book_;
import com.myspring.db.entities.Tag_;
import com.myspring.db.entities.*;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import javax.persistence.*;
import javax.persistence.criteria.*;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;
import java.util.List;
import java.io.*;
import java.util.logging.*;
import javax.xml.bind.DatatypeConverter;

import static com.myspring.db.entities.Users_.login;


public class UserBean {

    private SessionFactory sessionFactory;


    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void addUser(Users users) {
        users.setPassword(sha1(users.getPassword()));
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(users);
        transaction.commit();
        session.close();
    }
    public void reserveBook( Reserve_Books reserve_books) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(reserve_books);
        transaction.commit();
        session.close();
    }

    public Users getUser(String login) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = criteriaBuilder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Users users = session.createQuery(query.where(criteriaBuilder.equal(root.get("login"), login))).getSingleResult();
        session.close();
        return users;
    }


    public Users getOneUser(Long id) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Users> criteriaQuery = builder.createQuery(Users.class);
        Root root = criteriaQuery.from(Users.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Users> us = session.createQuery(criteriaQuery.where(predicate)).list();
        if (us.isEmpty()) {
            session.close();
            return null;
        } else {
            session.close();
            return us.get(0);
        }
    }

    public void editUser(Users us) {
        Users check= getOneUser(us.getId());
        if(!check.getPassword().equals(us.getPassword())) {
            us.setPassword(sha1(us.getPassword()));
        }

        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(us);
        transaction.commit();
        session.close();
    }



    public void deleteUser(Users us) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(us);
        transaction.commit();
        session.close();
    }


    public List<Book> getBook(String name) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = builder.createQuery(Book.class);
        Root root = criteriaQuery.from(Book.class);
        Predicate predicate = builder.equal(root.get("name"), name);
        List<Book> us = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        return us;
    }
    public Book getBookById(Long id) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = builder.createQuery(Book.class);
        Root root = criteriaQuery.from(Book.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Book> books = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        if (books.isEmpty()) {
            return null;
        } else {
            return books.get(0);
        }
    }

    public List<Book> getAllBooks() {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = builder.createQuery(Book.class);
        Root root = criteriaQuery.from(Book.class);
        List<Book> bookList = session.createQuery(criteriaQuery).list();
        return bookList;
    }

    public void addBook(Book book) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(book);
        transaction.commit();
        session.close();
    }

    public void deleteBook(Long id) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(getBookById(id));
        transaction.commit();
        session.close();
    }

    public void editBook(Book book){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.update(book);
        transaction.commit();
        session.close();
    }

    public List<Tag> getParentTags(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tag> criteriaQuery = builder.createQuery(Tag.class);
        Root root = criteriaQuery.from(Tag.class);
        Predicate predicate = builder.equal(root.get("type"), 1);
        List<Tag> tags = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        return tags;
    }
    public List<Tag> getChildTags(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Tag> criteriaQuery = builder.createQuery(Tag.class);
        Root root = criteriaQuery.from(Tag.class);
        Predicate predicate = builder.equal(root.get("type"), 2);
        List<Tag> tags = session.createQuery(criteriaQuery.where(predicate)).list();
        session.close();
        return tags;
    }
    //HARD REQEST
        public List <Book> getBookByTag(String name){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = builder.createQuery(Book.class);
        Root<Book> root = criteriaQuery.from(Book.class);
        SetJoin<Book,Tag> bookTagListJoin = root.join(Book_.tags);
        criteriaQuery.select(root).where(builder.equal(bookTagListJoin.get(Tag_.name),name)).distinct(true);
        TypedQuery<Book> query = session.createQuery(criteriaQuery);
        List<Book>  list  = query.getResultList();
        session.close();
        return list;
    }


    public List <Book> getBookByTagAndSearch(String name , String search){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Book> criteriaQuery = builder.createQuery(Book.class);
        Root<Book> root = criteriaQuery.from(Book.class);
        SetJoin<Book,Tag> bookTagListJoin = root.join(Book_.tags);
        criteriaQuery.select(root).where(builder.and(builder.equal(bookTagListJoin.get(Tag_.name),name) , builder.equal(root.get("name") ,search))).distinct(true);
        TypedQuery<Book> query = session.createQuery(criteriaQuery);
        List<Book>  list  = query.getResultList();
        session.close();
        return list;
    }


    public List<Reserve_Books> getAllReservedBooks(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reserve_Books> criteriaQuery = builder.createQuery(Reserve_Books.class);
        Root<Reserve_Books> root = criteriaQuery.from(Reserve_Books.class);
        List<Reserve_Books> books = session.createQuery(criteriaQuery).getResultList();
        session.close();
        return books;
    }

    public Reserve_Books getOneReservedBook(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Reserve_Books> criteriaQuery = builder.createQuery(Reserve_Books.class);
        Root root = criteriaQuery.from(Reserve_Books.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Reserve_Books> resBooks = session.createQuery(criteriaQuery.where(predicate)).list();
        if (resBooks.isEmpty()) {
            session.close();
            return null;
        } else {
            session.close();
            return resBooks.get(0);
        }
    }

    public List <Users> getAllUsers(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Users> criteriaQuery = builder.createQuery(Users.class);
        Root<Users> root = criteriaQuery.from(Users.class);
        SetJoin<Users, Roles> UsersRolesListJoin = root.join(Users_.roles);
        criteriaQuery.select(root).where(builder.equal(UsersRolesListJoin.get(Roles_.id),id)).distinct(true);
        TypedQuery<Users> query = session.createQuery(criteriaQuery);
        List<Users> list = query.getResultList() ;
        session.close();
        return list;
    }




    public List<Debt_Books> getAllDebtBooks(){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Debt_Books> criteriaQuery = builder.createQuery(Debt_Books.class);
        Root<Debt_Books> root = criteriaQuery.from(Debt_Books.class);
        List<Debt_Books> books = session.createQuery(criteriaQuery).getResultList();
        session.close();
        return books;
    }


    public List<Reserve_Books> getReserveBookByUser(Users user){
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Reserve_Books> query = criteriaBuilder.createQuery(Reserve_Books.class);
        Root<Reserve_Books> root = query.from(Reserve_Books.class);
        List<Reserve_Books> list = session.createQuery(query.where(criteriaBuilder.equal(root.get("user"), user))).list();
        session.close();
        return list;
    }


    public String sha1(String input) {
        String sha1 = null;
        try {
            MessageDigest msdDigest = MessageDigest.getInstance("SHA-1");
            msdDigest.update(input.getBytes("UTF-8"), 0, input.length());
            sha1 = DatatypeConverter.printHexBinary(msdDigest.digest());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sha1;
    }

    public List<Debt_Books> getDebtBookByUser(Users user){
        Session session = sessionFactory.openSession();
        CriteriaBuilder criteriaBuilder = session.getCriteriaBuilder();
        CriteriaQuery<Debt_Books> query = criteriaBuilder.createQuery(Debt_Books.class);
        Root<Debt_Books> root = query.from(Debt_Books.class);
        List<Debt_Books> list = session.createQuery(query.where(criteriaBuilder.equal(root.get("user"), user))).list();
        session.close();
        return list;
    }



    public void Accept(Long id){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Reserve_Books rv=getOneReservedBook(id);
        session.delete(rv);
        transaction.commit();
        session.close();
        AddDebtBook(new Debt_Books(rv.getUser(),rv.getBook(),new Date()));
        Book book = getBookById(rv.getBook().getId());
        book.setAmount(book.getAmount()-1);
        editBook(book);
    }

    public void Deny(Long id){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Reserve_Books rv=getOneReservedBook(id);
        session.delete(rv);
        transaction.commit();
        session.close();
    }

    public void AddDebtBook(Debt_Books book){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(book);
        transaction.commit();
        session.close();
    }

    public void deleteDebtBook(Long id){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        Debt_Books db=getOneDebtBook(id);
        session.delete(db);
        transaction.commit();
        session.close();
        Book book = getBookById(db.getBook().getId());
        book.setAmount(book.getAmount()+1);
        editBook(book);
    }

    public Debt_Books getOneDebtBook(Long id){
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Debt_Books> criteriaQuery = builder.createQuery(Debt_Books.class);
        Root root = criteriaQuery.from(Debt_Books.class);
        Predicate predicate = builder.equal(root.get("id"), id);
        List<Debt_Books> debtBooks = session.createQuery(criteriaQuery.where(predicate)).list();
        if (debtBooks.isEmpty()) {
            session.close();
            return null;
        } else {
            session.close();
            return debtBooks.get(0);
        }
    }


}
