// 路由统一加载管理脚本

/**
 * 1. IMPORT
 */

// 导入 file system 对象
const fs = require('fs')

// 导入 koa-router 对象
const Router = require('koa-router')

/**
 * 2. 实例化
 */

// 实例化Koa-router对象
const router = new Router()


/**
 * 3. 全局路由管理
 */

fs.readdirSync(__dirname).forEach(file => {
    // console.log(file)
    // 排除文件本身
    if(file !== 'index.js') {
        let r = require('./' + file)
        // 注册全部路由文件
        router.use(r.routes())
    }
})

/**
 * 4. EXPORT
 */

module.exports = router