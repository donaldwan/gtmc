package cn.com.gtmc.glaf2.demo;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

public class Main {
	public static void main(String[] args) throws Exception{
		POIFSFileSystem fileSystem = new POIFSFileSystem(new java.io.File(""));
		
		HSSFWorkbook workbook = new HSSFWorkbook(fileSystem);
		workbook.getSheetAt(0);
		
		workbook.close();
		
		fileSystem.close();
	}
}