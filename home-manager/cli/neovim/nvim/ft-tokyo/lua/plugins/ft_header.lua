return {
    name = "ft_header",
    dir = "@ft_header@",
    cmd = {
        "StdHeader",
    },
    event = {
        "BufNewFile",
        "BufReadPre",
    },
    opts = {
        auto_update = true,
        user = "sota",
        mail = "sota@student.42tokyo.jp",
    },
}
