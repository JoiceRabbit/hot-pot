<template>
  <div class="order" ref="orderShow">
    <header class="header">
      <div class="head-title">订单</div>
      <span class="lunch">午餐</span>
    </header>
    <bought :bought="data.bought" ref="bought"></bought>
    <orders :orderList="data.orderList"  ref="orders" class="orders"></orders>
    <footer-tab></footer-tab>   
  </div>
</template>

<script>
  import axios from 'axios'
  import Bought from './bought.vue'
  import Orders from './orders.vue'
  import FooterTab from 'components/common/tab/'
  export default {
    name: 'order',
    data () {
      return {
        data: {}
      }
    },
    components: {
      Bought,
      Orders,
      FooterTab
    },
    created () {
      this.getData()
    },
    watch: {
      data () {
        this.$nextTick(() => {
          this.$refs.bought.refreshPage()
          this.$refs.orders.refreshPage()
        })
      }
    },
    methods: {
      getData () {
        axios.get('/api/order.json')
             .then(this.handleGetDataSucc.bind(this))
             .catch(this.handleGetDataErr.bind(this))
      },
      handleGetDataSucc (res) {
        if (res && res.data && res.data.data) {
          this.data = res.data.data
        } else {
          this.handleGetDataErr()
        }
      },
      handleGetDataErr () {
        console.log('error')
      }
    },
    beforeRouteLeave (to, from, next) {
      this.$refs.orderShow.style.display = 'none'
      next()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .order
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    display: flex
    flex-direction: column
    .orders
      flex: 1
      overflow: hidden
    .header
      position: relative
      background: $bgColor
      color: #fff 
      .head-title
        font-size: .36rem     
        text-align: center
        line-height: .88rem
        font-weight: 700
        ellipsis()
      .lunch
        position: absolute
        right: .3rem
        top: 0
        font-size: .28rem
        line-height: .88rem
</style>