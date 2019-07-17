package Test;

import static org.junit.Assert.assertTrue;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.junit.BeforeClass;
import org.junit.Test;

import com.intuit.karate.KarateOptions;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;

import GenericMethods.Generic_Methods;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import net.masterthought.cucumber.Reportable;
import org.apache.commons.io.FileUtils;

@KarateOptions(tags = {"~@ignore"})

public class TestRunner extends Generic_Methods  {
	
	@Test
	  
    public void testParallel() throws FileNotFoundException {
			
	   Results results = Runner.parallel(getClass(), 5);
		
	   System.out.println("Jilani"+results.getReportDir());
	    
	  generateReport(results.getReportDir());
	   	   
	   //folderdel(results.getReportDir());
	    	
	   System.out.println("Folder_Data_Deleted");
	  
	   assertTrue(results.getErrorMessages(), results.getFailCount() == 0); 
    }
	
	
	 @BeforeClass
	    public static void beforeClass() {
	
		  String ReadEnvFromPom=getEnv();
		  
		  	        System.setProperty("karate.env", ReadEnvFromPom); 
		  	        
	    }   	
		
}