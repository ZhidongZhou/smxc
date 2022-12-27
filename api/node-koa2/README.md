## Node-KoA2 for backend API

#### Folder & Files Structure 
- [main.js](./src/main.js): (服务器)入口文件
- [index.js](./src/app/index.js): 业务
- [router](./src/router/): 路由
- [controller](./src/controller/): 控制器
- [service](./src/service/): 数据库相关操作
- [db](./src/db/): 数据库连接
- [model](./src/model/): 数据库模型
- [middleware](./src/middleware/): 中间件 (e.g. [用户输入检测](./src/middleware/user.middleware.js))
- [constant](./src/constant/): 定义常量 (e.g. [错误类型定义](./src/constant/err.type.js))
- [koa-static](https://www.npmjs.com/package/koa-static): 静态文件

#### Extra Packages
- [nodemon](https://www.npmjs.com/package/nodemon): 自动开发过程中重启node
- [dotenv](https://www.npmjs.com/package/dotenv): 环境变量管理
- [koa-router](https://www.npmjs.com/package/koa-router): 路由中间件
- [koa-body](https://www.npmjs.com/package/koa-body): 解析用户请求参数
- [sequelize](https://www.npmjs.com/package/sequelize): Object Relationship Management (ORM) 关系型数据库，对象关系映射工具
- [mysql2](https://www.npmjs.com/package/mysql2): MySQL支持promise
- [bcrypt](https://www.npmjs.com/package/bcrypt): Salted Hash Password
- [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken): JWT 令牌
- [koa-parameter](https://www.npmjs.com/search?q=koa-parameter): 用于参数校验


#### Init Process
* Node Version: `nvm use v16.14.2`
* Init: `npm init -y`
* Install KOA: `npm i koa`
* Install Nodemon (Dev ONLY): `npm i nodemon -D`
* 在[package.json](./package.json) 中修改启动脚本
  * 通过nodemon启动测试环境: `npm run dev`
  * 通过nodemon启动服务环境: `npm run serve`
* Install dotenv: `npm i dotenv`
  * [.env管理环境变量](./.env)
  * [默认环境配置文件](./src/config/config.default.js)
* Install koa-router: `npm i koa-router`
* Install koa-body: `npm i koa-body`
* Install sequelize: `npm i sequelize`
* Install mysql2: `npm i mysql2`
* 启动mysql: `brew services restart mysql`
* 链接mysql: `mysql -u root` (有密码: `-p`)
* Install bcrypt.js: `npm i bcryptjs`
* Install jwt: `npm i jsonwebtoken`
* Install koa-static: `npm i koa-static`
* Install koa-parameter: `npm i koa-parameter`


#### 代码逻辑

```
model 数据库建模
router 路由(处理请求) -> controller 控制器(参数解构) -> service 服务层(操作数据库 CRUD)
```