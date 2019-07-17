Feature: OrderPickedUp_YAML Data

Background:
* def request_uuid = eventID1
* def request_Date = date
* print request_Date
* print rd1 = rd1
* print rd1
* def startDate = startDate
* print "StartDate:"+ startDate
* def endDate = endDate
* print "EndDate:"+ endDate
* def Event_Type = "OrderPickedUp"
* def Datalist = '5'
* def Expected_sms = "Your T-Mobile order# " + rd1 + " has shipped! Visit t-mo.co/shipment to check status of your order. Visit t-mo.co/guide for tips to set-up your new device."
  
    * def history_url = history
   
   * print "history_url:"+ history_url
   
  Scenario Outline: '<TestCase>'
  
 
   * def jsonFromYaml = read('YAMLdataFile.yaml')
     * print  jsonFromYaml
    
  * string Shipping_StateCode = jsonFromYaml.Shipping_StateCode
  
   * string Shipping_Country = jsonFromYaml.Shipping_Country
    
      * string Exp_TemplateID = jsonFromYaml.Exp_TemplateID
        * string EventType = jsonFromYaml.EventType

      
   
      * print  ExpShipping_StateCode 
      * print  ExpShipping_Country 
      * print  Exp_TemplateID 
      * print  EventType 
      
       * def data = read('classpath:OrderPickedUP.json')
 #Call DEEP SubProcess
     
* def Deepresponse = call read('../SubProcess/Deep_SubProcess.feature') 
* match  Deepresponse.DeepStatus == "Passed"
      
    #Call HistoryAPI SubProcess
      
     * def HistoryData = call read('../SubProcess/History_Subprocess.feature')
     * def HistoryResponse = HistoryData.req

       
 #Call 2SMS validation  SubProcess
     
      * def SMS_Data = call read('../SubProcess/SMS_Subprocess.feature')
      
      * def extracted_sms = SMS_Data.extracted_sms
      * def extracted_sms1 = SMS_Data.extracted_sms1
     
           
       * match extracted_sms == Expected_sms
       * match extracted_sms1 == Expected_sms
 
  #Call Email validation  SubProcess      
          
      * def Email_Data = call read('../SubProcess/Email_Subprocess.feature')
      
         * def actualShippingStateCode =   Email_Data.actualShippingStateCode  
          * def actualShippingCountry =   Email_Data.actualShippingCountry 
          * def actualTemplateId =   Email_Data.actualTemplateId 


  * def actualShippingStateCode_1 =   Email_Data.actualShippingStateCode_1  
          * def actualShippingCountry1 =   Email_Data.actualShippingCountry1 
          * def actualTemplateId1 =   Email_Data.actualTemplateId1 
          
          

 * print  ExpShipping_StateCode 
 * print ExpShipping_Country 
    * print ExpTemplateID 
    
      * match actualShippingStateCode == Shipping_StateCode
      * match actualShippingCountry == Shipping_Country
      * match actualTemplateId == Exp_TemplateID
      
      * match actualShippingStateCode_1 == Shipping_StateCode
      * match actualShippingCountry1 == Shipping_Country
      * match actualTemplateId1 == Exp_TemplateID
                      
                    
    Examples:
   | TestCase |
   | YAML_Testcase_1 |
   