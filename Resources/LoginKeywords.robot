*** Settings ***
Library     SeleniumLibrary
Variables   ../PageObjects/locators.py
*** Keywords ***
Open my browser
    [Arguments]     ${siteurl}  ${browser}
    Open Browser    ${siteurl}  ${browser}
    Maximize Browser Window
    
Enter email
    [Arguments]     ${username}
    Input Text    ${login_username}    ${username}

Enter Password
    [Arguments]     ${password}
    Input Text    ${login_password}    ${password}
    
Choose Location
    Click Element    ${login_location}

Click Login Button
    Click Element    ${login_button}
    
Verify Successful Login
    Title Should Be     Home


Verify UnSuccessful Login
    ${error_message}=   Get Text    ${error_element}
    Should Be Equal As Strings    ${error_message}     Invalid username/password. Please try again.

