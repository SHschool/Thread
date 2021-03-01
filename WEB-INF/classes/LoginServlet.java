import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.*;
import orcl.UserInfoDataBase;


public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
    throws ServletException, IOException { //ログイン

        String user_name = req.getParameter("userName");
        String password = req.getParameter("password");

        UserInfoDataBase login = new UserInfoDataBase();
        if(login.selectLoginInfo(user_name,password)){
            HttpSession session = req.getSession(true);

            String name = login.selectUserName(password);

            String errorMess = "";
            
            req.setAttribute("errorMess",errorMess);
            req.setAttribute("targetName",name);
            session.setAttribute("loginSession",name);

            RequestDispatcher dis = req.getRequestDispatcher("thread");
            dis.forward(req,res);
        }
        else{
            String errorMess = "ユーザー名またはパスワードが違います。";
            req.setAttribute("errorMess",errorMess);
            String url = "log"; //再度ログイン画面へ
            RequestDispatcher dis = req.getRequestDispatcher("log");
            dis.forward(req,res);
        }
        
    }
} 