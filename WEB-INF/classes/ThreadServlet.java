import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ThreadDataBase;
import bean.TB_POST_Bean;

public class ThreadServlet extends HttpServlet {
    private ArrayList<TB_POST_Bean> threads = new ArrayList<TB_POST_Bean>();

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        threads.clear();
        req.setCharacterEncoding("Windows-31J");

        ThreadDataBase th_db = new ThreadDataBase();
        ArrayList<TB_POST_Bean> th_data = th_db.SelectThreadInfo();

        req.setAttribute("threads", th_data);

        RequestDispatcher dis = req.getRequestDispatcher("index.jsp");
        dis.forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");
        threads.clear();

        // POST要求によって送信されたパラメータを取得する
        String name = req.getParameter("name");
        String content = req.getParameter("content");
        String tag = req.getParameter("tag");

        // oracle接続クラスをよびデータを挿入する
        ThreadDataBase th_db = new ThreadDataBase();

        if (th_db.IsThreadInsert(name, content, tag)) {
            ArrayList<TB_POST_Bean> th_data = th_db.SelectThreadInfo();

            for(int i = 0; i < th_data.size(); i++){
                TB_POST_Bean info = (TB_POST_Bean)th_data.get(i);
                threads.add(info);
            }
        }

        // 式言語として登録
        req.setAttribute("threads", threads);

        // RequestDispatcherインターフェイスを実装するクラスのインスタンスを取得する
        // 引数は転送先のURL
        RequestDispatcher dispatcher = req.getRequestDispatcher("index.jsp");

        // 転送先に要求を転送する
        dispatcher.forward(req, res);
    }
}
