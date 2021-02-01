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

package orcl;

public class ThreadDataBase{

	// public static void main(String[] args){
	private boolean insertFlag = false;
	public ArrayList<String> list = new ArrayList<String>();

	public boolean IsThreadInsert(int id,String name,String content) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracle�ɐڑ�����
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO tb_post(thread_id,user_name,content,thread_date) VALUES(";
			String sql2=",SYSDATE)";
			name = ",'" + name + "'";
			content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+id+name+content+sql2);
			
			//Oracle����ؒf����
			cn.close();

			insertFlag = true;
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("�N���X���Ȃ��݂����B");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("SQL�֘A�̗�O�݂����B");
		}catch(Exception e){
			e.printStackTrace();
		}
		return insertFlag;
	}
	public boolean IsThreadInsert(int id,String name,String content,String tag) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracle�ɐڑ�����
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO tb_post(thread_id,user_name,content,tag,thread_date) VALUES(";
			String sql2=",SYSDATE)";
			name = ",'" + name + "'";
			content = ",'" + content + "'";
			tag = ",'" + tag + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+id+","+name+","+content+tag+sql2);
						
			//Oracle����ؒf����
			cn.close();

			insertFlag = true;
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("�N���X���Ȃ��݂����B");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("SQL�֘A�̗�O�݂����B");
		}catch(Exception e){
			e.printStackTrace();
		}
		return insertFlag;
	}
	public ArrayList SelectResInfo(){ //�ԐM�����擾����ArrayList�ŕԂ�
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracle�ɐڑ�����
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
                "info","pro");
			
			//select��
			String sql=" SELECT * FROM tb_post";

			//Statement�C���^�[�t�F�C�X����������N���X���C���X�^���X������
			Statement st=cn.createStatement();

			//select�������s��
			//ResultSet�C���^�[�t�F�C�X�����������N���X��
			//�C���X�^���X���Ԃ�
			ResultSet rs=st.executeQuery(sql);
            //�J�[�\������s�����X�N���[�����A�f�[�^���t�F�b�`����
            rs.next(); 
            String id=rs.getString(1);	//1��ڂ̃f�[�^���擾
            String name=rs.getString(2);	//2��ڂ̃f�[�^���擾
			String content=rs.getString (3);	//3��ڂ̃f�[�^���擾
            String tag=rs.getString (4);	//4��ڂ̃f�[�^���擾
            String date=rs.getString (5);	//5��ڂ̃f�[�^���擾

            _list.add(id);
            _list.add(name);
            _list.add(content);
            _list.add(tag);
            _list.add(date);


            //Oracle����ؒf����
            cn.close();
        
        catch(ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("�N���X���Ȃ��݂����B");
            }catch(SQLException e){
            e.printStackTrace();
            System.out.println("SQL�֘A�̗�O�݂����B");
            }catch(Exception e){
            e.printStackTrace();
            }
        }
        return _list;
    }
}