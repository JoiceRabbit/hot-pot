// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import VueAwesomeSwiper from 'vue-awesome-swiper'
import VueLazyLoad from 'vue-lazyload'
import AMap from 'vue-amap'

import 'styles/base/reset.css'
import 'styles/base/border.css'
import 'styles/base/iconfont/iconfont.css'
import 'swiper/dist/css/swiper.css'
import 'styles/base/animate.css'

Vue.config.productionTip = false
Vue.use(VueAwesomeSwiper)
Vue.use(VueLazyLoad, {
  preLoad: 1.3,
  error: 'http://img1.imgtn.bdimg.com/it/u=2861676836,4281173853&fm=27&gp=0.jpg',
  loading: 'http://img.zcool.cn/community/0176af5844caf4a8012060c87e987f.gif',
  attempt: 1
})
Vue.use(AMap)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  template: '<App/>',
  components: { App }
})
