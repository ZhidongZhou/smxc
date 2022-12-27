// dot env 对象
const dotenv = require('dotenv');

// 实例化dotenv, 从.env文件获取环境变量
dotenv.config()

// 测试成功获取环境变量
// console.log(process.env.APP_PORT) 

// 导出环境变量
module.exports = process.env