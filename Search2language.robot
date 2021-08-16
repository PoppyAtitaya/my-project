*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${SERVER}         http://www.google.com
${MY_KEYWORDTH}       กุหลาบ
${MY_KEYWORDEN}        Rose


*** Keywords ***
Open google page   
    Open Browser   url=${SERVER}       browser=ff 
    Maximize Browser Window

Search KeywordsTH     
    Input Text    locator=name=q   text=${MY_KEYWORDTH}
    sleep       3s
    Click Button    locator=name=btnK
    Go Back

Search KeywordsEN    
    Input Text    locator=name=q   text=${MY_KEYWORDEN}
    sleep       3s
    Click Button    locator=name=btnK

*** Test Cases ***
Open and Search   
    Open google page
    Search KeywordsTH
    Search KeywordsEN 