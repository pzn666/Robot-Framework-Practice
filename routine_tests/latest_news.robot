*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${search_content} =    106年4月6日行政院會後記者會（第3543次會議）直播影音
${return_url} =    https://video.ey.gov.tw/?eyp=news&ccid=0&title=%E6%9C%80%E6%96%B0%E6%B6%88%E6%81%AF

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    # Maximize Browser Window

H1 Title Test
    Compare Elements Text By Class    h1    最新消息    True

Table Links Test
    @{all_links} =    Get All Links Text or Title From    tag=tbody
    : FOR    ${lintext}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Wait Until Element Is Visible   tag=article
    \    Wait Until Element Is Visible By Class    h1
    \    Title Should Be    ${lintext}
    \    Compare Elements Text By Class    h1    ${lintext}    True    True
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

# [geckodriver Bug with github #659]
# Search Table Test
#     Go To    ${return_url}
#     Sleep    2s
#     Search Test    ${search_content}    css=input.kw.form-control    篩選    5

Close Browser
    Close Browser