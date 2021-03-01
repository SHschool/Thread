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
    throws ServletException, IOException { //URLをたたいた時スレッドの一覧を表示するメソッド
        req.setCharacterEncoding("Windows-31J"); //エンコード指定

        HttpSession session = req.getSession(false); //sessionオブジェクトとして登録された「loginSession」を取得
        String userName = (String)session.getAttribute("loginSession");

        //ログインしてないなら一覧が見れずログイン画面へ
        if(userName == null){
            RequestDispatcher dis = req.getRequestDispatcher("log");
            dis.forward(req,res);
        }

        //データベースに接続してinsertなどするメソッドがあるクラスをインスタンス化
        ThreadDataBase th_db = new ThreadDataBase(); 

         //データベースの投稿記事データを取得(戻り値：beanのインスタンスを格納したArrayList)
        ArrayList<TB_POST_Bean> th_data = th_db.SelectThreadInfo();
        req.setAttribute("targetName",userName);
        req.setAttribute("threads", th_data); //JSPで使えるよう登録 

        RequestDispatcher dis = req.getRequestDispatcher("index");
        dis.forward(req,res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) 
    throws ServletException, IOException { //新規作成のデータを登録して表示

        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");

        // POST要求によって送信されたパラメータを取得する
        String name = req.getParameter("name");
        String content = req.getParameter("content");
        String tag = req.getParameter("tag");

        if(content == null){ // パラメーターがないときはインサートせずに一覧表示
            doGet(req,res);
            return; // 処理抜け
        }

        // oracle接続クラスをよびデータを挿入する
        ThreadDataBase th_db = new ThreadDataBase();

        if (th_db.IsThreadInsert(name, content, tag)) { //データベースに投稿出来たらdoGetメソッドを呼んで再度一覧表示
                doGet(req,res);
            }
        }
    }
