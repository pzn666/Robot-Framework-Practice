*** Settings ***
Library           Selenium2Library

*** Variables ***
${HOME}           https://video.ey.gov.tw
${BROWSER}          Firefox
${DELAY}            0

*** Keywords ***

Open Browser To Home Page
    Open Browser    ${HOME}    ${BROWSER}
    Set Selenium Speed    ${DELAY}

Search Test
    [Arguments]    ${search_content}    ${input_css_name}    ${btn_text}    ${wait_sec}

    Input Text    ${input_css_name}     ${search_content}
    Click Element By Text    ${btn_text}
    Sleep    ${wait_sec}s
    Page Should Contain    ${search_content}

Nav Redirect Test
    [Arguments]    ${title}

    Click Link    xpath=//nav//a[@title='${title}']
    Title Should Be    ${title}

Home Page Should Be Open
    Title Should Be    行政院數位影音資料館

Open Video Guide
    Click Link    xpath=//a[text()='網站導覽影片']
    Sleep    5s
    Click Element By class    button.close    True
    Sleep    5s

Open New Window
    [Arguments]    ${title}

    Click Link    xpath=//nav//a[='${title}']
    Sleep    5s
    Select Window    title=${title}
    Title Should Be    ${title}${element_count} > 0
    [Return]    ${element_exists}
