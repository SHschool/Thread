package orcl;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.math.BigDecimal;
import java.util.ArrayList;
import bean.TB_RES_Bean;
import bean.TB_POST_Bean;

public class ResDataBase{
    private ArrayList<TB_RES_Bean> _list = new ArrayList<TB_RES_Bean>();
    private boolean insertFlag = false; //insertの判定フラグ
     
    public boolean IsResInsert(String name,String content,int thread_id){ //返信情報をoracleにinsertするメソッド
        try{
            String sql=
                "INSERT INTO TB_RES(res_id,res_name,res_content,res_date,thread_id) VALUES(resId.NEXTVAL,'" 
                + name + "','" 
                + content + "'," 
                + "sysdate," 
                + thread_id + ")";

            ResultSet rs = sqlNecessary.execute(sql);
            
            //Oracleから切断する
            sqlNecessary.closeDB();

            insertFlag = true;
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
        return insertFlag;
    }

public ArrayList<TB_RES_Bean> SelectResInfo(int threadId){ //返信情報を取得してArrayListで返す
    try{
        //select文
        String sql=
            "SELECT res_id,res_name,res_content,to_char(res_date,'HH24:mi yyyy/mm/dd'),thread_id" 
            + "FROM tb_res WHERE thread_id = " 
            + threadId 
            + "ORDER BY res_date DESC";

        ResultSet rs = sqlNecessary.execute(sql);

        //カーソルを一行だけスクロールし、データをフェッチする
        while(rs.next()){
            TB_RES_Bean resInfo = new TB_RES_Bean(); //beanのインスタンス生成

            String id=rs.getString(1);	//1列目のデータを取得
            String name=rs.getString(2);	//2列目のデータを取得
            String content=rs.getString (3);	//3列目のデータを取得
            String date=rs.getString (4);	//4列目のデータを取得
            String thread_id=rs.getString(5);	//5列目のデータを取得

            resInfo.setRes_id(Integer.parseInt(id));
            resInfo.setRes_name(name);
            resInfo.setRes_content(content);
            resInfo.setRes_date(date);
            resInfo.setThread_id(Integer.parseInt(thread_id));

            _list.add(resInfo); 
        }


        //Oracleから切断する
        sqlNecessary.closeDB();
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

    public TB_POST_Bean selectResTargetThread(int threadId){
        TB_POST_Bean targetThread = new TB_POST_Bean();

        try{
            //select文
            String sql=
                "SELECT thread_id,user_name,content,tag,to_char(thread_date,'HH24:mi yyyy/mm/dd'),likes"
                + " FROM tb_post WHERE thread_id = "
                + threadId;

            ResultSet rs = sqlNecessary.execute(sql);

            while(rs.next())
            {
                String id = rs.getString(1); // 1列目のデータを取得
                String name = rs.getString(2); // 2列目のデータを取得
                String content = rs.getString(3); // 3列目のデータを取得
                String tag = rs.getString(4); // 4列目のデータを取得
                String date = rs.getString(5); // 5列目のデータを取得
                String likes = rs.getString(6); // 6列目のデータを取得
                
                targetThread.setThread_id(Integer.parseInt(id));
                targetThread.setUser_name(name);
                targetThread.setContent(content);
                targetThread.setTag(tag);
                targetThread.setDate(date);
                targetThread.setLikes(Integer.parseInt(likes));
            }


            //Oracleから切断する
            sqlNecessary.closeDB();
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
        
        //beanのインスタンスを返す。
        return targetThread;
    }
}
