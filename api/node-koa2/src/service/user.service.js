// Service层 被 Controller 调用, 并直接操作数据库
/**
 * 1. Import
 */

// 1.1.导入User Model对象
const User = require('../model/user.model');

/**
 * 2. 用户请求数据库操作
 */

class UserService {
    // 2.1. CREATE 用户注册
    async createUser(user_name, password) {
        // 写入数据库, 并等待成功回复
        const res = await User.create({ user_name, password })
        // console.log(res)
        // return 'Success! 新用户已写入数据库'
        return res.dataValues
    }

    // 2.2. READ 获取用户数据
    async getUserInfo({ id, user_name, password, is_admin }) {
        // async 返回 promise 对象
        const whereOpt = {}

        // 用户id已存在, 复制拷贝assign到 WHERE 条件中
        id && Object.assign(whereOpt, { id })
        user_name && Object.assign(whereOpt, { user_name })
        password && Object.assign(whereOpt, { password })
        is_admin && Object.assign(whereOpt, { is_admin })

        // findOne 方法获得它找到的第一个条目(它可以满足提供的可选查询参数): https://www.sequelize.cn/core-concepts/model-querying-finders
        const res = await User.findOne({
            attributes: ['id', 'user_name', 'password', 'is_admin'],
            where: whereOpt,
        })
        // res 有结果返回 res, 没有结果返回 NULL
        return res ? res.dataValues : null
    }

    // 2.3. UPDATE 根据用户id更新用户数据
    async updateById({ id, user_name, password, is_admin }) {
        const whereOpt = { id }
        const newUser = {}

        user_name && Object.assign(newUser, { user_name })
        password && Object.assign(newUser, { password })
        is_admin && Object.assign(newUser, { is_admin })

        // sequelize update 方法修改密码 (此方法被 controller 调用)
        console.log(newUser)
        const res = await User.update(newUser, { where: whereOpt })
        return res[0] > 0 ? true: false
    }

}

/**
 * 3. EXPORT
 */

module.exports = new UserService()