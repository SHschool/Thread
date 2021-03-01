import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import orcl.ResDataBase;
import bean.TB_RES_Bean;
import bean.TB_POST_Bean;

public class ResServlet extends HttpServlet {
    //bean�̃C���X�^���X���󂯎��ArrayList
    private ArrayList<TB_RES_Bean> resThreads = new ArrayList<TB_RES_Bean>();
    private int th_id; //�ԐM�ɑΉ�����ID���i�[����

    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URL�������������X���b�h�̈ꗗ��\�����郁�\�b�h
        req.setCharacterEncoding("Windows-31J"); //�G���R�[�h�w��
        resThreads.clear(); //��x���g����ɂ���

        HttpSession session = req.getSession(false);
        String userName = (String)session.getAttribute("loginSession");

        //url�p�����[�^����X���b�h��ID�擾
        String threadId = req.getParameter("threadid");
        th_id = Integer.parseInt(threadId);

        ArrayList<TB_RES_Bean> res_data = displayList(th_id);        
        req.setAttribute("resThreads", res_data); //JSP�Ŏg����悤�o�^

        TB_POST_Bean targetThread = displayResTarget(th_id);
        req.setAttribute("targetThreads",targetThread); // �ԐM�Ώۃf�[�^

        req.setAttribute("targetName",userName); // �ԐM�Җ�
        
        RequestDispatcher dis = req.getRequestDispatcher("reply"); //�]����w��
        dis.forward(req, res); //�]��
    }  

    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //�V�K�쐬�̃f�[�^��o�^���ĕ\��

        // �N���C�A���g�����request�Ɋ܂܂�Ă����f�[�^��
        // �����R�[�h���w�肷��
        req.setCharacterEncoding("Windows-31J");
        resThreads.clear();

        String threadId = req.getParameter("threadid");

        // POST�v���ɂ���đ��M���ꂽ�p�����[�^���擾����
        String name = req.getParameter("name");
        String content = req.getParameter("content");

        // oracle�ڑ��N���X����уf�[�^��}������
        ResDataBase th_db = new ResDataBase();

        if (th_db.IsResInsert(name, content, th_id)){ //�f�[�^�x�[�X�ɓ��e�o������doGet���\�b�h���Ă�ōēx�ꗗ�\��
            ArrayList<TB_RES_Bean> res_data = displayList(th_id);
            TB_POST_Bean targetThread = displayResTarget(th_id);
            req.setAttribute("targetThreads",targetThread); // �ԐM�Ώۃf�[�^
            req.setAttribute("resThreads", res_data); //JSP�Ŏg����悤�o�^
        }

        RequestDispatcher dis = req.getRequestDispatcher("reply"); //�]����w��
        dis.forward(req, res); //�]��
    }

    //�ԐM�ꗗ�f�[�^�擾���\�b�h
    public ArrayList<TB_RES_Bean> displayList(int id){
        //�f�[�^�x�[�X�ɐڑ�����insert�Ȃǂ��郁�\�b�h������N���X���C���X�^���X��
        ResDataBase res_db = new ResDataBase();
        //�f�[�^�x�[�X�̓��e�L���f�[�^���擾(�߂�l�Fbean�̃C���X�^���X���i�[����ArrayList)
        ArrayList<TB_RES_Bean> res_data = res_db.SelectResInfo(id);
        return res_data;
    }

    //�ԐM�Ώۓ��e�f�[�^�擾���\�b�h
    public TB_POST_Bean displayResTarget(int id){
        ResDataBase res_db = new ResDataBase();
        TB_POST_Bean targetThread = res_db.selectResTargetThread(id);

        return targetThread;
    } 
}
