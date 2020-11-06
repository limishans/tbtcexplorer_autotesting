*** Settings ***
Documentation     Testing of TBTC explorer.
...
...               This autotest allows you to test the business logic of a resource and identify errors.
...               External Robot Framework libraries are used to implement autotests:
...               1. RequestsLibrary (for checking the connection of a web service with a user)
...               2. SeleniumLibrary (for testing web forms and its correctness of work)
Library           Collections
Library           OperatingSystem
Library           RequestsLibrary
Library           SeleniumLibrary
Library           Dialogs

*** Variables ***
${base_url}       https://tbtcexplorer.com
${url}            /
${browser}        Chrome
@{addresses}      address1    address2    address3
@{clicked_page_parameters_status}    TBTC Balance

*** Test Cases ***
tBTC_Explorer_Get_Request_Ckeck_status
    Create Session    myConnect    ${base_url}    disable_warnings=1
    ${response}=    Get Request    myConnect    ${url}
    Status Should Be    200    ${response}
    #check the GET Request status of any Contract address
    ${response2}=    Get Request    myConnect    /user/0x253Fc2e1b417dFeBb4934D1297C9d2397b3a22f8
    Request Should Be Successful    ${response2}
    #check some modules and parameters in GET response
    check_response_text    ${response2.text}    Object.prototype.hasOwnProperty.call
    check_response_text    ${response2.text}    Object.defineProperty
    check_response_text    ${response2.text}    webpackJsonpmy-app
    Open Target Page
    Choose_Address_To_Check
    Check_Input_Text
    Check_Clicked_Address_Page

*** Keywords ***
Check_Response_Text
    [Arguments]    ${text}    ${expected_text}
    [Documentation]    Check some expected text in GET Response
    Should contain    ${text}    ${expected_text}    msg=Не найдено искомое слово ${expected_text}!

Open_Target_Page
    [Documentation]    Open WEB browser (Chrome)
    SeleniumLibrary.Set Selenium Timeout    5 sec
    Open Browser    ${base_url}    ${browser}
    Maximize Browser Window
    Page Should Contain    tBTC Explorer

Choose_Address_To_Check
    ${myInput}=    Get Selection From User    Choose one of addresses    @{addresses}
    ${chosenAddress}=    Set Variable If    "${myInput}" == "@{addresses}[0]"    0xa6e7F20F6C93573eF8b8805B4E19587964025331    "${myInput}" == "@{addresses}[1]"    0xF9e11762d522ea29Dd78178c9BAf83b7B093aacc    "${myInput}" == "@{addresses}[2]"    0xF1De9490Bf7298b5F350cE74332Ad7cf8d5cB181
    Set Suite Variable    ${chosenAddress}

Check_Input_Text
    [Documentation]    "Check the input text in Search for an address, a transaction" field
    Mouse Down    class:ant-input
    Input Text    class:ant-input    ${chosenAddress}
    Length Should Be    ${chosenAddress}    42
    Should Be True    "0x" in """${chosenAddress}"""
    Press Keys    class:ant-input    RETURN

Check_Clicked_Address_Page
    ${address_page}=    Get Request    myConnect    /user/${chosenAddress}
    Request Should Be Successful    ${address_page}
    ${count} =    Get Length    ${clicked_page_parameters_status}
    FOR    ${index}    IN RANGE    0    ${count}
        Element Should Contain    class:ant-statistic-title    ${clicked_page_parameters_status}[${index}]
    END
