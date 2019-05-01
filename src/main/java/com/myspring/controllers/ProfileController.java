package com.myspring.controllers;

import com.myspring.beans.UserBean;
import com.myspring.db.entities.Book;
import com.myspring.db.entities.Remind;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController()
@RequestMapping("/profile")
public class ProfileController {
    @Autowired
    UserBean userBean;

    SecurityUser sc = new SecurityUser();
    @RequestMapping(path = "/getAllNotifications" )
    public @ResponseBody
    List<Remind> getAllNotifications() {
        List<Remind> rm = userBean.checkNotifications(sc.getUserData());
        for(int i=0;i<rm.size();i++){
            if(rm.get(i).getBook().getAmount()>0){
                rm.get(i).setAvailabilty(true);
            }
        }
        System.out.println("GET ALL BOOK TO SEARCH PAGE ");
        return rm;
    }
}



