*** Settings ***
Library     SeleniumLibrary
Resource        ../Resources/RegistrationKeywords.robot
*** Variables ***
${name}     Mary
${fname}    Dawson
${gender}   M
${bir_day}    23
${bir_year}   1995
${add_text}     B-202,Vijayanagar
${add_city}     Bengaluru
${add_state}    Karnataka
${add_country}      India
${add_code}     560066
${phone}        1234567899
${relation_name}     James
${relation_type}    Sibling
*** Test Cases ***
Registration
    [Tags]  registration
    Open registration Page
    Enter Name      ${name}       ${fname}
    Select Gender   ${gender}
    Select Birth date   ${bir_day}      ${bir_year}
    Enter Address   ${add_text}   ${add_city}   ${add_state}   ${add_country}   ${add_code}
    Enter Phone Number      ${phone}
    Select Relatives    ${relation_name}   ${relation_type}
    Sleep    3
    Verify Successful Registration      ${name}      ${fname}
    close browsers
