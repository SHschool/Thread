package bean;

import java.io.Serializable;

public class TB_POST_Bean implements Serializable {
    private int thread_id; // �X���b�hID
    private String user_name; //���[�U��
    private String content; // �{��
    private String tag; // �^�O
    private String date; // ���e����
    private int likes;  // ������

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

    public void setDate(String date){
        this.date = date;
    }

    public void setLikes(int likes){
        this.likes = likes;
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

    public int getLikes() {
        return likes;
    }
}