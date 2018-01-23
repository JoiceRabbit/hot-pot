<template>
  <div class="cart">
    <div class="cart-car iconfont" :class="{'active': active}">
    &#xe746;<div class="cart-cout" v-show="count">{{count}}</div>
    </div>
    <div class="current-con">￥{{countPrice.toFixed(2)}}</div>
    <div class="count" 
         :class="{'count-active': active}"
         @click="handleCountClick">结算</div>
  </div>
</template>

<script>
  import bus from './bus'
  export default {
    name: 'shopCart',
    data () {
      return {
        active: false,
        lsit: [],
        countPrice: 0,
        count: 0
      }
    },
    methods: {
      handleCartChange (e) {
        this.count = 0
        this.list = e
        if (this.list.length) {
          this.active = true
        } else {
          this.active = false
        }
        this.countPrice = 0
        this.list.forEach((value) => {
          this.count += value.count
        })
        for (let i = 0; i < this.list.length; i++) {
          this.countPrice += this.list[i].price * this.list[i].count
        }
      },

      handleCountClick () {
        if (this.active) {
          this.$router.push('/corder')
        }
      }
    },
    created () {
      bus.$on('cart', this.handleCartChange)
    }
  }
</script>

<style scoped lang="stylus">
  .cart
    position: fixed
    width: 100%
    left: 0
    bottom: 0
    height: 1.34rem
    background: rgba(61,61,63,.9)
    .cart-car
      position: absolute
      left: .2rem
      top: -.15rem
      width: 1rem
      height: 1rem
      font-size: 1rem
      border-radius: .5rem
      background: #666
      .cart-cout
        position: absolute
        width: .3rem
        height: .3rem
        line-height: .3rem
        text-align: center
        top: 0
        right: 0
        color: #fff
        border-radius: .15rem
        font-size: .2rem
        background: #f00
    .active
      background: #3190e8
      color: #fff
    .current-con
      position: absolute
      left: 2.5rem
      top: .5rem
      font-size: .5rem
      color: #fff
    .count
      position: absolute
      right: 0
      top: 0
      width: 1.95rem
      height: 1.34rem
      line-height: 1.34rem
      text-align: center
      font-size: .5rem
      background: #666
      color: #fff
    .count-active
      background: #00cb00
</style>