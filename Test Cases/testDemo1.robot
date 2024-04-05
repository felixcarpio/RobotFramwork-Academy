*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser
Resource    resource.robot


*** Variables ***
${Error_Massage_Login}      css:.alert-danger

*** Test Cases ***
Validate Unsuccesful Login
    open the browser with the Mortage payment url
    Fill the login Form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortage payment url
    Open Browser    ${url}      chrome

Fill the login Form
    Input Text      id:username     rahulshettyacademy
    Input Password  id:password     12345678
    Click Button    signInBtn

wait until it checks and display error message
    Wait Until Element Is Visible   ${Error_Massage_Login}

verify error message is correct
    ${result}=  Get Text    ${Error_Massage_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be      ${Error_Massage_Login}  Incorrect username/password.