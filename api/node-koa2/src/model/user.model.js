// 用户数据库模型
// Sequlize 模型基础: https://www.sequelize.cn/core-concepts/model-basics

// 生成模型: `node src/model/user.model.js`

/**
 * 1. IMPORT
 */

// 1.1. 
const { DataTypes } = require('sequelize')

// 1.2. 导入数据库连接: '../db/seq.js'
const seq = require('../db/seq')

/**
 * 2. 创建模型
 */
const User = seq.define('users', {
    // user_id, sequelize auto gen
    user_name: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        comment: 'Must be Unique'
    },
    password: {
        type: DataTypes.CHAR(64),
        allowNull: false,
        comment: '用户密码'
    },
    is_admin: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        defaultValue: 0,
        comment: '用户是否为管理员, (0:True, 1:False)'
    }
}, 
/**
 * 关闭默认创建: createdAt & updatedAt
 */

// {
//     timestamps: false,
// }
)

/**
 * 强制创建数据表: 如果存在用户表, 覆写 (危险慎用)。
 */

// User.sync({ force: true }) 

/**
 * Export
 */
module.exports = User