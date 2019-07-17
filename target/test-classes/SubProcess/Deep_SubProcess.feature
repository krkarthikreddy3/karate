@ignore
Feature: the name is expected to be set as a call arg


  Background:
* url deep

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
         
Scenario:
    
    Given path Event_Type
      And  configure ssl = true
    And request data
    When method POST
    Then status 200
    And match response contains {"message":"Message Published Successfully"}
    * def DeepStatus = "Passed"
    * print "DeepStatus: " + DeepStatus
     * call sleep DeepPublishWaiteTime