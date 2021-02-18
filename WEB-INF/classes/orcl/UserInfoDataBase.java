package orcl;

import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.math.BigDecimal;
import bean.UserInfoBean;

public class UserInfoDataBase{
    private boolean insertFlag = false; // �o�^����t���O
    private boolean selectFlag = false; // ���O�C���t���O
    private UserInfoBean user = new UserInfoBean(); //bean

    public boolean insertUserInfo(String name,String pass){ // �V�K����o�^����}��
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = "INSERT INTO userInfo(userId,name,pass) VALUES(seq_userId.NEXTVAL,'" + name + "','" + pass + "')";

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            // Oracle����ؒf����
            cn.close();

            insertFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return insertFlag;
    }

    public boolean selectLoginInfo(String name,String pass){
        try{

            int count = 0; // �f�[�^�̎擾��

            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = "select userId,name,pass from userInfo where pass = '" + pass + "'";

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){
                int userId = rs.getInt(1);
                String userName = rs.getString(2);
                String password = rs.getString(3);

                count++;
            }

            if(count == 1){
                selectFlag = true;
            }

            // Oracle����ؒf����
            cn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return selectFlag;
    }

    public UserInfoBean selectUserName(String pass){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = "select name from userInfo Where pass = '" + pass + "'";

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);

            while(rs.next()){
                String name = rs.getString(1);

                user.setUserName(name);
            }

            // Oracle����ؒf����
            cn.close();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user; 
    }
}
