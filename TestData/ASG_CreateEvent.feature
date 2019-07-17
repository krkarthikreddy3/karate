Feature: ASG_CreateEvent
  
  Background:
* url deep
* def time = DeepPublishWaiteTime
* def request_uuid = eventID1
* def rd1 = rd1
* print "RD:"+rd1

* def request_rd2 = 98122 + rd1
* def request_rd1 = 9860019964
* print request_uuid
* print "BAN:"+ request_rd2
* def request_Date = date
* print request_Date

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


Scenario: Publish InternationalRoamingCountryUpdate to DEEP
    Given path '/InternationalRoamingCountryUpdate'
    And request { "auditInfo" : { },"eventId" : "#(request_uuid)", "payload" : { "timeStamp" : "#(request_Date)","sg" : true,"countryCode" : "IN","msisdn" : "9860019964" }, "eventVersion" : "1.0", "eventTime" : "2019-05-28T16:44:28Z", "eventType" : "InternationalRoamingCountryUpdate","eventProducerId" : "RoamingServicesEngineering", "specifications" : [ ]}
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
     
      * def Expected_sms = '"Welcome to India! Your T-Mobile plan with Global Plus One gives you unlimited high-speed data, unlimited texts, and unlimited calls. Enjoy your stay!"'
 
       * def smsdata = karate.jsonPath(response, "$.notification[?(@.type =='SMS')][?(@.status =='SENT')].message[*].text")
  
    * def smsdata = smsdata.get(0)
     * print "SMS_Data:" +smsdata
     
      
        
         * def extracted_sms = smsdata.trim().split(',')
         
            * def extracted_sms = extracted_sms.get(5)+','+extracted_sms.get(6)+','+extracted_sms.get(7)
            
             * def extracted_sms = extracted_sms
                  * print extracted_sms
                    
         * match extracted_sms == Expected_sms
         
   Scenario: Publish InternationalRoamingCountryUpdate to DEEP4
    Given path '/InternationalRoamingCountryUpdate'
    And request { "auditInfo" : { },"eventId" : "#(request_uuid)", "payload" : { "timeStamp" : "#(request_Date)","sg" : true,"countryCode" : "IN","msisdn" : "9860019964" }, "eventVersion" : "1.0", "eventTime" : "2019-05-28T16:44:28Z", "eventType" : "InternationalRoamingCountryUpdate","eventProducerId" : "RoamingServicesEngineering", "specifications" : [ ]}
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
     
      * def Expected_sms = '"Welcome to India! Your T-Mobile plan with Global Plus One gives you unlimited high-speed data, unlimited texts, and unlimited calls. Enjoy your stay!"'
 
       * def smsdata = karate.jsonPath(response, "$.notification[?(@.type =='SMS')][?(@.status =='SENT')].message[*].text")
  
    * def smsdata = smsdata.get(0)
     * print "SMS_Data:" +smsdata
     
      
        
         * def extracted_sms = smsdata.trim().split(',')
         
            * def extracted_sms = extracted_sms.get(5)+','+extracted_sms.get(6)+','+extracted_sms.get(7)
            
             * def extracted_sms = extracted_sms
                  * print extracted_sms
                    
         * match extracted_sms == Expected_sms

