---------------------------------------------------------------------------------
-- 摸鱼人日历 plugin
-- by 简律纯 2022/06
-- https://api.vvhan.com/api/moyu?type=json
-- {"success":true,"url":"https:\/\/static.4ce.cn\/star3\/origin\/78c47a39eed1e4f39d0d7e97e8da0bd4.png?rw=540&rh=804&_fileSize=833558&_orientation=1"}
---------------------------------------------------------------------------------
res, info = http.get("https://api.vvhan.com/api/moyu?type=json")
json = require "json"
j = json.decode(info)
return "[CQ:image,file=" .. j.url .. "]"