import java.io.IOException;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.math.BigDecimal;
package orcl;
public class insertThread{
	// public static void main(String[] args){
	private boolean insertFlag = false;
	public boolean IsThreadInsert(int id,String name,String content) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO tb_post(thread_id,user_name,content,thread_date) VALUES(";
			String sql2=",SYSDATE)";
			name = ",'" + name + "'";
			content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+id+","+name+","+content+sql2);

			
			//Oracleから切断する
			cn.close();

			insertFlag = true;
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("クラスがないみたい。");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("SQL関連の例外みたい。");
		}catch(Exception e){
			e.printStackTrace();
		}
		return insertFlag;
	}
	public boolean IsThreadInsert(int id,String name,String content,String tag) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
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

			
			//Oracleから切断する
			cn.close();

			insertFlag = true;
		}catch(ClassNotFoundException e){
			e.printStackTrace();
			System.out.println("クラスがないみたい。");
		}catch(SQLException e){
			e.printStackTrace();
			System.out.println("SQL関連の例外みたい。");
		}catch(Exception e){
			e.printStackTrace();
		}
		return insertFlag;
	}
}
