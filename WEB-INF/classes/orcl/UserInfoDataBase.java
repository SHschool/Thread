package orcl;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.math.BigDecimal;

public class UserInfoDataBase{
    private boolean insertFlag = false; // �o�^����t���O
    private boolean selectFlag = false; // ���O�C���t���O

    public boolean insertUserInfo(String name,String pass) throws SQLException{ // �V�K����o�^����}��
        try{
            String sql =
                "INSERT INTO userInfo(userId,name,pass) VALUES(seq_userId.NEXTVAL,'" 
                + name + "','" 
                + pass + "')";

            ResultSet rs = sqlNecessary.execute(sql);

            // Oracle����ؒf����
            sqlNecessary.closeDB();

            insertFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } 
        return insertFlag;
    }

    public boolean selectLoginInfo(String name,String pass){
        try{

            int count = 0; // �f�[�^�̎擾��

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

            // Oracle����ؒf����
            sqlNecessary.closeDB();
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

    public String selectUserName(String pass){
        String userName = "";
        try{
            String sql = "select name from userInfo Where pass = '" + pass + "'";

            ResultSet rs = sqlNecessary.execute(sql);

            while(rs.next()){
                userName = rs.getString(1);
            }

            // Oracle����ؒf����
            sqlNecessary.closeDB();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userName; 
    }

}
