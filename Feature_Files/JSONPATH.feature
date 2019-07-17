Feature: GetJSONPath
   
Background:
 
  Scenario: Query History_API 
    
       Given url 'https://historyprocessor-dlab02-nmd.dev.px-npe01.cf.t-mobile.com/dnd/v1/notification?keys=208ddd08-cefc-450d-a020-a4e458ffb16b'
        And  configure ssl = true
    When method GET
    * def req = response
    * print req
     
      * def Expected_sms = "Your T-Mobile order# 6109307854 has shipped! Visit t-mo.co/shipment to check status of your order. Visit t-mo.co/guide for tips to set-up your new device."
 
       * def smsdata = karate.jsonPath(response, "$.notification[?(@.type =='SMS')][?(@.status =='SENT')].message[*].text")
  
    * def smsdata = smsdata.get(0)
     * print "SMS_Data:" +smsdata
     
      
         * print extracted_sms
         * def extracted_sms = smsdata.trim().split(',')
         
             * def extracted_sms = extracted_sms.get(5)
                  * print extracted_sms
                    
         * match extracted_sms == Expected_sms