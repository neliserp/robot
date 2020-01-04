*** Settings ***
Documentation     A test suite containing tests related to login with empty user field.
...
...               These tests are data-driven by their nature. They use a single
...               keyword, specified with Test Template setting, that is called
...               with different arguments to cover different scenarios.
...
...               This suite also demonstrates using setups and teardowns in
...               different levels.
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          ../../resource.robot

*** Test Cases ***               USER NAME        PASSWORD
Empty Username                   ${EMPTY}         ${VALID PASSWORD}
Empty Username And Password      ${EMPTY}         ${EMPTY}

*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

Login Should Have Failed
    Location Should Be    ${LOGIN URL}
    # Title Should Be    Error Page
    Page Should Contain    The username field is required.
    Flash Message Should Contain    Error The given data was invalid.