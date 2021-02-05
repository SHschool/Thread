import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import orcl.ResDataBase;
import bean.TB_Res_Bean;

public class ResServlet extends HttpServlet {
    
    // ユーザー名の氏名を格納するインスタンス変数
    private String _userName;
    private ArrayList<TB_RES_Bean> res = new ArrayList<TB_RES_Bean>();

    // protected void doGet(HttpServletRequest req, HttpServletResponse res)
    //         throws ServletException, IOException {
    //     // 出力する内容のデータ・タイプと文字コードを指定する
    //     res.setCharacterEncoding("Windows-31J");




    // }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");

        //POST要求によって送信されたパラメータを取得する
        String name = req.getParameter("name");
        String content = req.getParameter("content");

        //oracle接続クラスをよびデータを挿入する
        ResDataBase re_db = new ResDataBase();
        
        if(th_db.IsResInsert(name,content,tag)){
            TB_RES_Bean resInfo = new TB_RES_Bean();
            resInfo.setUser_name(name);
            resInfo.setContent(content);

            res.add(resInfo); //ArrayListにBeanのインスタンスを渡す
        }



        // 式言語として登録
       req.setAttribute("res",res);

        // RequestDispatcherインターフェイスを実装するクラスのインスタンスを取得する
        // 引数は転送先のURL
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("index");

        //転送先に要求を転送する
        dispatcher.forward(req, res);
    }
}
