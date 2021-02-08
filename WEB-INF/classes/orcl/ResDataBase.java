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
import bean.TB_RES_Bean;

public class ResDataBase{
    private ArrayList<TB_RES_Bean> _list = new ArrayList<TB_RES_Bean>();
    private boolean insertFlag = false; //insertの判定フラグ
     
    public boolean IsResInsert(String name,String content,int thread_id){ //返信情報をoracleにinsertするメソッド
        try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO TB_RES(res_id,res_name,res_content,res_date,thread_id) VALUES(resId.NEXTVAL";
			String sql2=")";
			name = ",'" + name + "'";
            content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql + name + content + ",sysdate," + thread_id);
			
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

    public ArrayList<TB_RES_Bean> SelectResInfo(int threadId){ //返信情報を取得してArrayListで返す
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
                "info","pro");
			
			//select文
			String sql=" SELECT * FROM tb_res Where thread_Id = ";

			//Statementインターフェイスを実装するクラスをインスタンス化する
			Statement st=cn.createStatement();

			//select文を実行し
			//ResultSetインターフェイスを実装したクラスの
			//インスタンスが返る
			ResultSet rs=st.executeQuery(sql + threadId);
            //カーソルを一行だけスクロールし、データをフェッチする
            while(rs.next()){
                TB_RES_Bean resInfo = new TB_RES_Bean(); //beanのインスタンス生成

                String id=rs.getString(1);	//1列目のデータを取得
                String name=rs.getString(2);	//2列目のデータを取得
                String content=rs.getString (3);	//3列目のデータを取得
                String date=rs.getString (5);	//4列目のデータを取得
                String thread_id=rs.getString(7);	//5列目のデータを取得

                resInfo.setRes_id(Integer.parseInt(id));
                resInfo.setRes_name(name);
                resInfo.setRes_content(content);
                resInfo.setRes_date(date);
                resInfo.setThread_id(Integer.parseInt(thread_id));

                _list.add(resInfo);
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
