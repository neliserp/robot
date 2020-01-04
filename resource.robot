*** Settings ***
Documentation     A resource file with reusable keywords and variables.

Library           SeleniumLibrary
Resource          resource.robot

*** Variables ***
${SERVER}         127.0.0.1:8000
${BROWSER}        Chrome
${DELAY}          0.3
${VALID_USER}     admin
${VALID_PASSWORD}    admin
${LOGIN_URL}      http://${SERVER}/login
${HOME_URL}    http://${SERVER}/


${PRODUCTS_URL}    http://${SERVER}/products
${STOCK_TAKING_URL}    http://${SERVER}/stock_takings/take
${UNITS_URL}    http://${SERVER}/units
${PRODUCT_TYPES_URL}    http://${SERVER}/product_types

${CUSTOMERS_URL}    http://${SERVER}/customers
${SUPPLIERS_URL}    http://${SERVER}/suppliers
${OFFICES_URL}    http://${SERVER}/offices
${COMPANY_TYPES_URL}    http://${SERVER}/company_types
${EXCHANGES_URL}    http://${SERVER}/exchanges
${CURRENCIES_URL}    http://${SERVER}/currencies

${PO_FROM_CUSTOMER_URL}    http://${SERVER}/records/spo
${RECORDS_SDO_URL}    http://${SERVER}/records/sdo

# ${ERROR URL}      ${LOGIN URL}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open


Login Page Should Be Open
    Title Should Be    login

Go To Login Page
    Go To    ${LOGIN_URL}
    Login Page Should Be Open

Open Browser and GOTo Home Page
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Title Should Be    login
    Go To    ${LOGIN_URL}
    Input Username    admin
    Input Password    admin
    Submit Credentials

Input Username
    [Arguments]    ${username}
    Input Text    username    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Submit Form
    # Click Button    login_button

Home Page Should Be Open
    Location Should Be    ${HOME URL}
    Title Should Be    dashboard

Flash Message Should Contain
    [Arguments]    ${message}
    Element Should Contain    class:alert    ${message}

