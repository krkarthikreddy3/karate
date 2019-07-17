@ignore
Feature: the name is expected to be set as a call arg


  Background:
* url deep

Scenario:


    * print "786" + data

    Given path '/InternationalRoamingCountryUpdate'
      And  configure ssl = true
    And request data
    When method POST
    Then status 200
    And match response contains {"message":"Message Published Successfully"}
    
    * def DeepStatus = "Passed"
    
    * print "Status786: " + DeepStatus