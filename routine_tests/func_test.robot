*** Settings ***
Library           Selenium2Library
Library           Collections
Resource          resource.robot

*** Variables ***
${test_url} =    https://video.ey.gov.tw/?eyp=photo&ccid=3&cid=3010000&eid=6040037&ptype=list&title=%E6%9E%97%E3%80%80%E5%85%A8
${remote_img_path} =    http://video.ey.gov.tw/ContentStorage/71/65/D8A377833457-46A584CA-402C-B7DF-7165/profile/thumbnail.jpg
${local_img_path} =    /Users/pzn666/Pictures/Miku.jpeg
${test_titile} =    2017年4月8日行政院長林全出席「第七屆台灣兒童醫療貢獻獎」頒獎典禮

*** Test Cases ***
Open Home Page
    Open Browser    ${test_url}    Firefox
    Set Selenium Speed    0
    Sleep    5s

Click Link By Title
    Maximize Browser Window
    Sleep    5s
    Click Link    xpath=//a[@title='${test_titile}']
    Title Should Be    ${test_titile}
    # Click Link By Title    2017年4月12日台東大武愛國蒲部落遷建 林揆期許如質完工早日遷居（行政院長林全參加「莫蘭蒂災後大武愛國蒲部落遷建動土祈福典禮」）

# [TESTED]
# Click Element By ID
#     Click Element By ID    dropdownMenuOrder
#     Sleep    5s

# [TESTED]
# Click Link By ID
#     Click Link By ID    dropdownMenuOrder
#     Sleep    5s

# [TESTED]
# Get All Img Paths Test
#     @{img_path_list} =    Get Background Img Paths By Class    a.img
#     : FOR    ${path}    IN    @{img_path_list}
#     \    Log To Console    ${path}

# [TESTED]
# Text Match Test
#     Compare Elements Title By Class    h1.title    2017年4月12日台東大武愛國蒲部落遷建 林揆期許如質完工早日遷居（行政院長林全參加「莫蘭蒂災後大武愛國蒲部落遷建動土祈福典禮」）    False

# [TESTED]
# Title Match Test
#     Compare Elements Title By Class    div.ivb.video    2017年4月12日台東大武愛國蒲部落遷建 林揆期許如質完工早日遷居（行政院長林全參加「莫蘭蒂災後大武愛國蒲部落遷建動土祈福典禮」）    False

Close Browser
    Close Browser
