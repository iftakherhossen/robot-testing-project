*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://iftakherhossen.github.io/robot-testing-project/swag_labs.html
${BROWSER}    Chrome

*** Test Cases ***
Complete Swag Labs Flow
    [Teardown]    Close Browser

    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--headless");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage");add_argument("--disable-gpu")
    Maximize Browser Window

    Input Text      id=username    standard_user
    Input Text      id=password    secret_sauce
    Click Button    id=login-button

    Wait Until Element Is Visible    id=product-page    5s

    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[2]
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[3]

    Click Element    xpath=//div[contains(@class,'cart-icon')]

    Wait Until Element Is Visible    id=checkout-page    8s

    Click Button    xpath=(//button[contains(text(),'Remove')])[1]

    Input Text    id=first-name       Simon
    Input Text    id=last-name        Charlie
    Input Text    id=postal-code      50170

    Click Button    xpath=//button[contains(text(),'Complete Purchase')]

    Wait Until Page Contains    Thank You For Your Order!    10s