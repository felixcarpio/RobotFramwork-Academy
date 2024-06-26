*** Settings ***
Documentation    A resource file with reusable keywords and variables.
...              The system specific keywords created here form our own
...              domain specific language. They utilize keywords provided
...              by the imported SeleniumLibrary.
Library    SeleniumLibrary

*** Variables ***
${user_name}            rahulshettyacademy
${invalid_password}     123445
${valid_password}       learning
${url}                  https://rahulshettyacademy.com/loginpagePractise/

*** Keywords ***
open the browser with the Mortage payment url
    Open Browser    ${url}      chrome

Close Browser session
    Close Browser