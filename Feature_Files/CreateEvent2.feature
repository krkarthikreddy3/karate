Feature: EmailValidation

 Background:

 Scenario: Sample email validation
   Given url "http://historyprocessor-dlab02-nmd.dev.px-npe01.cf.t-mobile.com/dnd/v1/notification?keys=5c508046-5d2f-422e-b4c6-957864194222"
   * print history
   And configure ssl = true
   When method GET
   * def req = response
   * print req
    * def EmailData = karate.jsonPath(response, "$.notification[?(@.type =='Email')][?(@.status =='SENT')].message[*].text")
   * def Email_Data1 = EmailData.get(0)
   * print Email_Data1
  * print  karate.pretty(Email_Data)
  * xml xmlVar = EmailData.get(0)
  * print xmlVar
 * xml xmlVar1 = Email_Data1
 * print xmlVar1
 * def actualEmailAddressPAH = karate.xmlPath(xmlVar1, '/batch/template/list/email/pdata[@key = "paynumber"]/@value')
 * print actualEmailAddressPAH
 * def foobar = get xmlVar1 /batch/template/list/email/pdata[@key = "paynumber"]/@value
 * print "Email77"+foobar