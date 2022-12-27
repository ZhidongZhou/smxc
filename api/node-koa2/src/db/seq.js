// sequelize 操作数据库
// sequelize 中文文档: https://www.sequelize.cn/

/**
 * 1. IMPORT
 */
// 1.1. Import 解构 Sequlize 类
const { Sequelize } = require('sequelize');
// 1.2. Import .env 环境变量
const {
    MYSQL_HOST,
    MYSQL_PORT,
    MYSQL_USER,
    MYSQL_DB,
} = require('../config/config.default');

// 2. 实例化 Sequelize, 链接 MySQL 数据库 '../data/smxc.sql' at 'localhost:3006'
const seq = new Sequelize(MYSQL_DB, MYSQL_USER, '', {
    host: MYSQL_HOST,
    // port: MYSQL_PORT,
    dialect: 'mysql'
}) // Todo: database password

// 3. 测试数据库连接
seq.authenticate().then(() => {
    console.log('Success! 数据库连接成功')
}).catch((err) => {
    console.log('Error! 数据库连接失败', err)
})

// 4. 导出数据库连接对象 seq
module.exports = seq