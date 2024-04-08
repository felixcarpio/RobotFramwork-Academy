*** Settings ***
Documentation    All the page objetcs and keywords of shopping page.
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_page_load}          css:.nav-link

*** Keywords ***
wait until element is located in the page
    wait until element is visible   ${Shop_page_load}


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
