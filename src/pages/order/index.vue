<template>
  <div class="order">
    <header class="header">
      <div class="head-title">订单</div>
      <span class="lunch">午餐</span>
    </header>
    <transition enter-active-class="animated bounceInDown"
                leave-active-class="animated bounceOutDown">
      <router-link to="/login"
                   tag="div"
                   class="not-login"
                   v-if="notLogin">
        未登录
      </router-link>
    </transition>
    <div v-show="data.login" class="order-list-con">
      <bought :bought="data.bought" 
              ref="bought">
      </bought>
      <orders :orderList="data.orderList"  
              ref="orders" 
              class="orders">
      </orders>
    </div>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss">
    </tool-tip>
    <footer-tab></footer-tab> 
  </div>
</template>

<script>
  import axios from 'axios'
  import Bought from './bought.vue'
  import Orders from './orders.vue'
  import FooterTab from 'components/common/tab/'
  import ToolTip from 'components/ui/toolTip'
  export default {
    name: 'order',
    data () {
      return {
        data: {},
        errMessage: '',
        errMessageShow: false,
        notLogin: false
      }
    },
    components: {
      Bought,
      Orders,
      FooterTab,
      ToolTip
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
        axios.get('/api/order/?format=json')
             .then(this.handleGetDataSucc.bind(this))
             .catch(this.handleGetDataErr.bind(this))
      },
      handleGetDataSucc (res) {
        if (res && res.data) {
          if (res.data.data) {
            this.data = res.data.data
            if (!this.data.login) {
              setTimeout(() => {
                this.notLogin = true
              }, 0)
            }
          }
        } else {
          this.showNotice('您还没有订单哦~')
        }
      },
      handleGetDataErr () {
        this.showNotice('服务器忍痛拒绝了您~')
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
      }
    },
    created () {
      this.getData()
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
    bottom: 1.2rem
    left: 0
    display: flex
    flex-direction: column
    .not-login
      width: 3rem
      line-height: 1rem
      border-radius: .2rem
      background: $bgColor
      text-align: center
      margin: auto
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
    .order-list-con
      flex: 1
      display: flex
      flex-direction: column
      .orders
        flex: 1
        overflow: hidden
</style>