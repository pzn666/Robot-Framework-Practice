*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${return_url} =    https://video.ey.gov.tw/?eyp=recent&ccid=1&title=%E8%BF%91%E6%9C%9F%E5%BD%B1%E9%9F%B3
${remote_img_path} =    http://video.ey.gov.tw/ContentStorage/71/65/D8A377833457-46A584CA-402C-B7DF-7165/profile/thumbnail.jpg
${local_img_path} =    /Users/pzn666/Pictures/Miku.jpeg

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    Maximize Browser Window
    
Left Sub Navs Test
    Go To    ${return_url}
    Wait Until Element Is Visible   xpath=//div[@class='cat clearfix']//div//ul//li
    @{all_links} =    Get All Links Text or Title From    css=div.cat.clearfix
    : FOR    ${lintext}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    2s
    \    Compare Elements Text By Class    li.active    ${lintext}    True
    \    Go To    ${return_url}

Mid Older Video List Test
    Go To    ${return_url}
    Wait Until Element Is Visible   css=ul.all-listing
    @{all_links} =    Get All Links Text or Title From    css=ul.all-listing
    : FOR    ${lintext}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Sleep    2s
    \    Compare Elements Text By Class    h1    ${lintext}    False    True
    # \    ${background_img_path} =    Get Background Img Paths By Class    div.ivb.video    True
    # \    Compare Image    ${background_img_path}    ${background_img_path}
    \    Go To    ${return_url}

Right Hot Video List Test
    Go To    ${return_url}
    Wait Until Element Is Visible   tag=dl
    @{all_links} =    Get All Links Text or Title From    tag=dl
    : FOR    ${lintext}    IN    @{all_links}
    \    Wait Until Element Is Visible By Title    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Title    ${lintext}
    \    Title Should Be    ${lintext}
    \    Compare Elements Text By Class    h1    ${lintext}    False    True
    # \    ${background_img_path} =    Get Background Img Paths By Class    div.ivb.video    True
    # \    Compare Image    ${background_img_path}    ${background_img_path}
    \    Go To    ${return_url}

Close Browser
    Close Browser
