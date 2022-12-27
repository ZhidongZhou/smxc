// 用户操作拆分为多个中间件

/**
 * IMPORT
 */

// 从用户服务, 获取 getUserInfo 服务
const { getUserInfo } = require('../service/user.service')

// 导入错误类型 (./src/constant/err.type.js)
const { emptyInputErr, duplicateUserNameErr, registerErr, userNotExistErr, loginErr, pwdErr } = require('../constant/err.type')

// 导入 bcrypt.js 用来加密 Password
const bcrypt = require('bcryptjs')

/**
 * 1. Register
 */

// 1.1.检查用户输入不为空
const userInputEmptyCheck = async (ctx, next) => {
    // 解构
    const { user_name, password } = ctx.request.body

    // 合法性认证
    if (!user_name || !password) {
        // 如果用户名/密码为空, 报错
        console.error('用户名或密码为空', ctx.request.body);
        // ctx.status = 400 // bad request
        // 报错统一处理
        ctx.app.emit('error', emptyInputErr, ctx)
        // ctx.body = {
        //     code: '10001',
        //     message: '用户名或密码为空',
        //     result: '',
        // }
        return
    }
    await next() // 执行下一个中间件
}

// 定义 bcrypt 密码加密
const cryptPassword = async (ctx, next) => {
    // 加密: hash = pwd + salt 
    const { password } = ctx.request.body
    const salt = bcrypt.genSaltSync(10);
    const hash = bcrypt.hashSync(password, salt);

    ctx.request.body.password = hash

    await next()
}

// 1.2.检查用户名不重复
const userRegisterUniqueCheck = async (ctx, next) => {

    // 解构
    const { user_name } = ctx.request.body
    // 差重
    try {
        const res = await getUserInfo({ user_name })
        // 合理性认证
        if (res) {
            // 用户名已存在 ctx.status = 409 conflic
            console.error('用户名已经存在', { user_name })
            ctx.app.emit('error', duplicateUserNameErr, ctx)
            return
        }
    } catch (err) {
        console.error('获取用户信息错误', err)
        ctx.app.emit("error", registerErr, ctx)
        return
    }
    await next() // 执行下一个中间件
}

// Todo: 2.2.3. 其他注册验证

/**
 * 2. Login
 */

// 2.1.检查用户密码是否正确
const verifyLogin = async (ctx, next) => {
    // 解构
    const { user_name, password } = ctx.request.body

    try {
        // 2.1.1.判断用户是否存在
        const res = await getUserInfo({ user_name })
        // 合理性认证
        if (!res) {
            // 用户名已存在 ctx.status = 409 conflic
            console.error('用户名不存在', { user_name })
            ctx.app.emit('error', userNotExistErr, ctx)
            return
        }

        // 2.1.2.判断用户密码
        if (!bcrypt.compareSync(password, res.password)) {
            ctx.app.emit('error', pwdErr, ctx)
            return
        }
    } catch (err) {
        console.error('获取用户信息错误', err)
        return ctx.app.emit("error", loginErr, ctx)
    }

    await next()
}


/**
 * EXPORT
 */

module.exports = {
    userInputEmptyCheck,
    userRegisterUniqueCheck,
    cryptPassword,
    verifyLogin
}
