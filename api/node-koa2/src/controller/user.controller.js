// controller 被路由调用, 引用 Service 层
/**
 * 1. IMPORT
 */
// 导入服务层操作 (创建用户, 查询用户, 更新密码), 解构数据
const { createUser, getUserInfo, updateById } = require('../service/user.service')


// 导入错误类型
const { registerErr, loginErr, changePasswordErr } = require('../constant/err.type')

// 导入JWT用户令牌
const jwt = require('jsonwebtoken')

// 从环境变量.env中导入 JWT 密钥
const { JWT_SECRET } = require('../config/config.default')

/**
 * 2. 用户请求控制
 */
class UserController {
    // 2.1. 用户注册, 返回内容
    async register(ctx, next) {

        // 2.1.获取用户输入
        // console.log(ctx.request.body)
        const { user_name, password } = ctx.request.body

        // 2.2.用户输入验证交由中间件处理: ../middleware/user.middleware.js
        // 2.2.1. userInputEmptyCheck
        // 2.2.2. userRegisterUniqueCheck

        // 3.操作数据库(调用服务层的 createUser 创建新用户); 等待操作完成
        try {
            const res = await createUser(user_name, password)
            // console.log(res)
            // 4.返回结果
            // ctx.body = ctx.request.body
            ctx.body = {
                code: 0,
                message: "新用户注册成功",
                result: {
                    id: res.id,
                    user_name: res.user_name
                }
            }
        } catch (err) {
            console.log(err)
            ctx.app.emit('error', registerErr, ctx)
        }
    }
    // 2.2. 用户登陆, 返回内容
    async login(ctx, next) {
        const { user_name } = ctx.request.body
        // 2.2.1. 获取用户信息(token payload: 记录user_id, user_name, is_admin)
        try {
            // 通过用户名, 从数据库查询, user_id, user_name, password, is_admin
            const { password, ...res } = await getUserInfo({ user_name })
            // token中不携带: password; 解构,用ES6中的剩余参数,拆分出剩余参数; 除password外的属性放入 resUser 对象
            ctx.body = {
                code: 0, // 成功
                message: `欢迎回来, ${user_name}`,
                result: {
                    token: jwt.sign(res, JWT_SECRET, { expiresIn: '1d' }) // 登陆成功返回: 用户令牌 (sign{user_id, user_name, is_admin}); 并设定1天有效期
                }
            }
        } catch (err) {
            console.err('用户登陆失败', err)
            ctx.app.emit('error', loginErr, ctx)
        }

    }

    // 2.3. 以登陆用户修改密码, 返回内容
    async changePassword(ctx, next) {
        // 2.3.1. 获取数据
        const id = ctx.state.user.id
        const password = ctx.request.body.password
        // 2.3.2 操作数据库
        try {
            if (await updateById({ id, password })) {
                ctx.body = {
                    code: 0,
                    message: '修改密码成功',
                    result: ''
                }
            }
        } catch (err) {
            console.error(err)
            ctx.app.emit('error', changePasswordErr, ctx)
        }
        // 2.3.3 返回结果
    }
}

/**
 * 3. EXPORT
 */
module.exports = new UserController()