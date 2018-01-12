<template>
  <div class="shop">
    <div class="shop-top"></div>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'shop',
    props: {
      shopId: [String, Number]
    },
    watch: {
      shopId () {
        if (this.shopId) {
          console.log(1)
        }
      }
    },
    methods: {
      getShopInfo () {
        axios.get('/api/shop/index', {
          shopId: this.shopId
        })
        .then(this.handleGetShopInfoSucc.bind(this))
        .catch(this.handleGetShopInfoErr.bind(this))
      },
      handleGetShopInfoSucc (res) {
        if (res && res.data && res.data.data) {
          if (res.data.ret) {
            const data = res.data.data
            const shopInfo = data.shopInfo
            console.log(shopInfo)
          }
        } else {
          console.log('res Kong ')
        }
      },
      handleGetShopInfoErr () {
        console.log('error')
      }
    },
    created () {
      this.getShopInfo()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .shop-top
    height: 1.36rem
    background: $bgColor
</style>