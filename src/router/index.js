import Vue from 'vue'
import Router from 'vue-router'
import Index from 'pages/home/index'
import Find from 'pages/find/index'
import Search from 'pages/search/index'
import Order from 'pages/order/index'
import Mine from 'pages/mine/index'
import Login from 'pages/loginRegister/index'
import Shop from 'pages/shop/index'
import Change from 'pages/loginRegister/changePwd'
import CreateOrder from 'pages/createOrder/index'

Vue.use(Router)
let y = null
const router = new Router({
  routes: [
    {
      path: '/',
      name: 'index',
      component: Index
    }, {
      path: '/find',
      name: 'find',
      component: Find
    }, {
      path: '/search',
      name: 'search',
      component: Search
    }, {
      path: '/order',
      name: 'order',
      component: Order
    }, {
      path: '/mine',
      name: 'mine',
      component: Mine
    },
    {
      path: '/login',
      name: 'login',
      component: Login
    },
    {
      path: '/shop/:shopId',
      name: 'shop',
      component: Shop,
      props: true
    },
    {
      path: '/change/:tel',
      name: 'change',
      component: Change,
      props: true
    },
    {
      path: '/corder',
      name: 'corder',
      component: CreateOrder
    }
  ]
})
router.afterEach((to, from, next) => {
  if (from.name === 'index') {
    y = document.documentElement.scrollTop
  }

  if (to.name === 'index') {
    setTimeout(() => {
      document.documentElement.scrollTop = y
    }, 0)
  } else {
    document.documentElement.scrollTop = 0
  }
})
export default router
