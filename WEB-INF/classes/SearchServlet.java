import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ThreadDataBase;
import bean.TB_POST_Bean;

public class SearchServlet extends HttpServlet {
    //bean�̃C���X�^���X���󂯎��ArrayList
    private ArrayList<TB_POST_Bean> threads = new ArrayList<TB_POST_Bean>(); 

    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URL�������������X���b�h�̈ꗗ��\�����郁�\�b�h

        req.setCharacterEncoding("Windows-31J"); //�G���R�[�h�w��
        threads.clear(); //��x���g����ɂ���

        // POST�v���ɂ���đ��M���ꂽ�p�����[�^���擾����
        String tag = req.getParameter("tag");

        //�f�[�^�x�[�X�ɐڑ�����insert�Ȃǂ��郁�\�b�h������N���X���C���X�^���X��
        ThreadDataBase th_db = new ThreadDataBase();

         //�f�[�^�x�[�X�̓��e�L���f�[�^���擾(�߂�l�Fbean�̃C���X�^���X���i�[����ArrayList)
        ArrayList<TB_POST_Bean> th_data = th_db.wordSearch(tag);

        req.setAttribute("threads", th_data); //JSP�Ŏg����悤�o�^

        RequestDispatcher dis = req.getRequestDispatcher("index.jsp"); //�]����w��
        dis.forward(req, res); //�]��
    }
}