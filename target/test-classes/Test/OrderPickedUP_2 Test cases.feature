Feature: OrderPickedUp_OutLineData

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
  * def data = read('classpath:<Payload>.json')
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
          * def actualShippingAddressLine1 =   Email_Data.actualShippingAddressLine1  
          * def actualShippingCityName =   Email_Data.actualShippingCityName 
          * def actualShippingZipCode =   Email_Data.actualShippingZipCode 

          * def actualShippingStateCode_1 =   Email_Data.actualShippingStateCode_1  
          * def actualShippingCountry1 =   Email_Data.actualShippingCountry1 
          * def actualTemplateId1 =   Email_Data.actualTemplateId1 
          * def actualShippingAddressLine1_1 =   Email_Data.actualShippingAddressLine1_1  
          * def actualShippingCityName_1 =   Email_Data.actualShippingCityName_1 
          * def actualShippingZipCode_1 =   Email_Data.actualShippingZipCode_1 
          
          
          

 * print  Shipping_StateCode 
 * print Shipping_Country 
    * print Exp_TemplateID 
    
      * match actualShippingStateCode == Shipping_StateCode
      * match actualShippingCountry == Shipping_Country
      * match actualTemplateId == Exp_TemplateID
      
      * match actualShippingStateCode_1 == Shipping_StateCode
      * match actualShippingCountry1 == Shipping_Country
      * match actualTemplateId1 == Exp_TemplateID
         
         * match actualShippingAddressLine1 == Shippingadres1
      * match actualShippingCityName == ShippingCityName
      * match actualShippingZipCode == ShippingZipCode
      
      * match actualShippingAddressLine1_1 == Shippingadres1
      * match actualShippingCityName_1 == ShippingCityName
      * match actualShippingZipCode_1 == ShippingZipCode
                   
                      
  Examples:
    | Shipping_StateCode |Shipping_Country |Exp_TemplateID |EventType |TestCase |Payload |Shippingadres1 |ShippingCityName |ShippingZipCode | 
    | GA  | US  | ORDERSHIPPEDNOTRADEIN  | OrderPickedUp | OutLine_Testcase_1 |TC01_OrderPickedUp_D360_Standard_FRP |One Ravinia Drive |City1 |30345 | |
    | CA  | US  | ORDERSHIPPEDTRADEIN  | OrderPickedUp | OutLine_Testcase_2 |TC02_OrderPickedUp_D360_Regular_Upgrade_FRP_With_Trade_IN |One Ravinia Drive |Atlanta |City2 |30346 |

 
 
 
 
 