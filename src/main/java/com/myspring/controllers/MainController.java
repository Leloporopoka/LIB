package com.myspring.controllers;
import com.myspring.beans.UserBean;
import com.myspring.db.entities.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Controller
public class MainController {

    @Autowired
    UserBean userBean;

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accessDeniedPage(){
        ModelAndView mw = new ModelAndView("403");
        return mw;
    }

    @RequestMapping(value = "/ContactUs", method = RequestMethod.GET)
    public ModelAndView contactUs(){
        ModelAndView mw = new ModelAndView("ContactUs");
        return mw;
    }

    @RequestMapping(value = "/aboutUs", method = RequestMethod.GET)
    public ModelAndView aboutUs(){
        ModelAndView mw = new ModelAndView("about");
        return mw;
    }

    @RequestMapping(value = {"/admin"})
    public ModelAndView Admin() {
        ModelAndView mv = new ModelAndView("Admin");
        Users us = getUserData();
        List<Book>books = userBean.getAllBooks();
        List<Reserve_Books>rbooks = userBean.getAllReservedBooks();
        List<Debt_Books>dbooks = userBean.getAllDebtBooks();
        List<Users>users=userBean.getAllUsers(2L);



        mv.addObject("user", us);
        mv.addObject("users", users);
        mv.addObject("books", books);
        mv.addObject("rbooks",rbooks);
        mv.addObject("dbooks",dbooks);


        return mv;
    }
    @RequestMapping(value = {"user"})
    public ModelAndView StudentPage(HttpSession session) {
        ModelAndView mv = new ModelAndView("User");
        Users us = (Users) session.getAttribute("user");
        mv.addObject("user", us);
        return mv;
    }


    @RequestMapping(value="/deleteUser",method=RequestMethod.GET)
    public String deleteUser(@RequestParam(name = "id") Long id){
        Users us = userBean.getOneUser(id);
        userBean.deleteUser(us);
        return "redirect:admin";
    }


    @RequestMapping(value = "search")
    public ModelAndView Search(@RequestParam(name = "search") String search ,
                               @RequestParam(name ="tag") String tag
    ){
        List <Book> books;
        if (!tag.equals("")){
            if(search.equals("")){
                books = userBean.getBookByTag(tag);
            }else{
                books = userBean.getBookByTagAndSearch(tag , search);
            }
        }
        else{
            books =userBean.getBook(search);
        }

        Users user = getUserData();
        ModelAndView mv = new ModelAndView("search");
        mv.addObject("tag" , tag);
        mv.addObject("user", user);
        mv.addObject("books" , books);
        mv.addObject("search" , search);
        return mv;
    }

//Home Controller


    @RequestMapping (value = {"home" , "/"})
    public ModelAndView HomePage(){
        ModelAndView mv = new ModelAndView("home");
        Users us = getUserData();
        List <Book> books = userBean.getAllBooks();
        mv.addObject("books" , books);
        mv.addObject("user", us);
        return mv;
    }

    @RequestMapping(value = {"/addBook"}, headers = ("content-type=multipart/*"), method = RequestMethod.POST)
    public String AddBook(@RequestParam(name = "name") String name,@RequestParam(name = "description") String description,
                          @RequestParam(name = "author") String author,@RequestParam(name = "edition") int edition,@RequestParam(name = "amount") int amount,
                          @RequestParam(name = "fileUpload") MultipartFile fileUpload, ModelMap map) throws IOException {

        byte[] bytes = fileUpload.getBytes();
        InputStream inputStream = new ByteArrayInputStream(bytes);
        Book book = new Book(name,description,bytes, amount, author, edition, null, null);
        book.setBase64(Base64.encode(bytes));
        userBean.addBook(book);
        return "redirect:admin";
    }

    @RequestMapping(value="/deleteBook", method = RequestMethod.GET)
    public String DeleteBook(@RequestParam(name = "id") Long id){
        userBean.deleteBook(id);
        return "redirect:admin";
    }
    @RequestMapping(value="/editBook/{id}", method = RequestMethod.GET)
    public ModelAndView EditBook(@PathVariable(name = "id") Long id,HttpSession session){
        ModelAndView mv =new ModelAndView("EditBook");
        mv.addObject("book",userBean.getBookById(id));
        return mv;
    }

    @RequestMapping(value="/changeBook", method = RequestMethod.POST)
    public String ChangeBook(@RequestParam(name = "id") Long id,@RequestParam(name = "name") String name,@RequestParam(name = "description") String description,
                             @RequestParam(name = "author") String author,@RequestParam(name = "edition") int edition,@RequestParam(name = "amount") int amount,
                             @RequestParam(name = "fileUpload") MultipartFile fileUpload, ModelMap map) throws IOException {

        byte[] bytes = fileUpload.getBytes();
        InputStream inputStream = new ByteArrayInputStream(bytes);
        Book book = new Book(name, description, bytes, amount, author, edition, null, null);
        book.setId(id);
        book.setBase64(Base64.encode(bytes));
        userBean.editBook(book);
        return "redirect:admin";
    }


