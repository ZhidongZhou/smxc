// 产品发布拆分为多个中间件

/**
 * IMPORT
 */


// 导入错误类型 (./src/constant/err.type.js)
const { productParmErr } = require('../constant/err.type')


/**
 * 2. MIDDLEWARE
 */

// 2.1. 发布新产品参数校验
const validator = async (ctx, next) => {
    try {
        ctx.verifyParams({
            product_title: {type: 'string', required: true}, // 校验产品名称必填
            product_desc: {type: 'string', required: false}, // 校验描述名称非必填
            product_price: {type: 'number', required: true}, // 校验产品价格必填
            stock:  {type: 'number', required: true}, // 校验产品库存必填
            product_img: {type: 'string', required: true} // 校验产品图片必填
        })
    } catch (err) {
        console.error(err)
        productParmErr.result = err
        return ctx.app.emit('error', productParmErr, ctx)
    }

    // 等待校验通过, 放行
    await next()
}

/**
 * EXPORT
 */

module.exports = {
    validator
}