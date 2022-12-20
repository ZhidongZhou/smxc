// 入口文件

// Koa 对象
const Koa = require('koa')

// 实例化Koa对象
const app = new Koa()

// 中间件函数
app.use((ctx, next) => {
    // 参数1: ctc: context 记录所有http上下文
    ctx.body = 'hello world' // 返回内容
})

// 监听3000端口
app.listen(3000, () => {
    console.log('server is on http://localhost:3000')
})