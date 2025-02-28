*** Settings ***
Library     SeleniumLibrary
Variables       ../PageObjects/locators.py




*** Keywords ***
Open registration Page
    Click Element    ${click_register}
    Title Should Be    ${confirm_page_title}

Enter Name
    [Arguments]     ${name}     ${fname}
    Input Text    ${reg_name}    ${name}
    Input Text    ${reg_familyName}    ${fname}
    Click Element    ${click_next}

Select Gender
    [Arguments]     ${gender}
    Select From List By Value    ${reg_gender}    ${gender}
    Click Element    ${click_next}

Select Birth date
    [Arguments]     ${day}      ${year}
    Input Text    ${birth_day}    ${day}
    Input Text    ${birth_year}    ${year}
    Select From List By Index    ${birth_month}     9
    Click Element    ${click_next}

Enter Address
    [Arguments]     ${text}     ${city}     ${state}    ${country}  ${code}
    Input Text    ${address_text}    ${text}
    Input Text    ${address_city}    ${city}
    Input Text    ${address_state}    ${state}
    Input Text    ${address_country}    ${country}
    Input Text    ${address_code}    ${code}
    Click Element    ${click_next}

Enter Phone Number
    [Arguments]     ${phone}
    Input Text    ${phone_number}    ${phone}
    Click Element    ${click_next}

Select Relatives
    [Arguments]     ${personname}       ${relation}
    Select From List By Label    ${relationship_type}   ${relation}
    Input Text    ${relation_person}    ${personname}
    Click Element    ${click_next}
    Click Element    ${confirm_info}

Verify Successful Registration
    [Arguments]     ${name}     ${fname}
    ${givenname}=   Get Text    ${confirm_given_name}
    ${familyname}=      Get Text    ${confirm_family_name}
    Should Be Equal As Strings    ${givenname}    ${name}
    Should Be Equal As Strings    ${familyname}    ${fname}

close browsers
    Close All Browsers




