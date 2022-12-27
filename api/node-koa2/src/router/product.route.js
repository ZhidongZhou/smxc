// `/products` 路由
/**
 * -------------------- 1. IMPORT -------------------- 
 */

// 导入 koa-router 对象
const Router = require('koa-router')

// 导入 Product Controller 操作数据库, 并解构对象
const { upload, create, update, remove, restore, findAll } = require('../controller/product.controller')

// 导入中间件
const { auth, isAdmin } = require('../middleware/auth.middleware')

// 导入参数校验中间件
const { validator } = require('../middleware/product.middleware')

/**
 * -------------------- 2. INIT OBJECT -------------------- 
 */
// 实例化Koa-router对象
const router = new Router({ prefix: '/products' })

/**
 * -------------------- 3. API -------------------- 
 */

// 3.1. 产品图片上传接口: /products/upload
// 要求只有登陆的管理员可以操作
// for testing: close the authentication
// router.post('/upload', upload)
router.post('/upload', auth, isAdmin, upload)

// 3.2. 产品发布接口: /products/np
router.post('/np', auth, isAdmin, validator, create, ctx => {
    ctx.body = "新产品发布成功"
})

// 3.3. 产品更新接口: /products/up/$id
router.put('/up/:id', auth, isAdmin, validator, update, ctx => {
    ctx.body = "产品更新成功"
})

// 3.4. 产品硬删除接口: /product/del/$id
router.delete('/del/:id', auth, isAdmin, remove, ctx => {
    ctx.body = "产品删除成功"
})

// 3.5. 产品下架: /product/off/$id
router.post('/off/:id', auth, isAdmin, remove, ctx => {
    ctx.body = "产品下架成功"
})

// 3.6. 产品上架: /product/backon/$id
router.post('/backon/:id', auth, isAdmin, restore, ctx => {
    ctx.body = "产品重新上架成功"
})

// 3.7. 获取产品列表
router.get('/', findAll, ctx => {
    ctx.body = "产品列表请求成功"
})


/**
 * -------------------- 4. SERVICES -------------------- 
 */
// router.get('/', (ctx, next) => {
//     ctx.body = 'Product List'
// })

/**
 * -------------------- 5. EXPORT -------------------- 
 */
module.exports = router