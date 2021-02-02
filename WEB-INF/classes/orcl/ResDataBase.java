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

public class ResDataBase{
    private ArrayList<String> _list = new ArrayList<String>();
    private boolean insertFlag = false; //insertの判定フラグ
     
    public boolean IsResInsert(int id,String name,String content,int likes,String date,int count,int thread_id){ //返信情報をoracleにinsertするメソッド
        try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
				"info","pro");

			String sql="INSERT INTO TB_RES(res_id,res_name,res_content,res_likes,res_date,res_count,thread_id) VALUES(";
			String sql2=")";
			name = ",'" + name + "'";
            content = ",'" + content + "'";

			Statement st=cn.createStatement();
			ResultSet rs=st.executeQuery(sql+ id + name + content + "," + likes + ",sysdate," + count + "," + thread_id);
			
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

    public ArrayList SelectResInfo(){ //返信情報を取得してArrayListで返す
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");

			//Oracleに接続する
			Connection cn=
				DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
                "info","pro");
			
			//select文
			String sql=" SELECT * FROM tb_res";

			//Statementインターフェイスを実装するクラスをインスタンス化する
			Statement st=cn.createStatement();

			//select文を実行し
			//ResultSetインターフェイスを実装したクラスの
			//インスタンスが返る
			ResultSet rs=st.executeQuery(sql);
            //カーソルを一行だけスクロールし、データをフェッチする
            rs.next(); 
            String id=rs.getString(1);	//1列目のデータを取得
            String name=rs.getString(2);	//2列目のデータを取得
            String content=rs.getString (3);	//3列目のデータを取得
            String likes=rs.getString(4);	//4列目のデータを取得
            String date=rs.getString (5);	//5列目のデータを取得
            String count=rs.getString(6);	//6列目のデータを取得
            String thread_id=rs.getString(7);	//7列目のデータを取得

            _list.add(id);
            _list.add(name);
            _list.add(content);
            _list.add(likes);
            _list.add(date);
            _list.add(count);
            _list.add(thread_id);


            //Oracleから切断する
            cn.close();
        
        catch(ClassNotFoundException e){
            e.printStackTrace();
            System.out.println("クラスがないみたい。");
            }catch(SQLException e){
            e.printStackTrace();
            System.out.println("SQL関連の例外みたい。");
            }catch(Exception e){
            e.printStackTrace();
            }
        }
        return _list;
    }
    
   
}
