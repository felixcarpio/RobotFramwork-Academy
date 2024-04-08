*** Settings ***
Documentation    All the page objetcs and keywords of shopping page.
Library    SeleniumLibrary
Library    Collections
Resource    Generic.robot

*** Variables ***
${Shop_page_load}           css:.nav-link

*** Keywords ***
Enter the Country and select the terms
    [Arguments]    ${country_name}
    Input Text      country     ${country_name}
    Sleep   2
    Wait Until element passed is located on Page    //a[contains(.,'${country_name}')]
    Sleep   5
    Click Element   //a[contains(.,'${country_name}')]
    Click Element   xpath://label[@for='checkbox2'][contains(.,'I agree with the term & Conditions')]
    Sleep   2

Purchase the Product and Confirm the Purchase
    Click Element   xpath://input[contains(@class,'btn btn-success btn-lg')]
    Page Should Contain     Success!
    Sleep   3