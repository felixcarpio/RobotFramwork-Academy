*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup       open the browser with the Mortage payment url
#Test Teardown    Close Browser
Resource    resource.robot


*** Variables ***
${Error_Massage_Login}      css:.alert-danger
${Shop_page_load}          css:.nav-link

*** Test Cases ***
#Validate Unsuccesful Login

    #Fill the login Form     ${user_name}     ${invalid_password}
    #wait until element is located in the page       ${Error_Massage_Login}

Validate Cards display in the Shopping Page
    Fill the login Form     ${user_name}     ${valid_password}
    wait until element is located in the page       ${Shop_page_load}
    Verify Card tittles in the Shop page
    Select the Card     Blackberry

*** Keywords ***

Fill the login Form
    [Arguments]     ${username}     ${password}
    Input Text      id:username     ${username}
    Input Password  id:password     ${password}
    Click Button    signInBtn

wait until element is located in the page
    [Arguments]    ${element}
    wait until element is visible   ${element}

Verify Card tittles in the Shop page
    @{expectedList} =  Create List    iphone X     Samsung Note 8      Nokia Edge      Blackberry
    ${elements} =   Get WebElements   css:.card-title
    @{actualList} =     Create List
    FOR     ${element}      IN      @{elements}
            Log     ${element.text}
            Append to List  ${actualList}   ${element.text}
    END
    lists should be equal    ${expectedList}        ${actualList}

Select the Card
    [Arguments]    ${cardName}
    ${elements} =   Get WebElements   css:.card-title
    ${index} =  Set Variable    1
    FOR     ${element}      IN      @{elements}
             Exit For Loop If   '${cardName}' == '${element.text}'
             ${index} =    Evaluate  ${index} + 1
    END
    Click Button    xpath:(//*[@class='card-footer'])[${index}]/button