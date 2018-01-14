import Vue from 'vue'
import Router from 'vue-router'
import Index from 'pages/home/index'
import Find from 'pages/find/index'
import Search from 'pages/search/index'
import Order from 'pages/order/index'
import Login from 'pages/loginRegister/index'
import Shop from 'pages/shop/index'

Vue.use(Router)

export default new Router({
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
      path: '/order',
      name: 'order',
      component: Order
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
    }
  ]
})
