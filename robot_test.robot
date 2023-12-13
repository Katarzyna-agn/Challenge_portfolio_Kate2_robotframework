*** Settings ***
Library  SeleniumLibrary
Documentation    Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://dareit.futbolkolektyw.pl/en
${BROWSER}        Chrome
${LOGINPAGE TEXT}        xpath=//div[1]/h5
${EMAILLPINPUT}        xpath=//*[@id='login']
${PASSWORDINPUT}        xpath=//*[@id='password']
${SIGNINBUTTON}     xpath=//*[@type='submit']
${MAINPAGE}        xpath=//ul[1]/div[1]/div[2]/span
${REMINDPASSWORD URL}        https://scouts-test.futbolkolektyw.pl/en/remind
${REMINDPASSWORD}        xpath=//div[1]/a
${CHANGELANGUAGE}        xpath=//div[2]/div/div
${REMINDPASSWORDTEXT}        xpath=//div[1]/h5
${POLISHOPTIONXPATH}        xpath=//div[3]/ul/li[1]
${PAGETEXT}        xpath=//div[1]/h5
${ADDPLAYER}        xpath=//div[2]/div/div/a/button/span[1]
${EMAILAPINPUT}        xpath=//*[@name='email']    
${NAMEINPUT}        xpath=//*[@name ='name']
${SURNAMEINPUT}        xpath=//*[@name ='surname']
${PHONEINPUT}        xpath=//*[@name ='phone']
${WEIGHTINPUT}        xpath=//*[@name ='weight']
${HEIGHTINPUT}        xpath=//*[@name ='height']
${AGEINPUT}        xpath=//*[@name ='age']
${LEGDDOWN}        xpath=//*[@id='mui-component-select-leg']
${UNLISTOFLEGS}        xpath=//div[3]/ul
${RIGHTLEG}        xpath=//div[3]/ul/li[1]
${LEFTLEG}        xpath=//div[3]/ul/li[2]
${CLUBINPUT}        xpath=//*[@name = 'club']
${LEVELINPUT}        xpath=//*[@name = 'level']
${MAINPOSITIONINPUT}        xpath=//*[@name='mainPosition']
${SECONDPOSITIONINPUT}        xpath=//*[@name='secondPosition']
${DISTRICTDDOWN}        xpath=//*[@id='mui-component-select-district']
${UNLISTOFDISTRICTS}        xpath=//div[3]/ul
${MASOVIADISTRICT}        xpath=//ul/li[7]
${ACHIEVEMENTS}        xpath=//*[@name='achievements']
${LACZYNASPILKAINPUT}        xpath=//*[@name='webLaczy']
${90MINUTINPUT}        xpath=//*[@name='web90']
${FACEBOOKINPUT}        xpath=//*[@name='webFB']
${SUBMITBUTTON}        xpath=//*[@type ='submit']


*** Test Cases ***
login to the system TC01
    Open Login Page
    Check LoginPage Text
    Type in email LP
    Type in password
    Click on the Sign in button
    Sleep        5s
    Assert dashboard
    [Teardown]        Close Browser


remind password TC02
    Open login page
    Type in email LP
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
    Type in email LP
    Type in password
    Click on the Sign in button
    Sleep        2s
    Click on the Addplayer
    Sleep        2s
    Assert Addplayer
    [Teardown]        Close Browser

fill add player form req TC05
    Open Login Page
    Type in email LP
    Type in password
    Click on the Sign in button
    Sleep        5s
    Click on the Addplayer
    Sleep        5s
    Type in name
    Type in surname
    Type in age
    Type in main position
    Click on the sumbit button
    Sleep        5s
    Assert Editplayer
    [Teardown]        Close Browser

fill add player form req TC06
    Open Login Page
    Type In Email LP
    Type in password
    Click on the Sign in button
    Sleep        2s
    Click on the Addplayer
    Sleep        4s
    Type in email AP
    Type in name
    Type in surname
    Type in phone
    Type in weight
    Type in height
    Type in age
    Click on the leg field
    Choose leg
    Type in club
    Type in level
    Type in main position
    Type in second position
    Click on the district
    Choose district
    Type in achievements
    Type in laczynaspilka
    Type in 90minut
    Type in facebook
    Click on the sumbit button
    Sleep        2s
    Assert Editplayer
    [Teardown]        Close Browser


*** Keywords ***
Open login page
    Open Browser        ${LOGIN URL}        ${BROWSER}
    Title Should Be          Scouts panel - sign in
Check LoginPage Text
    Wait Until Element Is Visible        ${LOGINPAGE TEXT}
    Element Text Should Be        ${LOGINPAGE TEXT}        Scouts panel
Type in email LP
    Input Text        ${EMAILLPINPUT}        user01@getnada.com
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
    Wait Until Element Is Visible        ${ADDPLAYER}
    Click Element        ${ADDPLAYER}
Type in email AP
    Wait Until Element Is Visible        ${EMAILAPINPUT}
    Input Text        ${EMAILAPINPUT}        John@getnada.com
Type in name
    Input Text        ${NAMEINPUT}        John
Type in surname
    Input Text        ${SURNAMEINPUT}        Bianco
Type in age
    Input Text        ${AGEINPUT}        12.12.1992
Click on the leg field
    Click Element        ${LEGDDOWN}
    Wait Until Element Is Visible        ${UNLISTOFLEGS}
Choose leg
     Click Element        ${RIGHTLEG}
Type in club
    Input Text        ${CLUBINPUT}        Club33
Type in level
    Input Text        ${LEVELINPUT}        3
Type in phone
    Input Text        ${PHONEINPUT}        487-247-743
Type in weight
    Input Text        ${WEIGHTINPUT}        80   
Type in height
    Input Text        ${HEIGHTINPUT}        192 
Type in main position
    Input Text        ${MAINPOSITIONINPUT}        fun player
Type in second position
    Input Text        ${SECONDPOSITIONINPUT}        good player   
Click on the district
    Click Element        ${DISTRICTDDOWN}
    Wait Until Element Is Visible        ${UNLISTOFDISTRICTS}
Choose district
    Click Element        ${MASOVIADISTRICT}
Type in achievements
    Input Text        ${ACHIEVEMENTS}        Winner       
Type in laczynaspilka
    Input Text        ${LACZYNASPILKAINPUT}        Yes
Type in 90minut
    Input Text        ${90MINUTINPUT}        Yes 
Type in facebook
    Input Text        ${FACEBOOKINPUT}        https://pl-pl.facebook.com/
Click on the sumbit button
    Click Element        ${SUBMITBUTTON}
    Wait Until Element Is Visible            ${MAINPAGE}
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


