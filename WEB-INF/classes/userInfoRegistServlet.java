
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException; 
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInfoRegistServlet extends HttpServlet{
    //ArrayList使用
    private ArrayList<  > userInfo = new ArrayList<  >();

    public void doPost(HttpServletRequest req,HttpServletResponse res) 
    throws IOException,ServletException{
        //エンコード設定
        req.setCharacterEncoding("Windows-31J");

        //POST要求の値を取得
        int id = req.getParameter("id");
        String name = req.getParameter("name");

        //Insertクラスをインスタンス化して値を渡す。（比嘉のクラスをここで使う）

        //値をJSPに渡すため登録

        RequestDispatcher dis = req.getRequestDispatcher("sendPost"); //掲示板スレッド画面へ情報を送る
        dis.forward(req,res);
    }
}
