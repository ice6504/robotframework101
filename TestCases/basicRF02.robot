*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser     https://www.saucedemo.com/v1/    gc
Suite Teardown     Close Browser


*** Variables ***
${username}    standard_user
${password}    secret_sauce
${firstname}    Aphinan
${lastname}    Janta
${Address}     123 Chiangmai Thailand

*** Keywords ***
Input User Name
    [Arguments]    ${username}
    Input Text    //*[@id="user-name"]    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    //*[@id="password"]    ${password}

Click Login Button
    Click Button    //*[@id="login-button"]

Click AddToCart Button
    Click Button     //*[@id="inventory_container"]/div/div[1]/div[3]/button

Click Cart Button
    Click Element    //*[@id="shopping_cart_container"]

Click CheckOut Button
    Click Element    //*[@id="cart_contents_container"]/div/div[2]/a[2]

Input FirstName
    [Arguments]    ${firstname}
    Input Text    //*[@id="first-name"]    ${firstname}

Input LastName
    [Arguments]    ${lastname}
    Input Text    //*[@id="last-name"]    ${lastname}

Input Address
    [Arguments]    ${Address}
    Input Text    //*[@id="postal-code"]    ${Address}

Click Continue Button
    Click Button    //*[@id="checkout_info_container"]/div/form/div[2]/input

Click Finish Button 
    Click Element    //*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]

*** Test Cases ***
Check Checkout Product
    Input User Name    username=${username}
    Input Password    password=${password}
    Click Login Button
    Click AddToCart Button
    Click Cart Button
    Click CheckOut Button
    Input FirstName    firstname=${firstname}
    Input LastName    lastname=${lastname}
    Input Address    Address=${Address}
    Click Continue Button
    Click Finish Button 
    Wait Until Page Contains    THANK YOU FOR YOUR ORDER
    