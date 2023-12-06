*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website


*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}        Chrome
${EMAILINPUT}       xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${MAINPAGE}        xpath=//ul[1]/div[1]/div[2]/span
${REMINDPASSWORD URL}        https://scouts-test.futbolkolektyw.pl/en/remind'
${REMINDPASSWORD}        xpath=//div[1]/a
${CHANGELANGUAGE}        xpath=//div[2]/div/div
${REMINDPASSWORDTEXT}        xpath=//div[1]/h5
${POLISHOPTIONXPATH}        xpath=//div[3]/ul/li[1]
${PAGETEXT}        xpath=//div[1]/h5
${ADDPLAYER}        xpath=//div[2]/div/div/a/button/span[1]
${PLAYEREMAIL}        xpath=//*[@name='email']
${NAMEINPUT}        xpath=//*[@name ='name']
${SURNAMEINPUT}        xpath=//*[@name ='surname']
${AGEINPUT}        xpath=//*[@name ='age']
${MAINPOSITIONINPUT}        xpath=//*[@name='mainPosition']
${SUBMITBUTTON}        xpath=//*[@type ='submit']




*** Test Cases ***
login to the system TC01
    Open Login Page
    Type in email
    Type in password
    Click on the Sign in button
    Assert dashboard
    [Teardown]        Close Browser


remind password TC02
    Open login page
    Type in email
    Click On The Remind Password
    Assert Remind password
    [Teardown]        Close Browser


change language TC03
    Open login page
    Change Language
    Change language
    Assert LoginPage
    [Teardown]        Close Browser

dasboard addplayer TC04
    Open Login Page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Click on the Addplayer
    Assert Addplayer
    [Teardown]        Close Browser

fill add player form req TC05
    Open Login Page
    Type in email
    Type in password
    Click on the Sign in button
    Assert Dashboard
    Click on the Addplayer
    Assert Addplayer
    Type_in_name
    Type in surname
    Type in age
    Type in main position
    Click on the sumbit button
    Assert Editplayer
    [Teardown]        Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be          Scouts panel - sign in
Type in email
    Input Text      ${EMAILINPUT}       user01@getnada.com
Type in password
    Input Text      ${PASSWORDINPUT}        Test-1234
Click on the Sign in button
    Click Element        ${SIGNINBUTTON}
Click on the Remind password
    Click Element        ${REMINDPASSWORD}
Change language
    Click Element        ${CHANGELANGUAGE}
    Click Element        ${POLISHOPTIONXPATH}
Click on the Addplayer
    Click Element        ${ADDPLAYER}
Type_in_name
    Input Text        ${NAMEINPUT}        John
Type in surname
    Input Text        ${SURNAMEINPUT}        Bianco
Type in age
    Input Text        ${AGEINPUT}        12.12.1992
Type in main position
    Input Text        ${MAINPOSITIONINPUT}        good player
Click on the sumbit button
    Click Element        ${SUBMITBUTTON}
Assert LoginPage
    Wait Until Element Is Visible        ${REMINDPASSWORD}
    Title Should Be        Scouts panel - zaloguj
Assert Dashboard
    Wait Until Element Is Visible            ${MAINPAGE}
    Title Should Be        Scouts panel
    Capture Page Screenshot          alert.png
Assert Remind password
     Wait Until Element Is Visible        ${REMINDPASSWORDTEXT}
     Title Should Be        Remind password
     Capture Page Screenshot          alert.png
Assert Addplayer
     Wait Until Element Is Visible        ${MAINPAGE}
     Title Should Be        Add player
     Capture Page Screenshot          alert.png
Assert Editplayer
     Wait Until Element Is Visible        ${MAINPAGE}
     Title Should Be        Edit player John Bianco
     Capture Page Screenshot          alert.png


