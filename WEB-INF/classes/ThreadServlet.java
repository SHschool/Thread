import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ThreadServlet extends HttpServlet {
    
    // ユーザー名の氏名を格納するインスタンス変数
    private String _userName;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // 出力する内容のデータ・タイプと文字コードを指定する
        res.setContentType("text/html; charset=Windows-31J");




    }
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");

        //POST要求によって送信されたパラメータを取得する
        String c = req.getParameter("content");
        String t = req.getParameter("tag");

        // ip.UserProfileクラスのインスタンスを生成し
        // ユーザー名やパスワードをリセットする
        ip.Post post = new ip.Post();
        post.setContent(c);
        post.setTag(tag);

        // HttpServletRequestの実装クラスのインスタンスに
        // ip.UserProfileのインスタンスを登録する
        // この時の登録名profが式言語で使用する識別子になる
        req.setAttribute("post",post);

        // RequestDispatcherインターフェイスを実装するクラスのインスタンスを取得する
        // 引数は転送先のURL
        RequestDispatcher dispatcher =
                req.getRequestDispatcher("thread");

        //転送先に要求を転送する
        dispatcher.forward(req, res);
    }
}

// javac -cp C:\tomcat8.5\lib\servlet-api.jar ShareServlet.java
