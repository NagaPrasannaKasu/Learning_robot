*** Settings ***
Documentation       This file contains Variables and Keywords
Library             SeleniumLibrary
Library             String


*** Variables ***
${URL}      https://weathershopper.pythonanywhere.com/
${Browser}	Edge
${Title}    XPath:/html/body/div[1]/div[1]/h2
${attr}   XPath:/html/body/div[1]/div[2]/div/span

${product-price1}  XPath:/html/body/div[1]/div[2]/div[1]/p[2]
${product-price2}  XPath:/html/body/div[1]/div[2]/div[2]/p[2]
${product-price3}  XPath:/html/body/div[1]/div[2]/div[3]/p[2]
${product-price4}  XPath:/html/body/div[1]/div[3]/div[1]/p[2]
${product-price5}  XPath:/html/body/div[1]/div[3]/div[2]/p[2]
${product-price6}  XPath:/html/body/div[1]/div[3]/div[3]/p[2]


${Add-button}  XPath:/html/body/div[1]/div[3]/div[3]/button


*** Keywords ***
Temperature check
    Open Browser   ${URL}	${Browser}   
    Maximize Browser Window
    Element Should contain   ${Title}   Current temperature 
    ${textt}=  Get Text  ${attr}      
    ${temp}=  Get Substring  ${textt}  0  2    
    Log  ${temp}    
    Run Keyword If  ${temp}<=19  Temperature is less than or equal to 19
    ...  ELSE IF  ${temp}>=20  Temperature is greater than or equal to 34
     
        
Temperature is less than or equal to 19    
    SeleniumLibrary.Click Link  partiallink=Buy moisturizers  
    Product price list

Temperature is greater than or equal to 34    
    SeleniumLibrary.Click Link  partiallink=Buy sunscreens
    Product price list

Product price list
    ${price1}=  Get Text  ${product-price1}  
    ${price_1}=  Get Substring  ${price1}  -3 
    Log  ${price_1} 

    ${price2}=  Get Text  ${product-price2}  
    ${price_2}=  Get Substring  ${price2}  -3 
    Log  ${price_2} 

    ${price3}=  Get Text  ${product-price3}  
    ${price_3}=  Get Substring  ${price3}  -3 
    Log  ${price_3} 

    ${price4}=  Get Text  ${product-price4}  
    ${price_4}=  Get Substring  ${price4}  -3 
    Log  ${price_4} 

    ${price5}=  Get Text  ${product-price5}  
    ${price_5}=  Get Substring  ${price5}  -3 
    Log  ${price_5} 

    ${price6}=  Get Text  ${product-price6}  
    ${price_6}=  Get Substring  ${price6}  -3 
    Log  ${price_6} 

Select two least price products
    SeleniumLibrary.Click Link  partiallink=Buy sunscreens


