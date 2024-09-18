package hospital.management.system;
import java.sql.*;
public class Database {
    private static Connection con;
    private static String connectionString = "jdbc:mysql://127.0.0.1:3306/hms";
    private static String userName = "root";
    private static String password = ""; 
    
    static{
        con = null;
    }
        
    public static Connection getConnection() throws SQLException{        
        //establish db connection
        if(con==null)
            con = DriverManager.getConnection(connectionString, userName, password);        
        return con;    
    }
       
}
