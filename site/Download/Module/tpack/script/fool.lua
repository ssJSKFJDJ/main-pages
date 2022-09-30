-----------------------------------------------------------------------------
-- fool plugin.
-- 2022/07/02 2:28
-----------------------------------------------------------------------------

tgt = string.match(msg.fromMsg, "%d+")
if (tgt ~= nil) then
    if (tgt ~= getDiceQQ()) then
        return "[CQ:at,qq=" .. tgt .. "]{nick}说的就是你笨笨 "
    else
        return "你才笨笨{at}"
    end
else
    return "{at}笨蛋，会不会用你笨笨"
end
