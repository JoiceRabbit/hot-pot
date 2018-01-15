<template>
  <div class="shop" ref="shop">
    <div class="shop-top">
      <div class="iconfont back" @click="handleGoBack">&#xe624;</div>
      <div class="logo-con">
        <img :src="shopInfo.logo" alt="" class="logo-img">
      </div>
    </div>
    <shop-header :shopInfo="shopInfo"></shop-header>
    <div class="tab border-bottom">
      <div class="order tab-item-con">
        <div class="tab-item" 
             :class="{'tab-active': orderActive}"
             @click="handleOrderTabClick">点餐</div>
      </div>
      <div class="evalute tab-item-con">
        <div class="tab-item" 
             :class="{'tab-active': evaluteActive}"
             @click="handleEvaluteTabClick">评价</div>
      </div>
      <div class="intro tab-item-con">
        <div class="tab-item" 
             :class="{'tab-active': introActive}"
             @click="handleIntroTabClick">商家</div>
      </div>
    </div>
    <div class="tab-con">
      <component :is="componentActive"
                 :shopOrderInfo="shopOrderInfo"
                 :shopIntroInfo="shopIntroInfo"></component>
    </div>
    <div class="cart">
      <div class="cart-car"></div>
      <div class="current-con"></div>
      <div class="count">结算</div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios'
  import ShopHeader from './header.vue'
  import ShopOrder from './order.vue'
  import ShopEvalute from './evalute.vue'
  import ShopIntro from './intro.vue'
  export default {
    name: 'shop',
    props: {
      shopId: [String, Number]
    },
    data () {
      return {
        shopInfo: {},
        shopOrderInfo: [],
        shopIntroInfo: {},
        orderActive: true,
        evaluteActive: false,
        introActive: false,
        componentActive: 'ShopOrder'
      }
    },
    components: {
      ShopHeader,
      ShopOrder,
      ShopEvalute,
      ShopIntro
    },
    watch: {
      shopId () {
        if (this.shopId) {
          //
        }
      }
    },
    methods: {
      getShopInfo () {
        axios.get('/api/shop/index1.json', {
          shopId: this.shopId
        })
        .then(this.handleGetShopInfoSucc.bind(this))
        .catch(this.handleGetShopInfoErr.bind(this))
      },
      handleGetShopInfoSucc (res) {
        if (res && res.data && res.data.data) {
          if (res.data.ret) {
            const data = res.data.data
            this.shopInfo = data.shopInfo
            this.shopOrderInfo = this.shopInfo.order
            this.shopIntroInfo = this.shopInfo.intro
          }
        } else {
          //
        }
      },
      handleGetShopInfoErr () {
        //
      },
      handleOrderTabClick () {
        this.componentActive = 'ShopOrder'
        this.orderActive = true
        this.evaluteActive = false
        this.introActive = false
      },
      handleEvaluteTabClick () {
        this.componentActive = 'ShopEvalute'
        this.orderActive = false
        this.evaluteActive = true
        this.introActive = false
      },
      handleIntroTabClick () {
        this.componentActive = 'ShopIntro'
        this.orderActive = false
        this.evaluteActive = false
        this.introActive = true
      },
      handleGoBack () {
        this.$router.go(-1)
      }
    },
    created () {
      this.getShopInfo()
    },
    beforeRouteLeave (to, from, next) {
      this.$refs.shop.style.display = 'none'
      next()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .shop-top
    position: relative
    height: 1.36rem
    background: $bgColor
    .back
      position: absolute
      width: .5rem
      height: .5rem
      top: 10px
      left: 15px
      color: #fff
      font-size: .4rem
      font-weight: bolder
    .logo-con
      position: absolute
      // overflow: hidden
      width: 1.3rem
      height: 1.3rem
      // padding-bottom: 100%
      top: .5rem
      left: 50%
      transform: translateX(-50%)
      .logo-img
        width: 100%
  .tab
    position: sticky
    left: 0
    top: 0
    z-index: 2
    display: flex
    line-height: .72rem
    font-size: .26rem
    color: #333
    background: #fff
    .tab-item-con
      width: 33%
      padding: 0 .9rem
      padding-left: .75rem
      .tab-item
        width: .63rem
        height: .72rem
        text-align: center
      .tab-active
        background: url(../../../static/images/shop-tab-bg.png) bottom repeat-X
  .cart
    position: fixed
    width: 100%
    left: 0
    bottom: 0
    height: 1.34rem
    background: rgba(0, 0, 0, .5)
    .cart-car
      position: absolute
      left: 20px
      top: -15px
      width: 1rem
      height: 1rem
      border-radius: .5rem
      background: #666
    .count
      position: absolute
      right: 0
      top: 0
      width: 1.95rem
      height: 1.34rem
      line-height: 1.34rem
      text-align: center
      font-size: .5rem
      background: #00cb00
      color: #fff
</style>