*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Test Cases ***
Primer Test
    open browser    https://demoqa.com/text-box     chrome
    sleep    5
    close browser

*** Keywords ***
