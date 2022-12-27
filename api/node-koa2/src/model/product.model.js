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
const Product = seq.define('products', {
    // product_id, sequelize auto gen
    product_title: {
        type: DataTypes.STRING,
        allowNull: false,
        comment: '产品名称'
    },
    product_desc: {
        type: DataTypes.STRING,
        allowNull: true,
        comment: '产品详情'
    },
    merchant_id: {
        type: DataTypes.INTEGER,
        allowNull: false,
        comment: '商家ID'
    },
    product_price: {
        type: DataTypes.DECIMAL,
        allowNull: false,
        comment: '产品定价'
    },
    stock: {
        type: DataTypes.INTEGER,
        allowNull: false,
        defaultValue: 0,
        comment: '产品库存'
    },
    product_img: {
        type: DataTypes.STRING,
        allowNull: false,
        comment: '产品图片'
    }
},
    /**
     * paranoid: 软删除实现 产品下架功能
     */
    {
        paranoid: true
    }

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

// Product.sync({ force: true })

/**
 * Export
 */
module.exports = Product