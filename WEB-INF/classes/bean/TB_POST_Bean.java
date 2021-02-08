package bean;

import java.io.Serializable;

public class TB_POST_Bean implements Serializable {
    private int thread_id; // スレッドID
    private String user_name; //ユーザ名
    private String content; // 本文
    private String tag; // タグ
    private String date; // 投稿日時
    private int likes; //いいね数

    public TB_POST_Bean(){}

    public TB_POST_Bean(int thread_id, String user_name, String content, String tag, String date, int likes) {
        this.thread_id = thread_id;
        this.user_name = user_name;
        this.content = content; 
        this.tag = tag;
        this.date = date;
        this.likes = likes;
    }

    public void setThread_id(int id){
        thread_id = id;
    }

    public void setUser_name(String name){
        user_name = name;
    }

    public void setContent(String content){
        this.content = content;
    }

    public void setTag(String tag){
        this.tag = tag;
    }

    public void setLikes(int likes){
        this.likes = likes;
    }

    public void setDate(String date){
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

    public String getDate() {
        return date;
    }

    public int getLikes(){
        return likes;
    }
}
