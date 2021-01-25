package bean;

import java.io.Serializable;
import java.sql.Date;

public class TB_POST_Bean implements Serializable {
    private int thread_id; // スレッドID
    private String user_name; //ユーザ名
    private String content; // 本文
    private String tag; // タグ
    private Date date; // 投稿日時

    public TB_POST_Bean(){}

    public TB_POST_Bean(int thread_id, String user_name, String content, String tag, Date date) {
        this.thread_id = thread_id;
        this.user_name = user_name;
        this.content = content;
        this.tag = tag;
        this.date = date;
    }

    public int getThread_id() {
        return thread_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public String getTag() {
        return tag;
    }

    public String getContent() {
        return content;
    }

    public Date getDate() {
        return date;
    }
}
