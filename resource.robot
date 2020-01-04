*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         127.0.0.1:8000
${BROWSER}        Chrome
${DELAY}          0
${VALID USER}     admin
${VALID PASSWORD}    admin
${LOGIN URL}      http://${SERVER}/login
${HOME URL}    http://${SERVER}/
# ${ERROR URL}      ${LOGIN URL}

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    Jido

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

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
    Title Should Be    Jido