*** Settings ***
Library           SeleniumLibrary

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

        FOR     ${element}      IN      @{open_page}
            Wait Until Element Is Visible       ${element}     timeout=50s    
            Click Element     ${element}
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
     
# *** Settings ***
# Documentation     An example breaking out of the for loop based on some condition.

# *** Variables ***
# @{ROBOTS}=        Bender    Johnny5    Terminator    Robocop

# *** Tasks ***
# Break out of the for loop on condition
#     FOR    ${robot}    IN    @{ROBOTS}
#         Exit For Loop If    $robot == 'Johnny5'
#         Log    ${robot}
#     END