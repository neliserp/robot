*** Settings ***
Documentation     A test suite containing tests related to invalid login.

Suite Setup       Open Browser and GOTo Home Page
Suite Teardown    Close Browser
# Test Setup
Test Template     Navigate link from navbar
Resource          ../../resource.robot

*** Test Cases ***    Level1_LINK    Level2_HREF    TARGET_URL
# Navigate to Products Page    Products    /products    ${PRODUCTS URL}
Navigate to STOCK TAKING Page    Products    Stock Taking    ${STOCK_TAKING_URL}
Navigate to UNITS Page    Products    Units    ${UNITS_URL}
Navigate to PRODUCT TYPES Page    Products    Product Types    ${PRODUCT_TYPES_URL}

Navigate to CUSTOMERS Page    Companies    Customers    ${CUSTOMERS_URL}
Navigate to SUPPLIERS Page    Companies    Suppliers    ${SUPPLIERS_URL}
Navigate to OFFICES Page    Companies    Offices    ${OFFICES_URL}
Navigate to COMPANY TYPES Page    Companies    Company Types    ${COMPANY_TYPES_URL}
Navigate to EXCHANGES Page    Companies    Exchanges    ${EXCHANGES_URL}
Navigate to CURRENCIES Page    Companies    Currencies    ${CURRENCIES_URL}

Navigate to PO FROM CUSTOMER Page    Selling    P/O from Customer    ${PO_FROM_CUSTOMER_URL}
Navigate to DO To Customer Page      Selling    D/O to Customer      ${RECORDS_SDO_URL}

*** Keywords ***
Navigate link from navbar
    [Arguments]    ${level1_link}    ${level2_href}    ${target_url}
    Goto items    ${level1_link}    ${level2_href}
    Page Should Be Open    ${target_url}

*** Keywords ***
Page Should Be Open
    [Arguments]    ${target_url}
    Location Should Contain    ${target_url}

Goto items
    [Arguments]    ${level1_link}    ${level2_href}
    Click Link    link=${level1_link}
    Click Link    link=${level2_href}
    # Click Link    xpath=//a[contains(@href,"${level2_href}")]