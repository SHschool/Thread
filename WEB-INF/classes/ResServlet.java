import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ResDataBase;
import bean.TB_RES_Bean;

public class ResServlet extends HttpServlet {
    //beanのインスタンスを受け取るArrayList
    private ArrayList<TB_RES_Bean> resThreads = new ArrayList<TB_RES_Bean>(); 

    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URLをたたいた時スレッドの一覧を表示するメソッド

        req.setCharacterEncoding("Windows-31J"); //エンコード指定
        resThreads.clear(); //一度中身を空にする

        //データベースに接続してinsertなどするメソッドがあるクラスをインスタンス化
        ResDataBase res_db = new ResDataBase(); 

        //urlパラメータからスレッドのID取得
        String threadId = req.getParameter("threadid");

         //データベースの投稿記事データを取得(戻り値：beanのインスタンスを格納したArrayList)
        ArrayList<TB_RES_Bean> res_data = res_db.SelectResInfo(Integer.parseInt(threadId));

        req.setAttribute("resThreads", res_data); //JSPで使えるよう登録

        RequestDispatcher dis = req.getRequestDispatcher("index.jsp"); //転送先指定
        dis.forward(req, res); //転送
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //新規作成のデータを登録して表示

        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");
        resThreads.clear();

        String threadId = req.getParameter("threadid");

        // POST要求によって送信されたパラメータを取得する
        String name = req.getParameter("name");
        String content = req.getParameter("content");
        int id = Integer.parseInt(threadId);

        // oracle接続クラスをよびデータを挿入する
        ResDataBase th_db = new ResDataBase();

        if (th_db.IsResInsert(name, content, id)) { //データベースに投稿出来たらdoGetメソッドを呼んで再度一覧表示
                doGet(req,res);
            }
        }
    }
