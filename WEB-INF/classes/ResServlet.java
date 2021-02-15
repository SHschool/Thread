import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ResDataBase;
import bean.TB_RES_Bean;
import bean.TB_POST_Bean;

public class ResServlet extends HttpServlet {
    //beanのインスタンスを受け取るArrayList
    private ArrayList<TB_RES_Bean> resThreads = new ArrayList<TB_RES_Bean>();
    private int th_id; //返信に対応するIDを格納する

    protected void doGet(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //URLをたたいた時スレッドの一覧を表示するメソッド
        req.setCharacterEncoding("Windows-31J"); //エンコード指定
        resThreads.clear(); //一度中身を空にする

        //urlパラメータからスレッドのID取得
        String threadId = req.getParameter("threadid");
        th_id = Integer.parseInt(threadId);

        ArrayList<TB_RES_Bean> res_data = displayList(th_id);        
        req.setAttribute("resThreads", res_data); //JSPで使えるよう登録

        TB_POST_Bean targetThread = displayResTarget(th_id);
        req.setAttribute("targetThreads",targetThread); // 返信対象データ
        
        RequestDispatcher dis = req.getRequestDispatcher("reply"); //転送先指定
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

        // oracle接続クラスをよびデータを挿入する
        ResDataBase th_db = new ResDataBase();

        if (th_db.IsResInsert(name, content, th_id)){ //データベースに投稿出来たらdoGetメソッドを呼んで再度一覧表示
            ArrayList<TB_RES_Bean> res_data = displayList(th_id);
            req.setAttribute("resThreads", res_data); //JSPで使えるよう登録
        }

        RequestDispatcher dis = req.getRequestDispatcher("reply"); //転送先指定
        dis.forward(req, res); //転送
    }

        //返信一覧データ取得メソッド
        public ArrayList<TB_RES_Bean> displayList(int id){
            //データベースに接続してinsertなどするメソッドがあるクラスをインスタンス化
            ResDataBase res_db = new ResDataBase();
            //データベースの投稿記事データを取得(戻り値：beanのインスタンスを格納したArrayList)
            ArrayList<TB_RES_Bean> res_data = res_db.SelectResInfo(id);
            return res_data;
        }

        //返信対象投稿データ取得メソッド
        public TB_POST_Bean displayResTarget(int id){
            ResDataBase res_db = new ResDataBase();
            TB_POST_Bean targetThread = res_db.selectResTargetThread(id);

            return targetThread;
        } 
    }
