*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${return_url} =    https://video.ey.gov.tw/?eyp=policy&ccid=6&title=%E6%94%BF%E7%AD%96%E8%B6%B3%E8%B7%A1

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    Maximize Browser Window

Left Navigate Test
    Go To    ${return_url}
    Wait Until Element Is Visible By Class    div.cat
    @{all_links} =    Get All Links Text or Title From    css=div.cat
    : FOR    ${link_text}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${link_text}
    \    Log To Console    ${link_text}
    \    Click Link By Text    ${link_text}
    \    Wait Until Element Is Visible By Class    li.active
    \    Sleep    2s
    \    Compare Elements Text By Class    li.active    ${link_text}    True
    \    Go To    ${return_url}

Mid Navigate Test
    Go To    ${return_url}
    Wait Until Element Is Visible By Class    ul.all-listing.video
    @{all_links} =    Get All Links Text or Title From    css=ul.all-listing.video
    : FOR    ${link_text}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${link_text}
    \    Log To Console    ${link_text}
    \    Click Link By Text    ${link_text}
    \    Wait Until Element Is Visible By Class    li.active
    \    Sleep    2s
    \    Compare Elements Text By Class    li.active    ${link_text}    True
    \    Go To    ${return_url}

Right Navigate Test
    Go To    ${return_url}
    Wait Until Element Is Visible    tag=dl
    @{all_links} =    Get All Links Text or Title From    tag=dl
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Compare Elements Text By Class    h1.title    ${lintext}    False    True
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

Close Browser
    Close Browser
