// KOA 业务相关内容
/**
 * -------------------- IMPORT -------------------- 
 */

// 导入 path 路径模块, 用于文件上传路径
const path = require('path')

// 导入 Koa 对象
const Koa = require('koa')

// 导入 Koa-body 对象
const { koaBody } = require('koa-body');

// 导入 koa-static 对象
const koaStatic = require('koa-static');

// 导入 router 文件夹
const router = require('../router/index')

// 导入统一错误处理
const errHandler = require('../app/errHandler')

// 导入 koa-parameter 参数管理
const parameter = require('koa-parameter');

/**
 * -------------------- INIT OBJECT -------------------- 
 */

// 实例化Koa对象
const app = new Koa()

/**
 * -------------------- MIDDLEWARE -------------------- 
 */

// 必须在路由之前注册 Koa-body
app.use(
    koaBody({
        // 允许文件上传
        multipart: true,
        formidable: {
            uploadDir: path.join(__dirname, '../upload'), // 相对路径指向, 相对当前执行路径
            keepExtensions: true
        }
    })
);

// 在路由中间件之前注册 parameter 参数管理
app.use(parameter(app)) // 可以使用 ctx.verifyParams() 方法
// 路由中间件(所有路由文件) [__dirname = smxc/api/node-koa2/src/app]
app.use(koaStatic(path.join(__dirname, '../upload')))
app.use(router.routes()).use(router.allowedMethods())
// app.use(userRouter.routes())
// app.use(productRouter.routes())

// 统一错误处理, 通过on来监听事件
app.on('error', errHandler)

/**
 * -------------------- EXPORT -------------------- 
 */
// 导出 app 对象
module.exports = app