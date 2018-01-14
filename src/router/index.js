import Vue from 'vue'
import Router from 'vue-router'
import Index from 'pages/home/index'
import Find from 'pages/find/index'
import Search from 'pages/search/index'
import Order from 'pages/order/index'

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
    }
  ]
})
