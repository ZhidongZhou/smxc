// 用户授权中间件

/**
 * 1.IMPORT
 */

// 导入 jwt 用于token验证
const jwt = require('jsonwebtoken')

// 导入.env环境变量 JWT_SECRET 用于token验证
const { JWT_SECRET } = require('../config/config.default')

// 导入错误类型 (./src/constant/err.type.js)

const { tokenExpiredErr, invalidTokenErr, notAdminErr } = require('../constant/err.type')


/**
 * 2. MIDDLEWARE
 */
// 2.1. 用户名密码验证
const auth = async (ctx, next) => {
    // 从用户请求头解构 token 信息
    const { authorization = '' } = ctx.request.header
    const token = authorization.replace('Bearer ', '')
    console.log(token)
    // 通过 JWT 来验证 token
    try {
        // user中包含(user_id, user_name, password, is_admin)
        const user = jwt.verify(token, JWT_SECRET)
        ctx.state.user = user
    } catch (err) {
        // token 验证可能有多种错误: 
        switch (err.name) {
            case 'TokenExpiredError':
                console.error(err, "token已过期, 尝试重新登陆")
                return ctx.app.emit('error', tokenExpiredErr, ctx)
            case 'jsonWebTokenError':
                console.error(err, '')
                return ctx.app.emit('error', invalidTokenErr, ctx)
        }
    }

    await next()
}

// 2.2. 管理员权限验证
const isAdmin = async (ctx, next) => {
    // 解构出 is_admin 值
    const { is_admin } = ctx.state.user
    if (!is_admin) {
        console.error('你没有管理员权限', ctx.state.user)
        return ctx.app.emit('error', notAdminErr, ctx)
    }
    await next()
}

/**
 * 3. EXPORT
 */

module.exports = {
    auth,
    isAdmin,
}