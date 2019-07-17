@ignore
Feature: the name is expected to be set as a call arg


  Background:

Scenario:

     * def extracted_sms = HistoryData.smsdata.trim().split(',')
         
      * def extracted_sms = extracted_sms.get(Datalist)
      * print "SMS:" +extracted_sms
                    
      * def extracted_sms1 = HistoryData.smsdata1.trim().split(',')
         
      * def extracted_sms1 = extracted_sms1.get(Datalist)
      * print "SMS1:" +extracted_sms1