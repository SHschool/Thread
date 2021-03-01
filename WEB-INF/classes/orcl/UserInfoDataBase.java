package orcl;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.math.BigDecimal;

public class UserInfoDataBase{
    private boolean insertFlag = false; // 登録判定フラグ
    private boolean selectFlag = false; // ログインフラグ

    public boolean insertUserInfo(String name,String pass) throws SQLException{ // 新規会員登録情報を挿入
        try{
            String sql =
                "INSERT INTO userInfo(userId,name,pass) VALUES(seq_userId.NEXTVAL,'" 
                + name + "','" 
                + pass + "')";

            ResultSet rs = sqlNecessary.execute(sql);

            // Oracleから切断する
            sqlNecessary.closeDB();

            insertFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
        } 
        return insertFlag;
    }

    public boolean selectLoginInfo(String name,String pass){
        try{

            int count = 0; // データの取得数

            String sql = "select userId,name,pass from userInfo where name = '" + name + "' AND pass = '" + pass + "'";

            ResultSet rs = sqlNecessary.execute(sql);

            while(rs.next()){
                int userId = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);

                count++;
            }

            if(count == 1){
                selectFlag = true;
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
        return selectFlag;
    }

    public String selectUserName(String pass){
        String userName = "";
        try{
            String sql = "select name from userInfo Where pass = '" + pass + "'";

            ResultSet rs = sqlNecessary.execute(sql);

            while(rs.next()){
                userName = rs.getString(1);
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
        return userName; 
    }

}