    //Nikita
    @RequestMapping (value = "book/{book_id}", method = RequestMethod.GET)
    public ModelAndView BooksPage(
                                  @PathVariable(name = "book_id") Long book_id){
        ModelAndView mv = new ModelAndView("Book");
        Users user = getUserData();
        Book book = userBean.getBookById(book_id);
        mv.addObject("user" , user);
        mv.addObject("book" , book);
        return mv;
    }

    @RequestMapping(value = "searchByTag", method = RequestMethod.GET)
    public ModelAndView SearchByTag(HttpSession session,
                                    @RequestParam(name="child") String name){

        Users user = getUserData();
        ModelAndView mv = new ModelAndView("search");
        mv.addObject("user", user);
        List<Book> Books = userBean.getBookByTag(name);
        mv.addObject("tag" , name);
        mv.addObject("books" ,Books );
        mv.addObject("search" , "");
        return mv;

    }
    @RequestMapping (value = "tags", method = RequestMethod.GET)
    public ModelAndView TagsPage(HttpSession session ){
        ModelAndView mv = new ModelAndView("tags");
        List<Tag> parent = userBean.getParentTags();
        List<Tag> child = userBean.getChildTags();

        mv.addObject("parent", parent );
        mv.addObject("child", child );
        return mv;
    }

    // Damir (Functions for editing users)
    @RequestMapping (value="/editUser/{id}",method = RequestMethod.GET)
    public ModelAndView EditUser(@PathVariable(name = "id") Long id){
        ModelAndView mv = new ModelAndView("EditUser");
        mv.addObject("user",userBean.getOneUser(id));
        return mv;
    }

    @RequestMapping (value="/changeUser",method = RequestMethod.POST)
    public String ChangeUser(@RequestParam(name = "id") Long id,@RequestParam(name = "login") String login,@RequestParam(name = "password") String password,
                             @RequestParam(name = "name") String name){
        Set<Roles>roles = new HashSet<Roles>();
        Roles role = new Roles("ROLE_ADMIN");
        role.setId(2L);
        roles.add(role);
        Users us = new Users(login,name,password,roles);
        us.setId(id);
        userBean.editUser(us);
        return "redirect:admin";
    }

    @RequestMapping (value="/addUser",method = RequestMethod.POST)
    public String AddUser(@RequestParam(name = "login") String login,@RequestParam(name = "password") String password,
                          @RequestParam(name = "name") String name){
        Set<Roles>roles = new HashSet<Roles>();
        Roles role = new Roles("ROLE_ADMIN");
        role.setId(2L);
        roles.add(role);
        Users us = new Users(login,name,password,roles);
        userBean.addUser(us);
        return "redirect:admin";
    }

    @RequestMapping (value="/accept",method = RequestMethod.GET)
    public String Accept(@RequestParam(name = "id") Long id){
        userBean.Accept(id);
        return "redirect:admin";
    }

    @RequestMapping (value="/deny",method = RequestMethod.GET)
    public String Deny(@RequestParam(name = "id") Long id){
        userBean.Deny(id);
        return "redirect:admin";
    }
    @RequestMapping (value="/deleteDebtBook",method = RequestMethod.GET)
    public String DeleteDebtBook(@RequestParam(name = "id") Long id){
        userBean.deleteDebtBook(id);
        return "redirect:admin";
    }



    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logoutPage (HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/home";
    }

    @RequestMapping(value = "profile" , method = RequestMethod.GET)
    public ModelAndView Profile(){
        ModelAndView mv = new ModelAndView("profile");
        Users user = getUserData();
        List<Reserve_Books> reserve_books = userBean.getReserveBookByUser(user);

        List<Debt_Books> debt_Books = userBean.getDebtBookByUser(user);
        mv.addObject("reserve" , reserve_books);
        mv.addObject("user" , user);
        mv.addObject("debt" ,debt_Books );
        return mv;
    }


    @RequestMapping (value = "/reserve", method = RequestMethod.POST)
    public String ReserveUser (@RequestParam(name="student_id") String login ,
                           @RequestParam(name="student_password") String password,
                           @RequestParam(name="book") Long id ){

        System.out.println(password);
        System.out.println(id);

        if(login.equals(null)){
            System.out.println("equals");
            Users user =getUserData();
            if(user.getPassword().equals(userBean.sha1(password))){

                Book book = userBean.getBookById(id);
                Date date = new Date();
                Reserve_Books reserve_books = new Reserve_Books(user , book ,date );

                System.out.println("RESERVE");
            }else return "home";
        }else{
            System.out.println("else");
            System.out.println(userBean.sha1(password));
            Users user = userBean.getUser(login);
            System.out.println(user.getPassword());
            if(user.getPassword().equals(userBean.sha1(password).toLowerCase())){
                System.out.println("if");
                Book book = userBean.getBookById(id);
                Date date = new Date();
                Reserve_Books reserve_books = new Reserve_Books(user , book ,date );
                userBean.reserveBook(reserve_books);
                System.out.println("RESERVE");
            }else {
                return "redirect:home";}
        }

        return "redirect:home";
    }





    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!(authentication instanceof AnonymousAuthenticationToken)){
            UserDetails ud = (UserDetails) authentication.getPrincipal();
            user = userBean.getUser(ud.getUsername());
        }
        return user;

    }


}