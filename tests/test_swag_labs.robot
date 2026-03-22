*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://iftakherhossen.github.io/robot-testing-project/docs/swag_labs.html
${BROWSER}    Chrome

*** Test Cases ***
Complete Swag Labs Flow
    [Teardown]    Close Browser

    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Login
    Input Text      id=username    standard_user
    Input Text      id=password    secret_sauce
    Click Button    id=login-button

    # Wait for product page (FIXED)
    Wait Until Element Is Visible    id=product-page    5s

    # Add items (use text-based xpath)
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[2]
    Click Button    xpath=(//button[contains(text(),'Add to Cart')])[3]

    # Open cart
    Click Element    xpath=//div[contains(@class,'cart-icon')]

    # Wait for checkout page
    Wait Until Element Is Visible    id=checkout-page    8s

    # Remove one item
    Click Button    xpath=(//button[contains(text(),'Remove')])[1]

    # Fill form
    Input Text    id=first-name       Simon
    Input Text    id=last-name        Charlie
    Input Text    id=postal-code      50170

    # Complete purchase
    Click Button    xpath=//button[contains(text(),'Complete Purchase')]

    # Confirm success (case-sensitive!)
    Wait Until Page Contains    Thank You For Your Order!    10s