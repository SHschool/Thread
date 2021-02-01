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

public class ResDB{
    private ArrayList<String> _list = new ArrayList<String>();
    private boolean insertFlag = false; //insert�̔���t���O
     
    public boolean IsResInsert(int id,String name,String content,int likes,String date,int count,int thread_id){ //�ԐM����oracle��insert���郁�\�b�h
        try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracle�ɐڑ�����
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO TB_RES(res_id,res_name,res_content,res_likes,res_date,res_count,thread_id) VALUES(";
			String sql2=")";
			name = ",'" + name + "'";
            content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+ id + name + content + "," + likes + ",sysdate," + count + "," + thread_id);
			
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
			String sql=" SELECT * FROM tb_res";

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
            String likes=rs.getString(4);	//4��ڂ̃f�[�^���擾
            String date=rs.getString (5);	//5��ڂ̃f�[�^���擾
            String count=rs.getString(6);	//6��ڂ̃f�[�^���擾
            String thread_id=rs.getString(7);	//7��ڂ̃f�[�^���擾

            _list.add(id);
            _list.add(name);
            _list.add(content);
            _list.add(likes);
            _list.add(date);
            _list.add(count);
            _list.add(thread_id);


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
