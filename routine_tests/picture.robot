*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${return_url} =    https://video.ey.gov.tw/?eyp=photo&ccid=3&title=%E6%98%A0%E8%B1%A1%E8%90%AC%E8%8A%B1%E7%AD%92
${remote_img_path} =    http://video.ey.gov.tw/ContentStorage/71/65/D8A377833457-46A584CA-402C-B7DF-7165/profile/thumbnail.jpg

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    Maximize Browser Window

Left Admins Test
    Go To    ${return_url}
    Sleep    2s
    @{all_links} =    Get All Links Text or Title From    tag=tbody
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    # \    Wait Until Element Is Visible     xpath=//table[@class='table']//tbody//tr//td//a
    \    Sleep     2s
    \    Log To Console    ${lintext}
    \    ${attr_result} =    Check Link Parent Attr By Text    ${lintext}    tr    data-hasalbums    true
    \    Run Keyword If    ${attr_result}    Click Link By Text    ${lintext}
    \    Sleep     2s
    # \    Wait Until Element Is Visible By Class    li.active
    \    Run Keyword If    ${attr_result}    Compare Elements Text By Class    li.active    ${lintext}    True
    \    Run Keyword If    ${attr_result}    Go To    ${return_url}

Mid Pics Test
    Go To    ${return_url}
    Sleep    2s
    @{all_links} =    Get All Links Text or Title From    xpath=//ul[@class='all-listing']//li
    : FOR    ${lintext}    IN    @{all_links}
    \    Sleep    2s
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Wait Until Element Is Visible By Class    h1.title
    \    Compare Elements Text By Class    h1.title    ${lintext}    True
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

Right Pics Test
    Go To    ${return_url}
    Sleep    2s
    @{all_links} =    Get All Links Text or Title From    tag=dl
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Compare Elements Text By Class    h1.title    ${lintext}    False    True
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

Close Browser
    Close Browser
