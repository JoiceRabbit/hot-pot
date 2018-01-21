<template>
  <section class="shopList-con">
    <div class="shops-con">
      <div class="shop-con border-bottom" 
           v-for="(shop, index) in shopList" 
           :key="shop.id" >
        <router-link :to="'/shop/' + shop.shopId " tag="div">
          <div class="shop">
            <div class="logo">
              <img v-lazy="shop.logo" class="logoImg">
            </div>
            <div class="shop-info">
              <div class="name">{{shop.name}}</div>
              <div class="sell-con">
                <span class="favComments">好评 {{shop.favComments}}%</span>
                <span class="sell">月售{{shop.orders}}单</span>
              </div>
              <div class="delivery">
                <div class="delivery-l">
                  <span class="startAmount">&yen;{{shop.startAmount}}起送</span>
                  |
                  <span class="trans">配送费&yen;{{shop.trans}}</span>
                </div>
                <div class="delivery-r">
                  <span class="distance">{{shop.distance}}km</span>
                  |
                  <span class="sendTime">{{shop.sendTime}}分钟</span>
                </div>
              </div>
            </div>
          </div>
        </router-link>
        <discount :discounts="shop.discount" :praise="shop.praise"></discount>
      </div>
    </div>
  </section>
</template>

<script>
  import Discount from './discounts.vue'
  export default {
    name: 'shopList',
    components: {
      Discount
    },
    props: {
      shopList: Array
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .shopList-con
    background: #fff
    padding-bottom: .6rem
    .shop-con
      padding: .6rem .4rem
      &::after
        border-color: #eee
      .shop
        display: flex
        line-height: 1.4
        .logo
          width: 1.3rem
          height: 1.3rem
          margin-right: .4rem
          .logoImg
            width: 100%
        .shop-info
          flex: 1
          font-size: .28rem
          .name
            font-size: .4rem
            font-weight: 700
            ellipsis()
          .delivery
            display: flex
            justify-content: space-between
</style>