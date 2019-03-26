package com.myspring.db.entities;


import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name="user")
public class Users {
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    @Column(name="id")
    private Long id;

    @Column(name="login",length = 255)
    private String login;
    @Column(name="full_name" , length = 255)
    private  String name;
    @Column(name="password",length = 255)
    private String password;
    @ManyToMany (cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_roles",
            joinColumns = { @JoinColumn(name = "Users_id") },
            inverseJoinColumns = { @JoinColumn(name = "roles_id") }
    )
    private Set<Roles> roles;



    public Users(){

    }

    public Users(String login, String name, String password, Set<Roles> roles) {
        this.login = login;
        this.name = name;
        this.password = password;
        this.roles = roles;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Set<Roles> getRoles() {
        return roles;
    }

    public void setRoles(Set<Roles> roles) {
        this.roles = roles;
    }
}
