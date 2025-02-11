*** Settings ***
Library          Selenium2Library
Suite Setup      Open Browser     https://translate.google.co.th/?hl=th&sl=auto&tl=th&op=translate    gc
Suite Teardown     Close Browser


*** Variables ***
${ENGWORD}    DOG


*** Keywords ***
Input ENG WORD
    [Arguments]    ${ENGWORD}
    Input Text    //*[@id="yDmH0d"]/c-wiz/div/div[2]/c-wiz/div[2]/c-wiz/div[1]/div[2]/div[2]/div/c-wiz/span/span/div/textarea   ${ENGWORD}


*** Test Cases ***
Check Translate Result
    Input ENG WORD    ENGWORD=${ENGWORD}
    Wait Until Page Contains    text=สุนัข