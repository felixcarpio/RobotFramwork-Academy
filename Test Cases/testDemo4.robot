*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Test Template    Validate Unsuccesful Login
Resource    resource.robot


*** Variables ***
${Error_Massage_Login}      css:.alert-danger

*** Test Cases ***          username        password
Invalid username            dsahed          learning
Invalid password            rahulshetty     plough
special characters          @"!             learning



*** Keywords ***
Validate Unsuccesful Login
    [Arguments]    ${username}      ${password}
    open the browser with the Mortage payment url
    Fill the login Form     ${username}     ${password}
    wait until it checks and display error message
    verify error message is correct

open the browser with the Mortage payment url
    Open Browser    ${url}      chrome

Fill the login Form
    [Arguments]    ${username}      ${password}
    Input Text      id:username     ${username}
    Input Password  id:password     ${password}
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Massage_Login}

verify error message is correct
    ${result}=  Get Text    ${Error_Massage_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be      ${Error_Massage_Login}  Incorrect username/password.