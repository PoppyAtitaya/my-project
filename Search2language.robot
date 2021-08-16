*** Settings ***
Library           SeleniumLibrary
Resource    ${LANG}/message.txt
Suite Teardown    Close Browser

*** Variables ***
${SERVER}         http://www.google.com
 



*** Keywords ***
Open google page   
    Open Browser   url=${SERVER}       browser=gc    
    Maximize Browser Window

Search Keywords     
    Input Text    locator=name=q   text=${MY_KEYWORD}
    sleep       3s
    Click Button    locator=name=btnK

*** Test Cases ***
Open and Search   
    Open google page
    Log to console      ${MY_KEYWORD}
    Search Keywords
 