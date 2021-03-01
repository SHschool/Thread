import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.UserInfoDataBase;

public class RegistServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException{ //êVãKâÔàıìoò^
        String user_name = req.getParameter("userName");
        String password = req.getParameter("password");

        UserInfoDataBase regist = new UserInfoDataBase();
        try{
            if(regist.insertUserInfo(user_name,password)){
                RequestDispatcher dis = req.getRequestDispatcher("regiComp");
                dis.forward(req,res);
            }
        }catch(SQLException e){
            throw new ServletException(e);
        }
    }
}