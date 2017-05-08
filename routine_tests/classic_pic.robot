*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${return_url} =    https://video.ey.gov.tw/?eyp=archive&ccid=2&title=%E5%85%B8%E8%97%8F%E9%A2%A8%E8%8F%AF
${remote_img_path} =    http://video.ey.gov.tw/ContentStorage/71/65/D8A377833457-46A584CA-402C-B7DF-7165/profile/thumbnail.jpg

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    Maximize Browser Window

Left Admins Test
    Go To    ${return_url}
    Sleep    5s
    @{all_links} =    Get All Links Text or Title From    tag=tbody
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    \    Sleep    2s
    \    Wait Until Element Is Visible By Text    ${lintext}
    \    Log To Console    ${lintext}
    \    ${attr_result} =    Check Link Parent Attr By Text    ${lintext}    tr    data-hasalbums    true
    \    Run Keyword If    ${attr_result} == 'True'    Click Link By Text    ${lintext}
    \    Run Keyword If    ${attr_result} == 'True'    Compare Elements Text By Class    li.active    ${lintext}    True
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

Mid Time Line Test
    Go To    ${return_url}
    Sleep    2s
    @{all_links} =    Get All Links Text From    css=div.timeline
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    \    Sleep    3s
    \    Click Element Until Target Is Visible    xpath=//a[@class='down']    xpath=//a[text()='${lintext}']    100s    1s
    \    Log To Console    ${lintext}
    \    Click Element When Attribute    xpath=//a[text()='${lintext}']    data-hasalbums    true
    \    ${name} =    Get Substring    ${lintext}    0   3
    \    Sleep    2s
    \    ${attr_result} =    Check Element Attribute    xpath=//a[text()='${lintext}']    data-hasalbums    true
    \    Run Keyword If    ${attr_result}    Compare Elements Text By Class    li.active    ${name}    True
    \    Run Keyword If    ${attr_result}    Go To    ${return_url}

Right Hot Video Test
    Go To    ${return_url}
    Wait Until Element Is Visible   tag=dl
    @{all_links} =    Get All Links Text or Title From    tag=dl
    Should Not Be Empty    ${all_links}
    : FOR    ${lintext}    IN    @{all_links}
    \    Sleep    2s
    \    Wait Until Element Is Visible By Title    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Title Should Be    ${lintext}
    \    Wait Until ELement Is Visible By Class    h1.title
    \    Compare Elements Text By Class    h1    ${lintext}    False     True
    \    ${background_img_path} =    Get Background Img Paths By Class    div.ivb.video    True
    \    Compare Image    ${background_img_path}    ${background_img_path}
    \    Run Keyword If    '${return_url}' != ''    Go To    ${return_url}

Close Browser
    Close Browser
