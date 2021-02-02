
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

	public boolean IsThreadInsert(String name,String content) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO tb_post(thread_id,user_name,content,thread_date) VALUES(threadId.NEXTVAL";
			String sql2=",SYSDATE)";
			name = ",'" + name + "'";
			content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+name+content+sql2);
			
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
	public boolean IsThreadInsert(String name,String content,String tag) {
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO tb_post(thread_id,user_name,content,tag,thread_date) VALUES(threadId.NEXTVAL";
			String sql2=",SYSDATE)";
			name = ",'" + name + "'";
			content = ",'" + content + "'";
			tag = ",'" + tag + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+name+content+tag+sql2);
						
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
	public ArrayList<TB_POST_Bean> SelectThreadInfo(){ //返信情報を取得してArrayListで返す
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
                "info","pro");
			
			//select文
			String sql=" SELECT * FROM tb_post";

			//Statementインターフェイスを実装するクラスをインスタンス化する
			Statement st=cn.createStatement();

			//select文を実行し
			//ResultSetインターフェイスを実装したクラスの
			//インスタンスが返る
			ResultSet rs=st.executeQuery(sql);
			//カーソルを一行だけスクロールし、データをフェッチする
            while(rs.next()){
				TB_POST_Bean user = new TB_POST_Bean();

				String id=rs.getString(1);	//1列目のデータを取得
				String name=rs.getString(2);	//2列目のデータを取得
				String content=rs.getString (3);	//3列目のデータを取得
				String tag=rs.getString (4);	//4列目のデータを取得
				String date=rs.getString (5);	//5列目のデータを取得

				user.setUser_name(name);
				user.setContent(content);
				user.setTag(tag);

				_list.add(user);
			}

            //Oracleから切断する
            cn.close();
		}
        catch(ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
            }catch(SQLException e){
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
            }catch(Exception e){
            e.printStackTrace();
			}
			
			return _list;
        }
    }
