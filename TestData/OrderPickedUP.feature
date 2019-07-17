Feature: OrderPickedUp

Background:
* url deep
* def time = DeepPublishWaiteTime
* def request_uuid = eventID1
* def request_Date = date
* print request_Date

* print rd1 = rd1
* print rd1


* def startDate = startDate
* print "StartDate:"+ startDate


* def endDate = endDate
* print "EndDate:"+ endDate


    * def data = read('classpath:OrderPickedUP.json')
    
* def sleep =
      """
      function(seconds){
        for(i = 0; i <= seconds; i++)
        {
          java.lang.Thread.sleep(1*1000);
          karate.log(i);
        }
      }
      """
Scenario Outline: Publish OrderPickedUp to DEEP
    Given path '/OrderPickedUp'
    * def ExpShipping_StateCode = '<Shipping_StateCode>'
    * def ExpShipping_Country = '<Shipping_Country>'
    * def ExpTemplateID = '<Exp_TemplateID>'
        
        
      And request data
      And  configure ssl = true
    When method POST
    Then status 200
    And match response contains {"message":"Message Published Successfully"}
    * call sleep DeepPublishWaiteTime
    Given url history
    * print history
    And  configure ssl = true
    When method GET
    * def req = response
    * print req
    
      * def smsdatas = karate.jsonPath(response, "$.notification[?(@.type =='SMS')][?(@.status =='SENT')].message[*].text")
  
      * def Expected_sms = "Your T-Mobile order# " + rd1 + " has shipped! Visit t-mo.co/shipment to check status of your order. Visit t-mo.co/guide for tips to set-up your new device."
 
      * def smsdata = smsdatas.get(0)
     * print "SMS_Data:" +smsdata

     * def smsdata1 = smsdatas.get(1)
     * print "SMS_Data1:" +smsdata1
     
     * def extracted_sms = smsdata.trim().split(',')
         
      * def extracted_sms = extracted_sms.get(5)
      * print "SMS:" +extracted_sms
                    
      * def extracted_sms1 = smsdata1.trim().split(',')
         
      * def extracted_sms1 = extracted_sms1.get(5)
      * print "SMS1:" +extracted_sms1
             
       * match extracted_sms == Expected_sms
       * match extracted_sms1 == Expected_sms
       
         * def EmailData = karate.jsonPath(response, "$.notification[?(@.type =='Email')][?(@.status =='SENT')].message[*].text")
   * def Email_Data1 = EmailData.get(0)
 * xml xmldata1 = Email_Data1
 * print xmldata1
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
 
 
 * def Email_Data2 = EmailData.get(1)
 * xml xmldata2 = Email_Data2
 * print xmldata2
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

 * print  ExpShipping_StateCode 
 * print ExpShipping_Country 
    * print ExpTemplateID 
    
      * match actualShippingStateCode == ExpShipping_StateCode
      * match actualShippingCountry == ExpShipping_Country
      * match actualTemplateId == ExpTemplateID
      
      * match actualShippingStateCode_1 == ExpShipping_StateCode
      * match actualShippingCountry1 == ExpShipping_Country
      * match actualTemplateId1 == ExpTemplateID
                      
  Examples:
    | Shipping_StateCode |Shipping_Country |Exp_TemplateID |
    | GA  | US  | ORDERSHIPPEDNOTRADEIN
 
 
 
 
 
 