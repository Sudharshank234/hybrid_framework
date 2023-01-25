*** Settings ***
Documentation     Thi file contains test cases related to invalid login
Resource    ../resource/base/common_functionalities.resource

Library  DataDriver     file=../test_data/orange_data.xlsx      sheet_name=Invalid Login Test
Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       Invalid Login Template
*** Test Cases ***
TC1
*** Keywords ***
Invalid Login Template
    [Arguments]     ${username}     ${password}     ${expected_error}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Element Text Should Be    xpath=//p[@class='oxd-text oxd-text--p oxd-alert-content-text']    ${expected_error}
