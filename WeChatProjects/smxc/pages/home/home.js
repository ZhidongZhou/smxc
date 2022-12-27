// pages/home/home.js
Page({

  /**
   * Page initial data
   */
  data: {
    // homepage swiper
    background: [
      '/assets/images/swiper/swiper_1.png', 
      '/assets/images/swiper/swiper_2.png', 
      '/assets/images/swiper/swiper_3.png'
    ],
    indicatorDots: true,
    vertical: false,
    autoplay: true,
    interval: 2000,
    duration: 500,
    productData: [] // Todo: 请求接口的域名需要在: 微信小程序 -> 配置服务器信息. 中修改
  },

  /**
   * Lifecycle function--Called when page load
   */
  onLoad(options) {
    // 主页面加载时调用获取产品列表数据的函数
    this.getProductData();
  },
  
  /**
   * 产品列表数据请求函数
   */
  getProductData:function(){
    let self = this // 解决 setData 的 this 指向性问题
    wx.request({
      url: 'http://127.0.0.1:3006/products?pageNum=1&pageSize=10',
      data: {
        pageNum: 1,
        pageSize: 10,
      },
      header: {
        'content-type': 'application/json' // 默认值
      },
      success(res) {
        console.log("total products: ",res.data.result.list.length)
        let productList = res.data
        // 判断获取成功， 赋值给 Data -> productData
        if(productList.code == 0 && productList.result.list.length>0) {
          // 注意 this 指向性问题 需要 let self = this
          self.setData({
            productData: productList.result.list
          })
        }
      }
    })
  },

  /**
   * Lifecycle function--Called when page is initially rendered
   */
  onReady() {

  },

  /**
   * Lifecycle function--Called when page show
   */
  onShow() {

  },

  /**
   * Lifecycle function--Called when page hide
   */
  onHide() {

  },

  /**
   * Lifecycle function--Called when page unload
   */
  onUnload() {

  },

  /**
   * Page event handler function--Called when user drop down
   */
  onPullDownRefresh() {

  },

  /**
   * Called when page reach bottom
   */
  onReachBottom() {

  },

  /**
   * Called when user click on the top right corner to share
   */
  onShareAppMessage() {

  }
})