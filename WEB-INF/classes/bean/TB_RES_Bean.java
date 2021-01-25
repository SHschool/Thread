package bean;

import java.io.Serializable;
import java.sql.Date;

public class TB_RES_Bean implements Serializable {
    private int res_id; //レスID
    private String res_name; // レスの名前
    private String res_content; // レスの本文
    private int res_likes; // いいね数
    private Date res_date; // 投稿日時
    private int res_count; // 返信数
    private int thread_id; // スレッドID

    public TB_RES_Bean(){}

    public TB_RES_Bean(int res_id, String res_name, String res_content, int res_likes, Date res_date, int res_count, int thread_id) {
        this.res_id = res_id;
        this.res_name = res_name;
        this.res_content = res_content;
        this.res_likes = res_likes;
        this.res_date = res_date;
        this.res_count = res_count;
        this.thread_id = thread_id;
    }

    public int getRes_id() {
        return res_id;
    }

    public String getRes_name() {
        return res_name;
    }

    public String getRes_content() {
        return res_content;
    }

    public int getRes_likes() {
        return res_likes;
    }

    public Date getRes_date() {
        return res_date;
    }

    public int getRes_count() {
        return res_count;
    }

    public int getThread_id() {
        return thread_id;
    }
}
