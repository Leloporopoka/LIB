package com.myspring.controllers;

import com.myspring.beans.UserBean;
import com.myspring.db.entities.Book;
import com.myspring.db.entities.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Set;

@RestController()
@RequestMapping("/api")
public class SearchController {
    @Autowired
    UserBean userBean;
    @RequestMapping(path = "/getAllBooks" )
    public @ResponseBody
    List<Book> getAllBooks(Set<Tag>tags) {
        List<Book> books = userBean.getAllBooks();
        System.out.println("GET ALL BOOK TO SEARCH PAGE ");
        List<Book> book = userBean.filter("Wac",null);
        for(int i=0;i<book.size();i++){
           if(!(book.get(i).getTags().equals(tags))){
            book.remove(i);
           }
        }
        return books;
    }
    @RequestMapping(path = "/getAllTags" )
    public @ResponseBody
    List<Tag> getAllTags() {
        List<Tag> tags = userBean.getAllTags();

        System.out.println("GET ALL Tags TO SEARCH PAGE ");
        return tags;
    }
}
