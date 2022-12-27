// `/user` 路由
/**
 * -------------------- IMPORT -------------------- 
 */

// 导入 koa-router 对象
const Router = require('koa-router')

// 导入 User Controller, 并解构对象
const { register, login, changePassword } = require('../controller/user.controller')

// 导入用户中间件
const { userInputEmptyCheck, userRegisterUniqueCheck, cryptPassword, verifyLogin } = require('../middleware/user.middleware')

// 导入验证中间件
const { auth } = require('../middleware/auth.middleware')

/**
 * -------------------- INIT OBJECT -------------------- 
 */
// 实例化Koa-router对象
const router = new Router({ prefix: '/users' })

/**
 * -------------------- API -------------------- 
 */

// 注册接口: /users/register
// 先交由用户参数验证中间件，进行验证, 并对密码加密
router.post('/register', userInputEmptyCheck, userRegisterUniqueCheck, cryptPassword, register)

// 登陆接口 /users/login
router.post('/login', userInputEmptyCheck, verifyLogin, login)

// 修改密码接口 /users/
// 调用 controller 修改密码
router.patch('/', auth, cryptPassword, changePassword, (ctx, next) => {
    // 通过 auth.middleware 中间件获取用户token认证
    console.log(ctx.state.user)
    ctx.body = '修改密码成功'
})


/**
 * -------------------- SERVICES -------------------- 
 */
router.get('/', (ctx, next) => {
    ctx.body = 'User Sign In/Sign UP'
})

/**
 * -------------------- EXPORT -------------------- 
 */
module.exports = router