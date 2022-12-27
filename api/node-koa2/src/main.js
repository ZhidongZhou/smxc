// 入口文件

/**
 * -------------------- IMPORT -------------------- 
 */

// 导入dotenv配置文件; 从dotenv的默认环境变量配置文件获取环境变量, 并解构出所需变量; e.g. APP_PORT
const { APP_PORT } = require('./config/config.default')

// 导入app业务; 从 ./app/index.js
const app = require('./app/index')

/**
 * -------------------- INIT OBJECT -------------------- 
 */

/**
 * -------------------- MIDDLEWARE -------------------- 
 */

// 中间件函数
app.use((ctx, next) => {
    // 参数1: ctc: context 记录所有http上下文
    ctx.body = '404:Page Not Found 【页面不存在】!!!' // 返回内容
})

/**
 * -------------------- SERVICES -------------------- 
 */

// 监听3000端口
app.listen(APP_PORT, () => {
    console.log(`server is on http://localhost:${APP_PORT}`)
})