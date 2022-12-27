/**
 * 1. IMPORT
 */

// 1.1.导入Product Model对象
const Product = require('../model/product.model')

/**
 * 2. 管理员请求数据库操作
 */

// 2.1. 操作数据库新增产品
class ProductService {
    /**
     * ADMIN 管理员请求操作
     */

    // 2.1. CREATE 新产品发布
    async createProduct(product) {
        // console.log('新产品添加到数据库成功')
        // 写入数据库, 并等待成功回复
        const res = await Product.create(product)
        return res.dataValues
        // 返回
    }

    // 2.2. 操作数据库更新产品
    async updateProduct(id, product) {
        // 通过 id 定位 指定产品
        const res = await Product.update(product, { where: { id } })
        // 更新成功至少一条 True; 否则更新失败 False
        return res[0] > 0 ? true : false
    }

    // 2.3. 操作数据库硬删除产品
    async removeProduct(id) {
        // 通过 id 定位 指定产品
        const res = await Product.destroy({ where: { id } })
        // 删除成功至少一条 True; 否则更新失败 False
        return res > 0 ? true : false
    }

    // 2.4. 操作数据库重新上架产品
    async restoreProduct(id) {
        // 通过 id 定位 指定产品
        const res = await Product.restore({ where: { id } })
        // 重新上架成功至少一条 True; 否则更新失败 False
        return res > 0 ? true : false
    }

    /**
     * USER 用户请求操作
     */

    // 2.5. READ 所有产品
    async findProducts(pageNum, pageSize) {
        // // 2.5.1. 获取产品总数
        // const count = await Product.count()
        // // 2.5.2. 获取分页数据

        // const rows = await Product.findAll({ offset: offset, limit: pageSize * 1 })

        // 2.5.1. & 2.5.2. 获取产品总数 & 获取分页数据
        const offset = (pageNum - 1) * pageSize // offset: 偏移量
        const { count, rows } = await Product.findAndCountAll({ offset: offset, limit: pageSize * 1 })
        // 2.5.3. 返回结果
        return {
            pageNum,
            pageSize,
            total: count,
            list: rows
        }
    }
}


/**
 * 3. EXPORT
 */

module.exports = new ProductService()