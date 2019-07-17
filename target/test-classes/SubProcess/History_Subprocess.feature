@ignore
Feature: the name is expected to be set as a call arg


  Background:
         
Scenario:
         
    Given url history_url
   
    And  configure ssl = true
    When method GET
    * print "History_Url"+history_url
    * def HistoryResponse = response
    * print Response
    * def smsdatas = karate.jsonPath(HistoryResponse, "$.notification[?(@.type =='SMS')][?(@.status =='SENT')].message[*].text")
    * def smsdata = smsdatas.get(0)
    * print "SMS_Data:" +smsdata
    * def smsdata1 = smsdatas.get(1)
    * print "SMS_Data1:" +smsdata1
    * def EmailData = karate.jsonPath(HistoryResponse, "$.notification[?(@.type =='Email')][?(@.status =='SENT')].message[*].text")
    * def Email_Data1 = EmailData.get(0)
    * xml xmldata = Email_Data1
    * print xmldata
    * def Email_Data2 = EmailData.get(0)
    * xml xmldata1 = Email_Data2
    * print xmldata1