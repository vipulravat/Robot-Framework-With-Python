*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${appURL}   https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser}  Chrome
 

*** Test Cases ***
 LoginTest with valid Credentials
      [Tags]  Smoke
      [Setup]  Open Browser  ${appURL}  ${browser}
      Maximize Browser Window
      Set Browser Implicit Wait  5
      Input Text  username  Admin
      Input Password   password   admin123
      Sleep  3
      Click Button  //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
      Sleep  3
      ${url}   Get Location
      Log To Console  ${url} 
      Should Contain  ${url}  dashboard
      [Teardown]  Close Browser 
      
LoginTest with Invalid Credentials
      [Tags]  Regression
      [Setup]  Open Browser  ${appURL}  ${browser}
      Maximize Browser Window
      Set Browser Implicit Wait  6
      Input Text  username  Admin
      Input Password   password   admin121
      Sleep  4
      Click Button  //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button
      Sleep  4
      ${url}   Get Location
      Log To Console  ${url} 
      Should Contain  ${url}  dashboard
      [Teardown]  Close Browser 