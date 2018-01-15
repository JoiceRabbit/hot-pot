<template>
  <div class="order-right">
    <div class="cate-item" v-for="cate in shopOrderInfo" :key="cate.id">
      <div class="cate-name border-bottom">{{cate.name}}</div>
      <div class="item-con" v-for="item in cate.list" :key="item.id">
        <div class="img-con">
          <img :src="item.img" alt="" class="item-img">
        </div>
        <div class="item-detail">
          <div class="item-name">{{item.title}}</div>
          <div class="item-sold">月售<span>{{item.sold_num}}</span>单 好评率<span>{{item.fav}}</span>%</div>
          <div class="item-discount" v-if="cate.isDiscount"><span class="item-discount-con">5折优惠</span></div>
          <div class="item-price">
            <span class="current-price">￥{{item.price}}</span> <span class="old-price" v-if="cate.isDiscount">￥{{item.price * 2}}</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'shopOrderRight',
    props: {
      shopOrderInfo: Array
    }
  }
</script>

<style scoped lang="stylus">
  .order-right
    flex: 1
    .cate-name
      height: .45rem
      line-height: .45rem
      font-size: .26rem
      color: #323232
    .item-con
      display: flex
      padding: .2rem .2rem .2rem 0
      .img-con
        // overflow: hidden
        width: 1.52rem
        height: 1.52rem
        // padding-bottom: 30%
        .item-img
          width: 100%
      .item-detail
        padding-left: .2rem
        .item-name
          line-height: .54rem
          font-size: .4rem
          font-weight: bold
        .item-sold
          font-size: .24rem
          line-height: .3rem
        .item-discount
          .item-discount-con
            font-size: .26rem
            line-height: .34rem
            background: #ff3c15
            color: #fff
        .item-price
          font-size: .24rem
          .current-price
            font-size: .34rem
            font-weight: bold
            color: #ff3c15
          .old-price
            font-size: .3rem
            text-decoration: line-through
</style>