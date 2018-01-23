// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import FastClick from 'fastclick'
import router from './router'
import VueAwesomeSwiper from 'vue-awesome-swiper'
import VueLazyLoad from 'vue-lazyload'
import 'styles/base/reset.css'
import 'styles/base/border.css'
import 'styles/base/iconfont/iconfont.css'
import 'swiper/dist/css/swiper.css'
import 'styles/base/animate.css'
import 'styles/iconfont/iconfont.css'

Vue.config.productionTip = false
Vue.use(VueAwesomeSwiper)
Vue.use(VueLazyLoad, {
  preLoad: 1.3,
  error: '../static/images/imgErr.jpg',
  loading: '../static/images/loading.gif',
  attempt: 1
})
Vue.config.productionTip = false
FastClick.attach(document.body)

var bus = new Vue()

/* eslint-disable no-new */
new Vue({
  el: '#app',
  data () {
    return {
      bus
    }
  },
  router,
  template: '<App/>',
  components: { App }
})
