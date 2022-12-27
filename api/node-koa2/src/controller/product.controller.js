// controller 被路由调用, 引用 Service 层
/**
 * 1. IMPORT 
 */
// 导入 path 路径模块, 用于文件上传路径
const path = require('path')

// 导入服务层操作 ProductService(), 解构数据
const { createProduct, updateProduct, removeProduct, restoreProduct, findProducts } = require('../service/product.service')

// 导入错误类型
const { fileUploadErr, fileTypeErr, postProductErr, upProductErr, productIdErr } = require('../constant/err.type')

/**
 * 2. 产品控制器
 */

class ProductController {

    /**
     * ADMIN 管理员操作
     */

    // 2.1. 产品上传
    async upload(ctx, next) {
        // 2.1.1. 获取图片输入
        // 来自 Koa-body 的上传图片信息
        try {
            const { file } = ctx.request.files

            // 允许的图片格式《白名单》
            const fileTypes = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp', 'image/gif']

            if (file) {
                // Todo: 目前非白名单的文件格式还是能够上传到 upload 文件夹
                if (!fileTypes.includes(file.mimetype)) {
                    return ctx.app.emit('error', fileTypeErr, ctx)
                }
                // 2.1.3. 返回结果
                // 格式正确，完成文件上传
                ctx.body = {
                    code: 0,
                    message: '产品图片上传成功',
                    result: {
                        // 2.1.2. 文件存储
                        product_img: path.basename(file._writeStream.path)
                    }
                }
            } else {
                return ctx.app.emit('error', fileUploadErr, ctx)
            }
        } catch (err) {
            console.error(err)
            ctx.app.emit('error', fileUploadErr, ctx)
        }
    }

    // 2.2. 新发布产品写入数据库控制器
    async create(ctx) { // 不需要接着传, 所以不需要next
        // 2.2.1. 传递参数到 数据库操作的 service 文件中
        try {
            const { createdAt, updatedAt, ...res } = await createProduct(ctx.request.body)
            // 从返回内容中剔除 createdAt & updatedAt 
            ctx.body = {
                code: 0,
                message: '发布产品成功',
                result: res
            }
        } catch (err) {
            console.error(err)
            return ctx.app.emit('error', postProductErr, ctx)
        }

        // 2.2.2. 调用 service 中的 create 方法

    }

    // 2.3. 更新产品写入数据库控制器
    async update(ctx) {

        // 2.3.1. 调用 数据库操作的 service 文件中
        try {
            const res = await updateProduct(ctx.params.id, ctx.request.body)
            // 如果 res:true 成功
            if (res) {
                ctx.body = {
                    code: 0,
                    message: '商品更新成功',
                    result: ''
                }
            } else {
                return ctx.app.emit('error', productIdErr, ctx)
            }
        } catch (err) {
            console.error(err)
            return ctx.app.emit('error', upProductErr, ctx)
        }
    }

    // 2.4. 删除/下架产品 数据库控制器
    async remove(ctx) {
        try {
            const res = await removeProduct(ctx.params.id)
            if (res) {
                ctx.body = {
                    code: 0,
                    message: '产品移除成功',
                    result: ''
                }
            } else {
                return ctx.app.emit('error', productIdErr, ctx)
            }

        } catch (err) {
            console.error(err)
        }
    }

    // 2.5. 产品重新上架 数据库控制器
    async restore(ctx) {
        try {
            const res = await restoreProduct(ctx.params.id)
            if (res) {
                ctx.body = {
                    code: 0,
                    message: '产品重新上架成功',
                    result: ''
                }
            } else {
                return ctx.app.emit('error', productIdErr, ctx)
            }

        } catch (err) {
            console.error(err)
        }
    }

    /**
     * USER 用户操作
     */

    // 2.6. 想数据库请求读取全部产品
    async findAll(ctx) {
        try {
            // 2.6.1. 解析用户GET请求携带的参数 {pageNum, pageSize} 并赋予默认值
            const {pageNum = 1, pageSize = 10} = ctx.request.query
            // 2.6.2. 调用数据处理服务 Service
            const res = await findProducts(pageNum, pageSize)
            // 2.6.3. 返回结果
            ctx.body = {
                code: 0,
                message: '获取产品列表成功',
                result: res
            }
        } catch (err) {
            
        }
    }
}


/**
 * 3. EXPORT
 */
module.exports = new ProductController()