package bean;

import java.io.Serializable;

public class UserInfoBean implements Serializable{
    private String userName;

    public void setUserName(String name){
        this.userName = name;
    }

    public String getUserName(){
        return this.userName;
    } 
}