*** Settings ***
Documentation     A test suite with a single test for valid login.

Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Test Setup        Go To Login Page
Resource          ../../resource.robot

*** Test Cases ***
Valid Login
    Input Username    admin
    Input Password    admin
    Submit Credentials
    Home Page Should Be Open
