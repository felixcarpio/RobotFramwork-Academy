*** Settings ***
Documentation    All the page objetcs and keywords of landing page.
Library    SeleniumLibrary
Resource    Generic.robot

*** Variables ***
${Error_Massage_Login}      css:.alert-danger

*** Keywords ***
Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text      id:username     ${username}
    Input Password  id:password     ${password}
    Click Button    signInBtn

wait until element is located in the page
    Wait Until element passed is located on Page        ${Error_Massage_Login}

verify error message is correct
    ${result}=  Get Text    ${Error_Massage_Login}
    Should Be Equal As Strings  ${result}   Incorrect username/password.
    Element Text Should Be      ${Error_Massage_Login}  Incorrect username/password.

Fill the Login Details and Login Form
    Input Text      id:username     rahulshettyacademy
    Input Password  id:password     12345678
    ClicK Element   css:input[value='user']
    Wait Until Element Is Visible       css:.modal-body
    Click Button    id:okayBtn
    Click Button    id:okayBtn
    Wait Until Element Is Not Visible   css:.modal-body
    Select From List By Value           css:select.form-control     teach
    Select Checkbox         terms
    Checkbox Should Be Selected     terms