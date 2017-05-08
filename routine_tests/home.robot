*** Settings ***
Library           Selenium2Library
Resource          resource.robot

*** Variables ***
${search_content} =    前瞻基礎建設計畫

*** Test Cases ***
Open Home Page
    Open Browser To Home Page
    Home Page Should Be Open
    Maximize Browser Window

Video Recent Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Wait Until Element Is Visible By Class    div.video
    Sleep    2s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='videoRecent page']//div[@class='container']
    : FOR    ${link_text}    IN    @{all_links}
    \    Log To Console    ${link_text}
    \    Click Link By Text    ${link_text}
    \    Sleep    2s
    \    Element Should Be Visible    css=div.modal-dialog.modal-lg
    \    Compare Elements Text By ID    ivpModalLabel    ${link_text}    True
    \    Click Element By Class    button.close
    \    Sleep    2s

Most Viewed Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Click Link By Attribute    href    '#mostViewed'
    Wait Until Element Is Visible By Class    div.mostViewed.page
    Sleep    2s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='mostViewed page']//div[@class='container']
    : FOR    ${link_text}    IN    @{all_links}
    \    Log To Console    ${link_text}
    \    Click Link By Title    ${link_text}
    \    Sleep    2s
    \    Element Should Be Visible    css=div.modal-dialog.modal-lg
    \    Compare Elements Text By ID    ivpModalLabel    ${link_text}    True
    \    Click Element By Class    button.close
    \    Sleep    2s

    @{all_videos} =    Get All Element Title Or Text With    css=div.ivb.video.big
    : FOR    ${video_text}    IN    @{all_videos}
    \    Log To Console    ${video_text}
    \    Click Element By Text    ${video_text}
    \    Sleep    2s
    \    Element Should Be Visible    css=div.modal-dialog.modal-lg
    \    Compare Elements Text By ID    ivpModalLabel    ${video_text}    True
    \    Click Element By Class    button.close
    \    Sleep    2s

    @{all_videos} =    Get All Element Title Or Text With    css=div.ivb.video
    : FOR    ${video_text}    IN    @{all_videos}
    \    Log To Console    ${video_text}
    \    Click Element By Title    ${video_text}
    \    Sleep    2s
    \    Element Should Be Visible    css=div.modal-dialog.modal-lg
    \    Compare Elements Text By ID    ivpModalLabel    ${video_text}    True
    \    Click Element By Class    button.close
    \    Sleep    2s

Archive Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Click Link By Attribute    href    '#mostViewed'
    Click Link By Attribute    href    '#archive'
    Wait Until Element Is Visible By Class    div.archive.page
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='archive page']//ol
    : FOR    ${link_text}    IN    @{all_links}
    \    Sleep    5s
    \    Click Element Until Target Is Visible    xpath=//div[@class='archive page']//a[@class='right carousel-control']    xpath=//a[@title='${link_text}']
    \    ${expect_title} =    Get Substring    ${link_text}    0    3
    \    Sleep    2s
    \    Log To Console    ${expect_title}
    \    Click Link By Title    ${link_text}
    \    Wait Until Browser Title Is   ${expect_title}
    \    Title Should Be    ${expect_title}
    \    Go To    https://video.ey.gov.tw

Photo Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Click Link By Attribute    href    '#mostViewed'
    Click Link By Attribute    href    '#archive'
    Click Link By Attribute    href    '#photo'
    Wait Until Element Is Visible By Class    div.photo.page
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='photo page']//div[@class='container']
    : FOR    ${link_text}    IN    @{all_links}
    \    Log To Console    ${link_text}
    \    Click Link By Title    ${link_text}
    \    Sleep    5s
    \    Element Should Be Visible    css=div.modal-dialog.modal-lg
    \    Compare Elements Text By ID    ivpModalLabel    ${link_text}    True
    \    Click Element By Class    button.close
    \    Sleep    5s

# Memory Test
#     Wait Until Element Is Visible By Class    div.memory.page
#     Click Link By Attribute    href    '#article'

Article Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Click Link By Attribute    href    '#mostViewed'
    Click Link By Attribute    href    '#archive'
    Click Link By Attribute    href    '#photo'
    Click Link By Attribute    href    '#memory'
    Click Link By Attribute    href    '#article'
    Wait Until Element Is Visible By Class    div.article.page
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='article page']//div[@class='container']
    : FOR    ${link_text}    IN    @{all_links}
    \    Wait Until Element Is Visible By Class    div.article.page
    \    Log To Console    ${link_text}
    \    Click Link By Title    ${link_text}
    \    Wait Until Browser Title Is   ${link_text}
    \    Go To    https://video.ey.gov.tw
    # Click Link By Attribute    href    '#policy'

Policy Test
    Go To    https://video.ey.gov.tw
    Click Link By Attribute    href    '#videoRecent'
    Click Link By Attribute    href    '#mostViewed'
    Click Link By Attribute    href    '#archive'
    Click Link By Attribute    href    '#photo'
    Click Link By Attribute    href    '#memory'
    Click Link By Attribute    href    '#article'
    Click Link By Attribute    href    '#policy'
    Wait Until Element Is Visible By Class    div.policy.page
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@class='policy page']//div[@class='container']
    : FOR    ${link_text}    IN    @{all_links}
    \    Wait Until Element Is Visible By Class    div.policy.page
    \    Log To Console    ${link_text}
    \    Click Link By Title    ${link_text}
    \    Wait Until Browser Title Is   ${link_text}
    \    Go To    https://video.ey.gov.tw

# Header Test
#     @{TITLE_LIST} =    Create List    關於本站    網站導覽    系統客服    互動遊戲    開放資料
#     :FOR    ${title}    IN    @{TITLE_LIST}
#     \    Log To Console    ${title}
#     \    Click Link By Text    ${title}
#     \    Title Should Be    ${expect_value}
#     \    Go To    ${HOME}

# Navbar Test
#     @{TITLE_LIST} =    Create List    最新消息    近期影音    典藏風華    映象萬花筒    記憶刻痕
#     :FOR    ${title}    IN    @{TITLE_LIST}
#     \    Log To Console    ${title}
#     \    Nav Redirect Test    ${title}
#     \    Go To    ${HOME}

# [geckodriver Bug with github #659]
# Header Search Test
#     Mouse Over    css=form.form.clearfix
#     Search Test    ${search_content}    id=searchKeyword    搜尋    5
#     Go To    ${HOME}

# Open Video Guide
#     Open Video Guide
    
# Redirect To Gov
#     Open New Window    行政院全球資訊網

Close Browser
    Close Browser