*** Settings ***
Documentation       The file contains test cases for add valid employee records

Resource    ../resource/base/common_functionalities.resource

Library     DataDriver     file=../test_data/orange_data.xlsx       sheet_name=Add Valid Employee Test

Test Setup      Launch Browser And Navigate TO Url
Test Teardown       Close Browser
Test Template       Add Valid Employee Template

*** Test Cases ***
Add Valid Employee Test_${test_case}

*** Keywords ***
Add Valid Employee Template
    [Arguments]     ${username}  ${password}  ${firstName}  ${middleName}  ${lastName}  ${expected_value1}  ${expected_value2}
     Input Text    name=username    ${username}
    Input Text    name=password    ${password}
    Click Element    xpath=//button[normalize-space()='Login']
    Click Element    xpath=//span[contains(normalize-space(),'PIM')]
    Click Element    xpath=//a[contains(normalize-space(),'Add Employee')]
    Input Text    name=firstName    ${firstName}
    Input Text    name=middleName    ${middleName}
    Input Text    name=lastName   ${lastName}
    sleep   5s
    Click Element    xpath=//button[normalize-space()='Save']
    Wait Until Page Contains      ${expected_value1}
    Element Text Should Be    xpath=//h6[@class='oxd-text oxd-text--h6 --strong']    ${expected_value1}
    Element Attribute Value Should Be    name=firstName    value    ${expected_value2}