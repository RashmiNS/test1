driver = webdriver.Chrome(C:/Python27/Chromedriver)
*** Settings ***
Documentation           This is a simple test with Robot Framework
Library                 SeleniumLibrary
Library                 C:/Python27/Lib/Login.py
Suite Teardown          Close Browser

*** Variables ***
${SERVER}               https://test.salesforce.com
${BROWSER}              Chrome
${DELAY}                5
${Username}             johnson.nelson@abbvie.com.v16dr
${Password}             welcome1
${xpath1}               //*[@id="username"]
${xpath2}               //*[@id="password"]

*** Keywords ***
Open Browser To Login Page
    Open Browser     ${SERVER}     ${BROWSER}
    Maximize Browser Window
    set Selenium Speed      ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be     Login | Salesforce
    log to console  Webpage open sucessful

Go To Login Page
    Go To   ${SERVER}
    Login Page Should Be Open

Input Username
    [Arguments]    ${xpath1}    ${Username}
    Input text     ${xpath1}    ${Username}

Input Password
    [Arguments]  ${xpath2}    ${Password}
    Input text  ${xpath2}    ${Password}

WaitOne
    [Arguments]   ${DELAY}

Submit Credentials
    Click Element  xpath=//*[@id="Login"]

Logged in
    Title Should Be     Salesforce - Unlimited Edition
    log to console  Logged in sucessfully

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    Input Username  ${xpath1}    ${Username}
    Input Password     ${xpath2}    ${Password}
    Submit Credentials
    Logged in

    [Teardown]  Close Browser

