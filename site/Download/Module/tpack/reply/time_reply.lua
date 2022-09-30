msg_reply.time_reply = {
    keyword = {
        match = { "早上好","中午好","下午好","晚上好","早安","午安" }
    },
    limit = {
        cd = 10
    },
    echo = { lua = "time_reply" }
}