*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    String
Library    Collections
Test Setup    open the browser with the Mortage payment url
Test Teardown    Close Browser
Resource    resource.robot


*** Variables ***
${Error_Massage_Login}      css:.alert-danger

*** Test Cases ***
Validate Child window Functionality
    Select the link of Child window
    Verify the user is switched to child window
    Grab the Email id in the Child window
    Switch to Parent window and enter the Email

*** Keywords ***
Select the link of Child window
    Click Element       css:.blinkingText
    Sleep               5

Verify the user is switched to child window
    Switch Window               NEW
    Element Text Should Be      css:h1      DOCUMENTS REQUEST

Grab the Email id in the Child window
    ${text}=    Get Text    css:.red
    @{words}=   Split String    ${text}     at
    ${text_splited}=    Get From List       ${words}        1
    Log     ${text_splited}
    @{words_2}=   Split String    ${text_splited}
    ${email}=    Get From List       ${words_2}        0
    Set Global Variable     ${email}

Switch to Parent window and enter the Email
    Switch Window               MAIN
    Title Should Be             LoginPage Practise | Rahul Shetty Academy
    Input Text                  id:username     ${email}
    Sleep                       5
