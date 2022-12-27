module.exports = (err, ctx) => {
    // 默认500
    let status = 500
    switch (err.code)  {
        // 用户名密码为空
        case '10001': 
            status = 400
        break
        // 用户名已存在
        case '10002': 
            status = 409
        break
        // 默认500
        default:
            status = 500

        // Todo: 其他报错类型
    }

    // 统一
    ctx.status = status
    ctx.body = err
    console.log(err)
}