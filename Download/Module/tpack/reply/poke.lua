msg_reply.poke = {
    keyword = {
        match = { "[CQ:poke,id="..getDiceQQ().."]" }
    },
    echo = { lua = "poke" }
}