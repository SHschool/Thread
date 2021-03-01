import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //ログアウトする
        req.setCharacterEncoding("Windows-31J"); //エンコード指定 

        HttpSession session = req.getSession(true);
        session.removeAttribute("loginSession"); //登録されたセッションを消去

        String url = "log"; //ログイン画面へ
        res.sendRedirect(url);
    }       
}
