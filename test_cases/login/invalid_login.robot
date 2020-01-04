*** Settings ***
Documentation     A test suite containing tests related to navigate thru navbar

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Test Template     Login With Invalid Credentials Should Fail
Resource          ../../resource.robot

*** Test Cases ***    USER NAME    PASSWORD    INLINE_MESSAGE
Invalid Username    invalid    ${VALID_PASSWORD}    These credentials do not match our records.
Invalid Password    ${VALID_USER}    invalid    These credentials do not match our records.
Invalid Username And Password    invalid    whatever    These credentials do not match our records.
Empty Username    ${EMPTY}    ${VALID_PASSWORD}    The username field is required.
Empty Username And Password    ${EMPTY}    ${EMPTY}    The username field is required.
Empty Password    ${VALID_USER}    ${EMPTY}    The password field is required.
Empty Username And Password 2    ${EMPTY}    ${EMPTY}    The password field is required.


*** Keywords ***
Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}    ${message}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed    ${message}

Login Should Have Failed
    [Arguments]    ${message}
    Location Should Be    ${LOGIN URL}
    # Title Should Be    Error Page
    Page Should Contain    ${message}
    Flash Message Should Contain    Error The given data was invalid.
