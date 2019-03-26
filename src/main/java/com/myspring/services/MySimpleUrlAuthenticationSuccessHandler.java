package com.myspring.services;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MySimpleUrlAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
// Get the role of logged in user
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String role = auth.getAuthorities().toString();

        String targetUrl = "/home";
        if(role.contains("ROLE_USER")) {
            System.out.println("USER");
            targetUrl = "/home";
        } else if(role.contains("ROLE_ADMIN")) {
            System.out.println("ADMIN");
            targetUrl = "/admin";
        }
        return targetUrl;
    }
}