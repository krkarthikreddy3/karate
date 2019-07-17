Feature: PostAPI
  Scenario: Fetch all users
    Given url 'https://reqres.in/api/login'
    And request { "email": "eve.holt@reqres.in","password": "cityslicka"}
    When method POST
    Then status 200
  And match response contains {"token":"QpwL5tke4Pnpja7X4"}

