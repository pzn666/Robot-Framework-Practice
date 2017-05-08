*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${return_url} =    https://video.ey.gov.tw/?eyp=article&ccid=5&title=%E4%B8%BB%E9%A1%8C%E5%B0%88%E5%8D%80
${remote_img_path} =    http://video.ey.gov.tw/ContentStorage/71/65/D8A377833457-46A584CA-402C-B7DF-7165/profile/thumbnail.jpg

*** Test Cases ***
Open Home Page
    Open Browser    ${return_url}    Firefox
    Set Selenium Speed    0
    Maximize Browser Window

Theme Test
    @{all_links} =    Get All Links Text or Title From    css=ul.listing.row
    : FOR    ${lintext}    IN    @{all_links}
    \    Wait Until Element Is Visible By Text    ${lintext}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Title Should Be    ${lintext}
    \    Go To    ${return_url}

Culture Test
    Go To    https://video.ey.gov.tw/?eyp=article_detail&ccid=5&id=5040000&title=%E6%96%87%E5%8C%96%E5%8F%8A%E8%A7%80%E5%85%89%E7%99%BC%E5%B1%95
    Sleep    3s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@id='artdt']//nav
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    3s
    \    Element Should Contain    css=div.carousel-inner    ${lintext}

    @{all_timeline_texts} =    Get All Element Text From With Tag    css=div.events    i
    Reverse List    ${all_timeline_texts}
    : FOR    ${text}    IN    @{all_timeline_texts}
    \    Log To Console    ${text}
    \    Click Link    xpath=//div[@id='artdt-carousel-tl']//a[@class='left carousel-control']
    \    Sleep    3s
    \    Element Should Contain    xpath=//div[@class='events']//i[@class='on']    ${text}

Economy Test
    Go To    https://video.ey.gov.tw/?eyp=article_detail&ccid=5&id=6040030&title=%E7%B6%93%E6%BF%9F%E7%99%BC%E5%B1%95
    Sleep    3s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@id='artdt']//nav
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    3s
    \    Element Should Contain Text    css=div.carousel-inner    ${lintext}    True

    @{all_timeline_texts} =    Get All Element Text From With Tag    css=div.events    i
    Reverse List    ${all_timeline_texts}
    : FOR    ${text}    IN    @{all_timeline_texts}
    \    Log To Console    ${text}
    \    Click Link    xpath=//div[@id='artdt-carousel-tl']//a[@class='left carousel-control']
    \    Sleep    3s
    \    Element Should Contain    xpath=//div[@class='events']//i[@class='on']    ${text}

Construction Test
    Go To    https://video.ey.gov.tw/?eyp=article_detail&ccid=5&id=6040038&title=%E4%BA%A4%E9%80%9A%E5%8F%8A%E5%BB%BA%E8%A8%AD%E7%99%BC%E5%B1%95
    Sleep    3s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@id='artdt']//nav
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    3s
    \    Element Should Contain Text    css=div.carousel-inner    ${lintext}    True

    @{all_timeline_texts} =    Get All Element Text From With Tag    css=div.events    i
    Reverse List    ${all_timeline_texts}
    : FOR    ${text}    IN    @{all_timeline_texts}
    \    Log To Console    ${text}
    \    Click Link    xpath=//div[@id='artdt-carousel-tl']//a[@class='left carousel-control']
    \    Sleep    3s
    \    Element Should Contain    xpath=//div[@class='events']//i[@class='on']    ${text}

Agriculture Test
    Go To    https://video.ey.gov.tw/?eyp=article_detail&ccid=5&id=6040039&title=%E8%BE%B2%E6%9D%91%E8%88%87%E6%BC%81%E6%A5%AD%E6%8C%AF%E8%88%88
    Sleep    3s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@id='artdt']//nav
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    3s
    \    Element Should Contain Text    css=div.carousel-inner    ${lintext}    True

    @{all_timeline_texts} =    Get All Element Text From With Tag    css=div.events    i
    Reverse List    ${all_timeline_texts}
    : FOR    ${text}    IN    @{all_timeline_texts}
    \    Log To Console    ${text}
    \    Click Link    xpath=//div[@id='artdt-carousel-tl']//a[@class='left carousel-control']
    \    Sleep    3s
    \    Element Should Contain    xpath=//div[@class='events']//i[@class='on']    ${text}

Multi-ethnic Test
    Go To    https://video.ey.gov.tw/?eyp=article_detail&ccid=5&id=6040040&title=%E5%A4%9A%E5%85%83%E6%97%8F%E7%BE%A4%E8%88%87%E5%BC%B1%E5%8B%A2%E7%85%A7%E9%A1%A7
    Sleep    3s
    @{all_links} =    Get All Links Text or Title From    xpath=//div[@id='artdt']//nav
    : FOR    ${lintext}    IN    @{all_links}
    \    Log To Console    ${lintext}
    \    Click Link By Text    ${lintext}
    \    Sleep    3s
    \    Element Should Contain Text    css=div.carousel-inner    ${lintext}    True

    @{all_timeline_texts} =    Get All Element Text From With Tag    css=div.events    i
    Reverse List    ${all_timeline_texts}
    : FOR    ${text}    IN    @{all_timeline_texts}
    \    Log To Console    ${text}
    \    Click Link    xpath=//div[@id='artdt-carousel-tl']//a[@class='left carousel-control']
    \    Sleep    3s
    \    Element Should Contain    xpath=//div[@class='events']//i[@class='on']    ${text}

Close Browser
    Close Browser
