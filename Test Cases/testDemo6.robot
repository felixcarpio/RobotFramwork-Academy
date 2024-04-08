*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    ../customLibraries/Shop.py
Test Setup       open the browser with the Mortage payment url
Test Teardown    Close Browser session
Resource    ../Pages/Generic.robot
Resource    ../Pages/LandingPage.robot
Resource    ../Pages/ShopPage.robot


*** Variables ***
@{listofProducts}           Blackberry      Nokia Edge

*** Test Cases ***
Validate Unsuccesful Login
    LandingPage.Fill the login Form     ${user_name}     ${invalid_password}
    LandingPage.wait until element is located in the page
    LandingPage.verify error message is correct

Validate Cards display in the Shopping Page
    LandingPage.Fill the login Form     ${user_name}     ${valid_password}
    ShopPage.wait until element is located in the page
    ShopPage.Verify Card tittles in the Shop page
    add items to cart and checkout      ${listofproducts}
    #Select the Card     Nokia Edge

Select the Form and navigate to Child window
    LandingPage.Fill the Login Details and Login Form
