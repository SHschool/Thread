CREATE TABLE TB_POST(
     thread_id  NUMBER(10)      NOT NULL
    ,user_name  VARCHAR2(20)    NOT NULL
    ,content    VARCHAR2(560)   NOT NULL
    ,tag        VARCHAR2(60)
    ,thread_date       DATE
    ,likes      NUMBER(8)       DEFAULT 0
    ,postedById number(8)       NOT NULL
    ,CONSTRAINT pk_threadid   PRIMARY KEY(thread_id)
    ,constraint fk_user_id foreign key(postedById) references userInfo(userId)
);

CREATE TABLE TB_RES(
     res_id         NUMBER(10)      NOT NULL
    ,res_name       VARCHAR2(20)    NOT NULL
    ,res_content    VARCHAR2(280)   NOT NULL
    ,res_date       DATE
    ,thread_id      NUMBER(10)      NOT NULL
    ,CONSTRAINT     pk_resid    PRIMARY KEY(res_id)
    ,CONSTRAINT     fk_threadid FOREIGN KEY(thread_id) REFERENCES TB_POST(thread_id)
);

create sequence threadId
start with 1
increment by 1
nocycle;

create sequence resId
start with 1
increment by 1
nocycle;

create table userInfo(
userId number(8) not null constraint pk_user_id primary key,
name varchar2(20) not null,
pass varchar2(10) not null constraint uq_pass unique
);

create sequence seq_userId start with 1 increment by 1; 

create table userInfo(
    userId number(8) constraint pk_user_Id primary key,
    name varchar2(20) not null,
    pass varchar2(10) not null constraint uq_pass unique
);

create sequence seq_userId
    start with 1
    increment by 1
    nocycle;

alter table tb_post 
add(postedById number(8) not null 
constraint fk_postedById references userInfo(userId));

alter table tb_post drop column user_name;
