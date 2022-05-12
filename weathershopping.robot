*** Settings ***
Documentation       Weathershopping: Shop for moisturizers if the weather is below 19 degrees. Shop for suncreens if the weather is above 34 degrees.
Library             SeleniumLibrary
Resource            source.robot


*** Test Cases ***
Weathershopping main page 
    Temperature check    
    [Teardown]    Close Browser