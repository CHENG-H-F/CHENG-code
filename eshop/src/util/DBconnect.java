package util;

import java.sql.*;

public class DBconnect
{
    static String url = "jdbc:mysql://localhost:3306/eshop_database?useSSL=false&serverTimezone=UCT";
    static String user = "root";
    static String password = "0184290";
    static Connection conn = null;
    static PreparedStatement ps = null;
    static ResultSet rs = null;
    
    //初始化
    public static void init() throws SQLException, ClassNotFoundException
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");	//注册驱动
            conn = DriverManager.getConnection(url, user, password);	//建立连接
        }
        catch (Exception e)
        {
            System.out.println("SQL程序初始化失败");
            e.printStackTrace();
        }
    }
    
    //查
    public static ResultSet selectSql(String sql)
    {
        try
        {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
        }
        catch(Exception e)
        {
            System.out.println("数据库查询异常");
            e.printStackTrace();
        }
        
        return rs;
    }

    //增改删
    public static int addUpdateDelete(String sql) throws SQLException
    {
        int i = 0;
        
        try
        {
            ps = conn.prepareStatement(sql);
            boolean flag = ps.execute();
            
            //如果第一个结果是结果集对象，则返回true;如果第一个结果是更新计数或者没有结果，则返回false
            if(flag == false)
            {
                i++;
            }
        }
        catch(Exception e)
        {
            System.out.println("数据库增删改异常 ");
            e.printStackTrace();
        }
        
        return i;
    }

    //关闭连接
    public static  void closeConn()
    {
        try
        {
            conn.close();
        }
        catch(Exception e)
        {
            System.out.println("数据库关闭异常");
            e.printStackTrace();
        }
    }
    
    //关闭PreparedStatement
    public static void closePs()
    {
        try
        {
            ps.close();
        }
        catch(Exception e)
        {
            System.out.println("PreparedStatement关闭异常");
            e.printStackTrace();
        }
    }
    
   //关闭ResultSet
    public static void closeRs()
    {
        try
        {
            rs.close();
        }
        catch(Exception e)
        {
            System.out.println("ResultSet关闭异常");
            e.printStackTrace();
        }
    }
}