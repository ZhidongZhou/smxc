module.exports = {
    // Register
    emptyInputErr: {
        code: '10001',
        message: '用户名密码为空',
        result: ''
    },
    duplicateUserNameErr: {
        code: '10002',
        message: '用户名已存在',
        result: ''
    },
    registerErr: {
        code: '10003',
        message: '用户注册失败',
        result: ''
    },
    // Login
    userNotExistErr: {
        code: '10004',
        message: '用户名不存在',
        result: ''
    },
    loginErr: {
        code: '10005',
        message: '用户登陆失败',
        result: ''
    },
    pwdErr: {
        code: '10006',
        message: '密码不正确',
        result: ''
    }, 
    // token
    tokenExpiredErr: {
        code: '10101',
        message: '用户token已过期',
        result: ''
    },
    invalidTokenErr: {
        code: '10102',
        message: 'toke无效',
        result: ''
    },
    // 修改密码
    changePasswordErr: {
        code: '10007',
        message: '修改密码失败', 
        result: ''
    },
    // 管理员权限
    notAdminErr: {
        code: '10103',
        message: '没有管理员权限',
        result: ''
    },
    // 文件上传
    fileUploadErr: {
        code: '10201',
        message: '图片上传失败',
        result: ''
    },
    fileTypeErr: {
        code: '10202',
        message: '不支持图片格式',
        result: ''
    }, 
    // 产品发布
    productParmErr: {
        code: '10203',
        message: '新产品参数错误',
        result: ''
    }, 
    postProductErr: {
        code: '10204',
        message: '新产品发布失败',
        result: ''
    },
    // 产品更新
    upProductErr: {
        code: '10205',
        message: '产品更新失败',
        result: ''
    },
    productIdErr: {
        code: '10206',
        message: '产品id无效',
        result: ''
    },
}