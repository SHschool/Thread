import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;

import orcl.ThreadDataBase;
import bean.TB_POST_Bean;

public class ThreadServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URL�������������X���b�h�̈ꗗ��\�����郁�\�b�h
        req.setCharacterEncoding("Windows-31J"); //�G���R�[�h�w��

        HttpSession session = req.getSession(false); //session�I�u�W�F�N�g�Ƃ��ēo�^���ꂽ�uloginSession�v���擾
        String userName = (String)session.getAttribute("loginSession");

        //���O�C�����ĂȂ��Ȃ�ꗗ�����ꂸ���O�C����ʂ�
        if(userName == null){
            RequestDispatcher dis = req.getRequestDispatcher("log");
            dis.forward(req,res);
        }

        //�f�[�^�x�[�X�ɐڑ�����insert�Ȃǂ��郁�\�b�h������N���X���C���X�^���X��
        ThreadDataBase th_db = new ThreadDataBase(); 

         //�f�[�^�x�[�X�̓��e�L���f�[�^���擾(�߂�l�Fbean�̃C���X�^���X���i�[����ArrayList)
        ArrayList<TB_POST_Bean> th_data = th_db.SelectThreadInfo();
        req.setAttribute("targetName",userName);
        req.setAttribute("threads", th_data); //JSP�Ŏg����悤�o�^ 

        RequestDispatcher dis = req.getRequestDispatcher("index");
        dis.forward(req,res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //�V�K�쐬�̃f�[�^��o�^���ĕ\��

        // �N���C�A���g�����request�Ɋ܂܂�Ă����f�[�^��
        // �����R�[�h���w�肷��
        req.setCharacterEncoding("Windows-31J");

        // POST�v���ɂ���đ��M���ꂽ�p�����[�^���擾����
        String name = req.getParameter("name");
        String content = req.getParameter("content");
        String tag = req.getParameter("tag");

        if(content == null){ // �p�����[�^�[���Ȃ��Ƃ��̓C���T�[�g�����Ɉꗗ�\��
            doGet(req,res);
            return; // ��������
        }

        // oracle�ڑ��N���X����уf�[�^��}������
        ThreadDataBase th_db = new ThreadDataBase();

        if (th_db.IsThreadInsert(name, content, tag)) { //�f�[�^�x�[�X�ɓ��e�o������doGet���\�b�h���Ă�ōēx�ꗗ�\��
                doGet(req,res);
            }
        }
    }
