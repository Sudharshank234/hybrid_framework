*** Settings ***
Documentation       The file contains test cases related to valid login

Resource    ../resource/base/common_functionalities.resource

Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser

Test Template       Valid Login Template
*** Test Cases ***
Valid Login Test        Admin       admin123        Dashboard

*** Keywords ***
Valid Login Template
    [Arguments]     ${username}     ${password}     ${expected_header}
    Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Element Text Should Be    xpath=//h6[contains(@class,'topbar-header-breadcrumb-module')]    ${expected_header}
