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
import java.util.ArrayList;
import bean.TB_POST_Bean;

public class ThreadDataBase{

    // public static void main(String[] args){
    private boolean insertFlag = false;
    public ArrayList<TB_POST_Bean> _list = new ArrayList<TB_POST_Bean>();
    private boolean addFlag = false;

    public boolean IsThreadInsert(String name, String content, String tag) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = "INSERT INTO tb_post(thread_id,user_name,content,tag,thread_date) VALUES(threadId.NEXTVAL";
            String sql2 = ",SYSDATE)";
            name = ",'" + name + "'";
            content = ",'" + content + "'";
            tag = ",'" + tag + "'";

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql + name + content + tag + sql2);

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

    public ArrayList<TB_POST_Bean> SelectThreadInfo() { // �ԐM�����擾����ArrayList�ŕԂ�
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            // select��
            String sql = " SELECT thread_id,user_name,content,tag,to_char(thread_date,'HH24:mi yyyy/mm/dd'),likes FROM tb_post ORDER BY thread_date DESC";

            // Statement�C���^�[�t�F�C�X����������N���X���C���X�^���X������
            Statement st = cn.createStatement();

            // select�������s��
            // ResultSet�C���^�[�t�F�C�X�����������N���X��
            // �C���X�^���X���Ԃ�
            ResultSet rs = st.executeQuery(sql);
            // �J�[�\������s�����X�N���[�����A�f�[�^���t�F�b�`����
            while (rs.next()) {
                TB_POST_Bean user = new TB_POST_Bean();

                String id = rs.getString(1); // 1��ڂ̃f�[�^���擾
                String name = rs.getString(2); // 2��ڂ̃f�[�^���擾
                String content = rs.getString(3); // 3��ڂ̃f�[�^���擾
                String tag = rs.getString(4); // 4��ڂ̃f�[�^���擾
                String date = rs.getString(5); // 5��ڂ̃f�[�^���擾
                String likes = rs.getString(6); // 6��ڂ̃f�[�^���擾
                
                user.setThread_id(Integer.parseInt(id));
                user.setUser_name(name);
                user.setContent(content);
                user.setTag(tag);
                user.setDate(date);
                user.setLikes(Integer.parseInt(likes));

                _list.add(user);
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

        return _list;
    }

    public boolean IsAddLikesNumber(int id) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = "UPDATE tb_post SET likes = likes + 1 WHERE thread_id = ";

            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql + id);

            // Oracle����ؒf����
            cn.close();

            addFlag = true;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return addFlag;
    }

    public ArrayList<TB_POST_Bean> wordSearch(String word) {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");

            // Oracle�ɐڑ�����
            Connection cn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "info", "pro");

            String sql = " SELECT thread_id,user_name,content,tag,to_char(thread_date,'HH24:mi yyyy/mm/dd'),likes FROM tb_post WHERE tag LIKE '%" + word + "%' ORDER BY thread_date DESC";

            // Statement�C���^�[�t�F�C�X����������N���X���C���X�^���X������
            Statement st = cn.createStatement();

            // select�������s��
            // ResultSet�C���^�[�t�F�C�X�����������N���X��
            // �C���X�^���X���Ԃ�
            ResultSet rs = st.executeQuery(sql);
            // �J�[�\������s�����X�N���[�����A�f�[�^���t�F�b�`����
            while (rs.next()) {
                TB_POST_Bean user = new TB_POST_Bean();

                String id = rs.getString(1); // 1��ڂ̃f�[�^���擾
                String name = rs.getString(2); // 2��ڂ̃f�[�^���擾
                String content = rs.getString(3); // 3��ڂ̃f�[�^���擾
                String tag = rs.getString(4); // 4��ڂ̃f�[�^���擾
                String date = rs.getString(5); // 5��ڂ̃f�[�^���擾
                String likes = rs.getString(6); // 6��ڂ̃f�[�^���擾
                
                user.setThread_id(Integer.parseInt(id));
                user.setUser_name(name);
                user.setContent(content);
                user.setTag(tag);
                user.setDate(date);
                user.setLikes(Integer.parseInt(likes));

                _list.add(user);
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

        return _list;
    }
}