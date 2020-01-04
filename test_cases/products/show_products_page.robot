*** Settings ***
Documentation     A test suite with a single test to show items pageios.
...

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Home Page
Resource          ../../resource.robot

*** Test Cases ***
Show Items Page
    Goto items


*** Keywords ***
Products Page Should Be Open
    Location Should Contain    ${PRODUCTS URL}

Goto items
    Click Link    link=Products
    # Click Link    link=Units
    Click Link    xpath=//a[contains(@href,"/products")]

    # driver.findElement(By.xpath(".//a[contains(@href,'long')]")).click();
    Products Page Should Be Open

