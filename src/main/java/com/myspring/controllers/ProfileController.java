package com.myspring.controllers;

import com.myspring.beans.UserBean;
import com.myspring.db.entities.Book;
import com.myspring.db.entities.Remind;
import com.myspring.db.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@RestController()
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    UserBean userBean;

    @RequestMapping(path = "/deleteNotification" )
    public @ResponseBody
     boolean deleteNotification(@RequestParam("notificationId") Long id) {
        userBean.deleteNotification(id);
        return true;
    }



    @RequestMapping(path = "/getAllNotifications" )
    public @ResponseBody
    List<Remind> getAllNotifications() {

        List<Remind> rm = userBean.checkNotifications(getUserData());
        if(rm != null)
        for(int i=0;i<rm.size();i++){
            if(rm.get(i).getBook().getAmount()>0){
                rm.get(i).setAvailabilty(true);
            }
        }

        return rm;
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



