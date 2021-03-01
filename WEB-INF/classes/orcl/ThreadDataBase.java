package orcl;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.math.BigDecimal;
import java.util.ArrayList;
import bean.TB_POST_Bean;

public class ThreadDataBase{
    private boolean insertFlag = false;
    public ArrayList<TB_POST_Bean> _list = new ArrayList<TB_POST_Bean>();
    private boolean addFlag = false;
    private boolean deleteFlag = false;

    public boolean IsThreadInsert(String name, String content, String tag) {
        try {
            String sql = 
                "INSERT INTO tb_post(thread_id,user_name,content,tag,thread_date)VALUES(threadId.NEXTVAL,'" 
                + name + "','" 
                + content + "','" 
                + tag 
                + "',SYSDATE)";

            ResultSet rs = sqlNecessary.execute(sql);

            // Oracleから切断する
            sqlNecessary.closeDB();

            insertFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insertFlag;
    }

    public ArrayList<TB_POST_Bean> SelectThreadInfo() { // 返信情報を取得してArrayListで返す
        try {
            // select文
            String sql =
                " SELECT thread_id,user_name,content,tag,to_char(thread_date,'HH24:mi yyyy/mm/dd'),"
                + "likes FROM tb_post ORDER BY thread_date DESC";

            ResultSet rs = sqlNecessary.execute(sql);

            // カーソルを一行だけスクロールし、データをフェッチする
            while (rs.next()) {
                TB_POST_Bean user = new TB_POST_Bean();

                String id = rs.getString(1); // 1列目のデータを取得
                String name = rs.getString(2); // 2列目のデータを取得
                String content = rs.getString(3); // 3列目のデータを取得
                String tag = rs.getString(4); // 4列目のデータを取得
                String date = rs.getString(5); // 5列目のデータを取得
                String likes = rs.getString(6); // 6列目のデータを取得
                
                user.setThread_id(Integer.parseInt(id));
                user.setUser_name(name);
                user.setContent(content);
                user.setTag(tag);
                user.setDate(date);
                user.setLikes(Integer.parseInt(likes));

                _list.add(user);
            }

            // Oracleから切断する
            sqlNecessary.closeDB();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return _list;
    }

    public boolean IsAddLikesNumber(int id) {
        try {
            String sql = "UPDATE tb_post SET likes = likes + 1 WHERE thread_id = " + id;

            ResultSet rs = sqlNecessary.execute(sql);

            // Oracleから切断する
            sqlNecessary.closeDB();

            addFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return addFlag;
    }

    public boolean IsDeletePost(int id) {
        try {
            String sql = "DELETE FROM tb_post WHERE thread_id = " + id;

            ResultSet rs = sqlNecessary.execute(sql);

            // Oracleから切断する
            sqlNecessary.closeDB();

            deleteFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return deleteFlag;
    }

    public ArrayList<TB_POST_Bean> wordSearch(String word) {
        try {
            String sql = 
                "SELECT thread_id,user_name,content,tag,to_char(thread_date,'HH24:mi yyyy/mm/dd'),"
                + "likes FROM tb_post WHERE tag LIKE '%" + word + "%' ORDER BY thread_date DESC";

            ResultSet rs = sqlNecessary.execute(sql);

            // カーソルを一行だけスクロールし、データをフェッチする
            while (rs.next()) {
                TB_POST_Bean user = new TB_POST_Bean();

                String id = rs.getString(1); // 1列目のデータを取得
                String name = rs.getString(2); // 2列目のデータを取得
                String content = rs.getString(3); // 3列目のデータを取得
                String tag = rs.getString(4); // 4列目のデータを取得
                String date = rs.getString(5); // 5列目のデータを取得
                String likes = rs.getString(6); // 6列目のデータを取得
                
                user.setThread_id(Integer.parseInt(id));
                user.setUser_name(name);
                user.setContent(content);
                user.setTag(tag);
                user.setDate(date);
                user.setLikes(Integer.parseInt(likes));

                _list.add(user);
            }

            // Oracleから切断する
            sqlNecessary.closeDB();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return _list;
    }
}