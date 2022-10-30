-----------------------------------------------------------------------------
-- poke plugin.
-- 2022/06 by 简律纯
-----------------------------------------------------------------------------

poke_reply = {
    '"[CQ:poke,qq="..msg.fromQQ.."]"',
    '"{nick}想做什么？"',
    '"{self}在哦"',
    '"{self}报时~"..os.date("%X")',
    '"[CQ:poke,qq="..msg.fromQQ.."]\f[CQ:poke,qq="..msg.fromQQ.."]\f[CQ:poke,qq="..msg.fromQQ.."]\f[CQ:poke,qq="..msg.fromQQ.."]\f[CQ:poke,qq="..msg.fromQQ.."]\f五连击！#看你以后还敢不敢戳我"',
    '"[CQ:poke,qq="..msg.fromQQ.."]戳回去"',
    'eventMsg("/throw正摆烂了反躺平吧",msg.fromGroup,msg.fromQQ)',
    'eventMsg(".r",msg.fromGroup,msg.fromQQ)'
}

return load("return " .. poke_reply[ranint(1, #poke_reply)])()