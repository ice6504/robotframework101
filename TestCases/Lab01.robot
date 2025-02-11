*** Settings ***
Library          Selenium2Library
Suite Setup      Open Browser     https://automationexercise.com/    gc
# Suite Teardown     Close Browser

*** Variables ***
${name}    Aphinan
${email}    aphinan6504@gmail.com
${password}    66026213
${firstname}    Aphinan
${lastname}    Janta
${address}    123 moodeng
${state}    Chiang Mai
${city}    Fang
${zipcode}    50110
${phone}    00000000000



*** Keywords ***
Click Signup/Login Button 
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[4]/a

Input Name 
    [Arguments]    ${name}
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[2]    ${name}


Input email
    [Arguments]    ${email}
    Input Text    //*[@id="form"]/div/div/div[3]/div/form/input[3]    ${email}


Click Signup Button
    Click Button    //*[@id="form"]/div/div/div[3]/div/form/button


Fill Detail Account
    [Arguments]    ${password}    ${firstname}    ${lastname}    ${address}    ${state}    ${city}    ${zipcode}    ${phone}
    Click Element    //*[@id="id_gender1"]
    Input Password    //*[@id="password"]    ${password}
    Select From List By Value    //*[@id="days"]    11
    Select From List By Index    //*[@id="months"]    7
    Select From List By Value    //*[@id="years"]    2004
    Wait Until Element Is Enabled   //*[@id="form"]/div/div/div/div[1]/form/div[6]
    Select Checkbox    xpath=//*[@id='newsletter']
    Select Checkbox    xpath=//*[@id='optin']
    Input Text    //*[@id="first_name"]    ${firstname}
    Input Text    //*[@id="last_name"]    ${lastname}
    Input Text    //*[@id="address1"]    ${address}
    Select From List By Value    //*[@id="country"]    United States
    Input Text    //*[@id="state"]    ${state}
    Input Text    //*[@id="city"]    ${city}
    Input Text    //*[@id="zipcode"]    ${zipcode}
    Input Text    //*[@id="mobile_number"]    ${phone}

Click CreateAccount Button
    Click Button    //*[@id="form"]/div/div/div/div[1]/form/button

Click Continue Button
    Click Element    //*[@id="form"]/div/div/div/div/a

Add Products   
    Wait Until Element Contains    /html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[1]/div[1]/h2    text=
    Click Element    /html/body/section[2]/div/div/div[2]/div[1]/div[2]/div/div[2]/ul/li/a
    Click Button   /html/body/section/div/div/div[2]/div[2]/div[2]/div/span/button
    Click Button    //*[@id="cartModal"]/div/div/div[3]/button

Click Cart Product
    Click Element    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a

Click Proceed To Checkout
    Click Element    //*[@id="do_action"]/div[1]/div/div/a

*** Test Cases ***
Place Order Register Before Checkout
    Maximize Browser Window
    Click Signup/Login Button
    Input Name    name=${name}
    Input email    email=${email}
    Click Signup Button
    Execute javascript       document.body.style.zoom="30%"
    Fill Detail Account    password=${password}    firstname=${firstname}    lastname=${lastname}    address=${address}    state=${state}    city=${city}    zipcode=${zipcode}    phone=${phone}
    Click CreateAccount Button
    Wait Until Page Contains    Account Created!
    Click Continue Button
    Wait Until Page Contains     Logged in as Aphinan
    Wait Until Page Contains    Features Items
    Execute javascript       document.body.style.zoom="20%"
    Add Products
    Click Cart Product
    Click Proceed To Checkout


