*** Settings ***
Library           SeleniumLibrary
# Suite Setup       Open Browser  ${SERVER}  gc
# Test Setup        Click Button    locator=name=btnK
# Test Teardown     Go To  www.google.com
Suite Teardown    Close Browser
*** Variables ***
${SERVER}         http://www.google.com
${MY_KEYWORD}       Dog
@{open_page}        xpath=(//*[@id="rso"]//a/h3)[3]     (//*[@id="rso"]//a/h3)[4]       (//*[@id="rso"]//a/h3)[5]

*** Keywords ***
Open google page   
    Open Browser   url=${SERVER}       browser=gc 
    Maximize Browser Window
Search Keywords     
    Input Text    locator=name=q   text=${MY_KEYWORD}
    sleep       3s
    Click Button    locator=name=btnK
Open Page For Loop
    # ${open_page}=   Get WebElement     xpath=(//*[@id="rso"]//a/h3)

        FOR     ${element}      IN RANGE      3     6
            Wait Until Element Is Visible       xpath=(//*[@id="rso"]//a/h3)[${element}]     timeout=50s    
            Click Element     xpath=(//*[@id="rso"]//a/h3)[${element}]
            Wait Until Page Contains        ${MY_KEYWORD}                   timeout=20s    
            Wait Until Element Is Not Visible       xpath=(//*[@id="rso"]//a/h3)
            Go Back              
        END
Close Page
    Close Browser         


*** Test Cases ***
Test    
    Open google page
    Search Keywords
    Open Page For Loop
    Close Page

    # FOR    ${index}    IN RANGE    1    11
    #     Log    ${index}
    # END