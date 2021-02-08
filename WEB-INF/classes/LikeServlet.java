import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ThreadDataBase;
import bean.TB_POST_Bean;

public class LikeServlet extends HttpServlet {
    //beanのインスタンスを受け取るArrayList
    private ArrayList<TB_POST_Bean> threads = new ArrayList<TB_POST_Bean>(); 

    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URLをたたいた時スレッドの一覧を表示するメソッド

        req.setCharacterEncoding("Windows-31J"); //エンコード指定

        String id = req.getParameter("threadid");

        threads.clear(); //一度中身を空にする

        //データベースに接続してinsertなどするメソッドがあるクラスをインスタンス化
        ThreadDataBase th_db = new ThreadDataBase(); 

        if(th_db.IsAddLikesNumber(Integer.parseInt(id))){
            //データベースの投稿記事データを取得(戻り値：beanのインスタンスを格納したArrayList)
            threads = th_db.SelectThreadInfo();
        }

        req.setAttribute("threads", threads); //JSPで使えるよう登録

        RequestDispatcher dis = req.getRequestDispatcher("index.jsp"); //転送先指定
        dis.forward(req, res); //転送
    }
}
