@ignore
Feature: the name is expected to be set as a call arg


  Background:

Scenario:

   * xml xmldata1 = HistoryData.xmldata   
       
          * print xmldata1
          
       * xml xmldata2 = HistoryData.xmldata1  
        
           * print xmldata2

 * def actualFullName = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "FullName"]/@value')
 * print "ActualFullName:" + actualFullName
 
 * def actualOrderNumber = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "OrderNumber"]/@value')
 * print "ActualFullName:" + actualOrderNumber
 
 * def actualOrderDate = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "OrderDate"]/@value')
 * print "ActualOrderDate:" + actualOrderDate
  
 * def actualUpgradeDeviceDescription = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "UpgradeDeviceDescription"]/@value')
 * print "ActualUpgradeDeviceDescription:" + actualUpgradeDeviceDescription
 
 * def actualShippingTrackingNumber = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingTrackingNumber"]/@value')
 * print "ActualShippingTrackingNumber:" + actualShippingTrackingNumber
 
 * def actualShippingMethod = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingMethod"]/@value')
 * print "ActualShippingMethod:" + actualShippingMethod
 
 * def actualShippingAddressLine1 = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingAddressLine1"]/@value')
 * print "ActualShippingAddressLine1:" + actualShippingAddressLine1
 
  * def actualShippingAddressLine2 = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingAddressLine2"]/@value')
 * print "ActualShippingAddressLine2:" + actualShippingAddressLine2
 
  * def actualShippingAddressLine3 = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingAddressLine3"]/@value')
 * print "ActualShippingAddressLine3:" + actualShippingAddressLine3
 
   * def actualShippingCityName = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingCityName"]/@value')
 * print "ActualShippingCityName:" + actualShippingCityName
 
    * def actualShippingStateCode = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingStateCode"]/@value')
 * print "ActualShippingStateCode:" + actualShippingStateCode
 
   * def actualShippingZipCode = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingZipCode"]/@value')
 * print "ActualShippingZipCode:" + actualShippingZipCode
 
   * def actualShippingCountry = karate.xmlPath(xmldata1, '/batch/template/list/email/pdata[@key = "ShippingCountry"]/@value')
 * print "ActualShippingCountry:" + actualShippingCountry
 
    * def actualTemplateId = karate.xmlPath(xmldata1, '/batch/template/content/@ref')
 * print "ActualTemplateId:" + actualTemplateId
 

 * def actualFullName_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "FullName"]/@value')
 * print "ActualFullName1:" + actualFullName_1
 
 * def actualOrderNumber_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "OrderNumber"]/@value')
 * print "ActualOrderNumber11:" + actualOrderNumber_1
 
 * def actualOrderDate_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "OrderDate"]/@value')
 * print "ActualOrderDate1:" + actualOrderDate_1
  
 * def actualUpgradeDeviceDescription_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "UpgradeDeviceDescription"]/@value')
 * print "ActualUpgradeDeviceDescription1:" + actualUpgradeDeviceDescription_1
 
 * def actualShippingTrackingNumber_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingTrackingNumber"]/@value')
 * print "ActualShippingTrackingNumber1:" + actualShippingTrackingNumber_1
 
 * def actualShippingMethod_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingMethod"]/@value')
 * print "ActualShippingMethod1:" + actualShippingMethod_1
 
 * def actualShippingAddressLine1_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingAddressLine1"]/@value')
 * print "ActualShippingAddressLine1_1:" + actualShippingAddressLine1_1
 
  * def actualShippingAddressLine2_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingAddressLine2"]/@value')
 * print "ActualShippingAddressLine2_1:" + actualShippingAddressLine2_1
 
  * def actualShippingAddressLine3_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingAddressLine3"]/@value')
 * print "ActualShippingAddressLine3_1:" + actualShippingAddressLine3_1
 
   * def actualShippingCityName_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingCityName"]/@value')
 * print "ActualShippingCityName1:" + actualShippingCityName_1
 
    * def actualShippingStateCode_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingStateCode"]/@value')
 * print "ActualShippingStateCode1:" + actualShippingStateCode_1
 
   * def actualShippingZipCode_1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingZipCode"]/@value')
 * print "ActualShippingZipCode1:" + actualShippingZipCode_1
 
   * def actualShippingCountry1 = karate.xmlPath(xmldata2, '/batch/template/list/email/pdata[@key = "ShippingCountry"]/@value')
 * print "ActualShippingCountry1:" + actualShippingCountry1
 
 * def actualTemplateId1 = karate.xmlPath(xmldata2, '/batch/template/content/@ref')
 * print "ActualTemplateId1:" + actualTemplateId1
    