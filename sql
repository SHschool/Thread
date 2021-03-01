CREATE TABLE TB_POST(
     thread_id  NUMBER(10)      NOT NULL
    ,user_name  VARCHAR2(20)    NOT NULL
    ,content    VARCHAR2(560)   NOT NULL
    ,tag        VARCHAR2(60)
    ,thread_date       DATE
    ,likes      NUMBER(8)       DEFAULT 0
    ,CONSTRAINT pk_threadid   PRIMARY KEY(thread_id)
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

create sequence resId
start with 1
increment by 1
nocycle;