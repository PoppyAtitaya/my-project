*** Settings ***
Library           SeleniumLibrary


*** Variables ***
${SERVER}         http://www.google.com
${MY_KEYWORD}       Dog

*** Keywords ***
Open google page   
    Open Browser   url=${SERVER}       browser=gc 
    Maximize Browser Window

Search Keywords     
    Input Text    locator=name=q   text=${MY_KEYWORD}
    sleep       3s
    Click Button    locator=name=btnK
    go back 2

# Check page Search Keywords

Go to link3
    Wait Until Element Is Visible       xpath=(//*[@id="rso"]//a/h3)[3]     timeout=50s    
    Click Element      xpath=(//*[@id="rso"]//a/h3)[3]     
    Wait Until Page Contains     text=Dog       
    # Wait Until Page Does Not Contain    Wikipedia      30s
    Wait Until Element Is Not Visible       xpath=(//*[@id="rso"]//a/h3)[3]             
    Go Back 
Go to link4           
    Wait Until Element Is Visible       xpath=(//*[@id="rso"]//a/h3)[4]     timeout=50s
    Click Element      xpath=(//*[@id="rso"]//a/h3)[4]          
    Wait Until Page Contains    text=Dog      
    # Wait Until Page Does Not Contain    Wikipedia      30s
    Wait Until Element Is Not Visible       xpath=(//*[@id="rso"]//a/h3)[4]   
    Go Back
Go to link5       
    Wait Until Element Is Visible       xpath=(//*[@id="rso"]//a/h3)[5]     timeout=50s
    Click Element      xpath=(//*[@id="rso"]//a/h3)[5]           
    Wait Until Page Contains    text=Dog 
    # Wait Until Page Does Not Contain    Wikipedia      30s
    Wait Until Element Is Not Visible       xpath=(//*[@id="rso"]//a/h3)[5]         
Close    
    Close Browser  
    

*** Test Cases ***
Google search Keywords
    Open google page                    
    Search Keywords     
    # Check page Search Keywords
    Go to link3
    Go to link4
    Go to link5
    Close    


