cd ../
cd c:/rjp_web/WEB-INF/classes
javac -classpath c:\tomcat8.5\lib\servlet-api.jar ThreadServlet.java orcl/ThreadDataBase.java orcl/sqlNecessary.java bean/TB_POST_Bean.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar ResServlet.java orcl/ResDataBase.java orcl/sqlNecessary.java bean/TB_RES_Bean.java bean/TB_POST_Bean.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar LoginServlet.java orcl/UserInfoDataBase.java orcl/sqlNecessary.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar LogoutServlet.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar LikeServlet.java orcl/ThreadDataBase.java orcl/sqlNecessary.java bean/TB_POST_Bean.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar DeleteServlet.java orcl/ThreadDataBase.java orcl/sqlNecessary.java bean/TB_POST_Bean.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar RegistServlet.java orcl/UserInfoDataBase.java orcl/sqlNecessary.java

javac -classpath c:\tomcat8.5\lib\servlet-api.jar SearchServlet.java orcl/ThreadDataBase.java orcl/sqlNecessary.java bean/TB_POST_Bean.java

