import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
public class ResServlet extends HttpServlet {
    // ユーザー名の氏名を格納するインスタンス変数
    private String _userName;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        // 出力する内容のデータ・タイプと文字コードを指定する
        res.setContentType("text/html; charset=Windows-31J");
        // HttpResponseインターフェイスを実装するクラスのインスタンスから
        // PrintWriterのサブクラスのインスタンスを取得する
        // PrintWriter out = res.getWriter();
        // // 以下文字列を出力する
        // out.println("<html>");
        // out.println("<head>");
        // out.println("<title>氏名の確認</title>");
        // out.println("</head>");
        // out.println("<body>");
        // out.println("<p>氏名の確認＝" + _userName + "</p>");
        // out.println("</body>");
        // out.println("</html>");
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // クライアントからのrequestに含まれていたデータの
        // 文字コードを指定する
        req.setCharacterEncoding("Windows-31J");
        // クライアントからのrequestのメッセージボディに
        // 含まれていたデータを取り出す
        // エンコードされていたデータは、
        // ここでデコード（＝復元）されて取り出される。
        // String n = req.getParameter("txt");
        // // インスタンス変数に格納する
        // _userName = n;
        // String[] values = req.getParameterValues("chk");
        // // 出力する内容のデータ・タイプと文字コードを指定する
        // resp.setContentType("text/html; charset=Windows-31J");
        // // HttpResponseインターフェイスを実装するクラスのインスタンスから
        // // PrintWriterのサブクラスのインスタンスを取得する
        // PrintWriter out = resp.getWriter();
        // // 以下文字列を出力する
        // out.println("<html>");
        // out.println("<head>");
        // out.println("<title>氏名と選択されたソフトウェア</title>");
        // out.println("</head>");
        // out.println("<body>");
        // out.println("<p>氏名＝" + n + "</p>");
        // for (int i = 0; i < values.length; i++) {
        //     out.println("<p>チェック＝" + values[i] + "</p>");
        // }
        // out.println("</body>");
        // out.println("</html>");
    }
}

// javac -cp C:\tomcat8.5\lib\servlet-api.jar ShareServlet.java