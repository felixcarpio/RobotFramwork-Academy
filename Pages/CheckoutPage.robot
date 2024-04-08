*** Settings ***
Documentation    All the page objetcs and keywords of shopping page.
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${Shop_page_load}          css:.nav-link

*** Keywords ***
Verify items in the Checkout Page and proceed
    Click Element   css:.btn-success
