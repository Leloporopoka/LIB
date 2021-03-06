package com.myspring.controllers;

import com.myspring.beans.UserBean;
import com.myspring.db.entities.Book;
import com.myspring.db.entities.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@RestController()
@RequestMapping("/api")
public class SearchController {
    @Autowired
    UserBean userBean;
    @RequestMapping(path = "/getAllBooks" )
    public @ResponseBody
    List<Book> getAllBooks() {
        List<Book> books = userBean.getAllBooks();
        System.out.println("GET ALL BOOK TO SEARCH PAGE ");
        return books;
    }
    @RequestMapping(path = "/getAllTags" )
    public @ResponseBody
    List<Tag> getAllTags() {
        List<Tag> tags = userBean.getAllTags();

        System.out.println("GET ALL Tags TO SEARCH PAGE ");
        return tags;
    }
    @RequestMapping(path = "/getBookByTags" , method = RequestMethod.GET)
        public @ResponseBody
        List<Book> getBookbyTags(@RequestParam(name="tags") Long[] tags,
                                 @RequestParam(name="search") String search) {


            List<Book> book = userBean.filter(search);
            int sum=tags.length;
            for(int i=0;i<book.size();i++){
                int check=0;
                for (Iterator<Tag> it = book.get(i).getTags().iterator(); it.hasNext(); ) {
                    Tag tg = it.next();
                    for(int j=0;j<tags.length;j++){
                        if(tags[j]==tg.getId()){
                            check++;
                            break;
                        }
                    }
                    }
                if(check!=sum){
                    book.remove(i);
                    i--;
                }
            }

            return book;
    }
}
