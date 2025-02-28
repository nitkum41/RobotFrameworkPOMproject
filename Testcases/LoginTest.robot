*** Settings ***
Library     SeleniumLibrary
Resource        ../Resources/LoginKeywords.robot


*** Variables ***

${siteurl}      https://o2.openmrs.org/openmrs/login.htm
${browser}      headlesschrome
${email}        Admin
${password}     Admin123


*** Test Cases ***

Login Test
    [Tags]  login
    Open my browser     ${siteurl}  ${browser}
    Enter email     ${email}
    Enter Password      ${password}
    Choose Location
    Click Login Button
    Sleep    3
    Verify Successful Login
