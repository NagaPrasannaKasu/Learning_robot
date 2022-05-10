*** Settings ***
Documentation  Practice using Selenium Library
Library     SeleniumLibrary  

*** Variables ***
${URL}  	https://intranet.ent.cgi.com/    
${Browser}	Edge
${Title}      Home | CGI Intranet
${Text}     Welcome Naga!
${Text2}     Kasu, Naga Prasanna
${Profile-URL}  	https://intranet.ent.cgi.com/pages/MyProfile.aspx


*** Keywords ***
Open Browser to CGI Intranet Page
    Open Browser   ${URL}	${Browser}   
    Maximize Browser Window
    Title Should be 	${Title}  
    SeleniumLibrary.Wait Until Page Contains   ${Text}
    
Edit Profile Page
    SeleniumLibrary.Click Link  ${Profile-URL} 
    SeleniumLibrary.Wait Until Page Contains   ${Text2}
    SeleniumLibrary.Click Link    partiallink=Edit Profile
    SeleniumLibrary.Wait Until Element Is Visible   partiallink=Save Changes
    SeleniumLibrary.Wait Until Element Is Visible  partiallink=Cancel   
    SeleniumLibrary.Click Link    partiallink=Cancel    
    SeleniumLibrary.Wait Until Element Is Visible   partiallink=Edit Profile


*** Test Cases ***
Open CGI Intranet page
    Open Browser to CGI Intranet Page
    [Teardown]    Close Browser

*** Test Cases ***
Edit CGI Intranet Profile page
    Open Browser to CGI Intranet Page
    Edit Profile Page
    [Teardown]    Close Browser