// 用户数据库模型
// Sequlize 模型基础: https://www.sequelize.cn/core-concepts/model-basics

// 生成模型: `node src/model/cart_item.model.js`

/**
 * 1. IMPORT
 */

// 1.1. 
const { DataTypes, STRING } = require('sequelize')

// 1.2. 导入数据库连接: '../db/seq.js'
const seq = require('../db/seq')

/**
 * 2. 创建模型
 */

const Cart = seq.define('cart', {
    // user_id, sequelize auto gen
    product_id: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: true,
        comment: '产品id'
    },
    Quantity: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 1,
        comment: '数量'
    },
    merchant_id: {
        type: DataTypes.BOOLEAN,
        allowNull: false,
        comment: '商家id'
    },
    description_id: {
        type: DataTypes.STRING,
        allowNull: true,
        comment: '产品详情(可为空)'
    },
    user_id: {
        type: DataTypes.STRING,
        allowNull: false,
        comment: '用户id'
    }
})

/**
 * 强制创建数据表: 如果存在用户表, 覆写 (危险慎用)。
 */

// Cart.sync({ force: true }) 

/**
 * Export
 */

module.exports = Cart