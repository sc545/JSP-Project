package bean;
import java.sql.*;

public class DB{
	private String id;
	private String pass;
	private String logId;
	private String logPass;
	private int result;

	public int loginCheck(String id, String pass){
		try{
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}catch(ClassNotFoundException ce){}

		try{
		
			String url = "jdbc:odbc:dbMember";
				
			Connection conn = DriverManager.getConnection(url, "", "");
			Statement stmt = conn.createStatement();
			
			String strSQL = "SELECT * FROM tblMember WHERE id='"+id+"'";
			ResultSet rs = stmt.executeQuery(strSQL);
			while(rs.next()){
				logId = rs.getString("id");
				logPass = rs.getString("pass");
			}
		
			if(logId==null){
				result = 0;
			}else if(!pass.equals(logPass)){
				result = 1;	
			
			}else{	
				result = 2;
			}
		
		rs.close();
		stmt.close();
		conn.close();
		
		}catch(SQLException ex){}
		
		return result;
	}	
	
	public static DB getInstance(){
		return new DB();
	}
	
}