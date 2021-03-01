import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.*;

public class LogoutServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //���O�A�E�g����
        req.setCharacterEncoding("Windows-31J"); //�G���R�[�h�w�� 

        HttpSession session = req.getSession(true);
        session.removeAttribute("loginSession"); //�o�^���ꂽ�Z�b�V����������

        String url = "log"; //���O�C����ʂ�
        res.sendRedirect(url);
    }       
}
