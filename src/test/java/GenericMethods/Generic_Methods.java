package GenericMethods;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Properties;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.apache.commons.io.FileUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;

public class Generic_Methods {
	
	public static XSSFWorkbook wb; 
	public static XSSFSheet sheet;
	public static XSSFRow row1;
	public static XSSFCell cell;
	public static FileInputStream fis;
	
	
	public static String getCellData( String fileName,String sheetname,int rowNum,String cellname)
	{
		String data="";
		
	     try {
	         
	         fis = new FileInputStream("./TestData/"+fileName+".xlsx");
	         
	         wb = new XSSFWorkbook(fis);
	         sheet= wb.getSheet(sheetname);
	         row1=sheet.getRow(0);
	         int col_num = -1;
	         
	 
	       int GetCellsCount=sheet.getRow(rowNum).getLastCellNum();
	         
	         
	         for(int i=0; i < GetCellsCount; i++)
	         {
	        	 
	              	
	             if(row1.getCell(i).getStringCellValue().trim().equals(cellname))
	             {
	            	 col_num = i;
	            	
	    	        	
	            	 data =sheet.getRow(rowNum).getCell(col_num).getStringCellValue();
	    	          
	    	           
	    	             break;
	    	         }

	               
	             }

	         
	        
	     }
	     
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	     return data;
	     
	}
	
	
    public static String getConfig(String key)
	{
		String dada="";
	try {
		
		Properties prop = new Properties();  
		
	    prop.load(new FileInputStream("./TestData/config.properties"));
		  
	    dada=prop.getProperty(key);
	   

	} 
	catch (IOException ex) {
	    ex.printStackTrace();
	}
	return dada;
	}
	
	public static void writeCellData( String fileName,String sheetname,int rowNum,String cellname, String value)
	{
		
		
	     try {
	        
	         fis = new FileInputStream("./TestData/"+fileName+".xlsx");
	         
	         wb = new XSSFWorkbook(fis);
	         sheet= wb.getSheet(sheetname);
	         row1=sheet.getRow(0);
	         int col_num = -1;
	         
	 
	       int GetCellsCount=sheet.getRow(rowNum).getLastCellNum();
	         
	         
	         for(int i=0; i < GetCellsCount; i++)
	         {
	        	 
	      
	        	
	             if(row1.getCell(i).getStringCellValue().trim().equals(cellname))
	             {
	            	 col_num = i;
	            	
	            	 sheet.createRow(rowNum).createCell(col_num).setCellValue(value);
	    	        	
	         
	            	 FileOutputStream fileOut = new FileOutputStream("./TestData/"+fileName+".xlsx");

	            	 wb.write(fileOut);

	 				fileOut.flush();        
	 				fileOut.close();
	    	             break;
	    	           
	    	       
	    	         }

	               
	             }

	         
	        
	     }
	     
	        catch (Exception e)
	        {
	            e.printStackTrace();
	        }
	     
	
	     
	}

	
	public static String getEnv()
	{
		String dada="";
		try {


			File fXmlFile = new File("./pom.xml");

			
			DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
			Document doc = dBuilder.parse(fXmlFile);
					
		    doc.getDocumentElement().normalize();

							
			NodeList nList = doc.getElementsByTagName("systemPropertyVariables");
					
	

			for (int temp = 0; temp < nList.getLength(); temp++) {

				Node nNode = nList.item(temp);
	
						
				if (nNode.getNodeType() == Node.ELEMENT_NODE) {

					Element eElement = (Element) nNode;

					dada=eElement.getElementsByTagName("Env").item(0).getTextContent();

				}
			}
		    } catch (Exception e) {
			e.printStackTrace();
		    }
	return dada;
	}
	
//	public static void folderdel(String path){
//	    File f= new File(path);
//	    if(f.exists()){
//	        String[] list= f.list();
//	        if(list.length==0){
//	            if(f.delete()){
//	                System.out.println("folder deleted");
//	                return;
//	            }
//	        }
//	        else {
//	            for(int i=0; i<list.length ;i++){
//	                File f1= new File(path+"\\"+list[i]);
//	                if(f1.isFile()&& f1.exists()){
//	                    f1.delete();
//	                }
//	                if(f1.isDirectory()){
//	                    folderdel(""+f1);
//	                }
//	            }
//	            folderdel(path);
//	        }
//	    }
//	}	
	
	public static void generateReport(String karateOutputPath) throws FileNotFoundException {        
		Collection<File> jsonFiles1 = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
        List<String> jsonPaths = new ArrayList(jsonFiles1.size());
        jsonFiles1.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
        String buildNumber = "1";
        String projectName = "maven_demo";
        boolean runWithJenkins = false;

        Configuration configuration = new Configuration(new File("target"), "Jilani_maven_demo");

        // optional configuration - check javadoc
        configuration.setRunWithJenkins(runWithJenkins);
        configuration.setBuildNumber(buildNumber);

        configuration.addClassifications("Branch", "Master");

        ReportBuilder reportBuilder1 = new ReportBuilder(jsonPaths, configuration);
        Reportable result = reportBuilder1.generateReports();
    }
	
}

