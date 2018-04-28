package cn.com.gtmc.glaf2.code;

import java.sql.DatabaseMetaData;
import java.sql.ResultSet;

public class Main {
	public static void main(String[] args)throws Exception{
		
//		String url = "jdbc:oracle:thin:@182.151.199.112:2525:ORCL";
		//Oracle
//		String url = "jdbc:oracle:thin:@192.168.138.248:1521:ORCL";
//		String user = "PGPRO";
//		String password = "pg666";
//		String tableName = "COM_SERIAL_NUMBER";
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		
		
		//mysql
		String url = "jdbc:mysql://192.168.66.134:3306/glaf2?useUnicode=true&characterEncoding=utf-8";
		String user = "root";
		String password = "root";
		Class.forName("com.mysql.jdbc.Driver");
		
		java.sql.Connection conn = java.sql.DriverManager.getConnection(url, user, password);
		
		DatabaseMetaData dmd = conn.getMetaData();
		
		String tableName = "u_dept";
		
		ResultSet rs = dmd.getColumns(conn.getCatalog(),user,tableName,null);
		
		String cols = "";
		String insert = "insert into " + tableName + "(id,<include refid=\"base_column\"/>)values(\n";
		String update = "update " + tableName + " set \n";
		while(rs.next()){
			String columnName = rs.getString("COLUMN_NAME");
			String columnType = rs.getString("TYPE_NAME"); 
			String underName = underlineToCamel(columnName.toLowerCase());
			
			//System.out.println(columnType);
			
			if("VARCHAR2".equals(columnType) || "VARCHAR".equals(columnType)){
				System.out.println("private String " + underName + ";");
				
				insert += "#{" + underName + ",jdbcType=VARCHAR},\n";
				update += columnName.toLowerCase() + "=  #{" + underName + ",jdbcType=VARCHAR},\n";
			}else if("DATE".equals(columnType) || "DATETIME".equals(columnType)){
				System.out.println("private Date " + underName + ";\n");
				insert += "#{" + underName + ",jdbcType=TIMESTAMP},\n";
				update += columnName.toLowerCase() + "=  #{" + underName + ",jdbcType=TIMESTAMP},\n";
			}else if("NUMBER".equals(columnType) || "INT".equals(columnType)){
				System.out.println("private Integer " + underName + ";");
				insert += "#{" + underName + ",jdbcType=INTEGER},\n";
				update += columnName.toLowerCase() + "=  #{" + underName + ",jdbcType=INTEGER},\n";
			}
			
			cols += columnName.toLowerCase() + ",";
		}
		
		update = update.substring(0,update.length()-1);
		update += "\n where id = #{id,jdbcType=VARCHAR}";
		
		System.out.println(cols.substring(0,cols.length() -1));
		System.out.println("=========================================\n");
		System.out.println(insert.substring(0,insert.length()-2) + ")");
		System.out.println("=========================================\n");
		System.out.println(update);
		conn.close();
	}
	
	
	 public static String underlineToCamel(String param){  
	       if (param==null||"".equals(param.trim())){  
	           return "";  
	       }  
	       int len=param.length();  
	       StringBuilder sb=new StringBuilder(len);  
	       for (int i = 0; i < len; i++) {  
	           char c=param.charAt(i);  
	           if (c=='_'){  
	              if (++i<len){  
	                  sb.append(Character.toUpperCase(param.charAt(i)));  
	              }  
	           }else{  
	               sb.append(c);  
	           }  
	       }  
	       return sb.toString();  
	   }  
	
}

