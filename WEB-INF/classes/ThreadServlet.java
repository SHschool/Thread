import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThreadServlet extends HttpServlet {
    
    // ���[�U�[���̎������i�[����C���X�^���X�ϐ�
    private String _userName;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // �o�͂�����e�̃f�[�^�E�^�C�v�ƕ����R�[�h���w�肷��
        res.setContentType("text/html; charset=Windows-31J");




    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // �N���C�A���g�����request�Ɋ܂܂�Ă����f�[�^��
        // �����R�[�h���w�肷��
        req.setCharacterEncoding("Windows-31J");

        //POST�v���ɂ���đ��M���ꂽ�p�����[�^���擾����
        String i = req.getParameter("id");
        String n = req.getParameter("name");
        String c = req.getParameter("content");

        // ip.UserProfile�N���X�̃C���X�^���X�𐶐���
        // ���[�U�[����p�X���[�h�����Z�b�g����
        ip.Post post = new ip.Post();
        profile.setUserId(i);
        profile.setUserName(n);
        profile.setContent(c);

        // HttpServletRequest�̎����N���X�̃C���X�^���X��
        // ip.UserProfile�̃C���X�^���X��o�^����
        // ���̎��̓o�^��prof��������Ŏg�p���鎯�ʎq�ɂȂ�
        req.setAttribute("post",post);

        // RequestDispatcher�C���^�[�t�F�C�X����������N���X�̃C���X�^���X���擾����
        // �����͓]�����URL
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("thread");

        //�]����ɗv����]������
        dispatcher.forward(req, res);
    }
}

// javac -cp C:\tomcat8.5\lib\servlet-api.jar ShareServlet.java