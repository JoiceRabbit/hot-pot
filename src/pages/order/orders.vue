<template>
  <div class="orderList">
    <header class="header border-bottom">
      <i class="line"></i>私人订单
    </header>
    <div class="scroll" ref="scroll">
      <ul class="content">
        <li class="item"  v-for="item in orderList" :key="item.id">
          <div class="img-con">
              <img v-lazy="item.logo"  class="img">
          </div>
          <div class="info">
            <div class="name-con">
              <div class="name">{{item.name}}</div>
              <div class="status iconfont">{{item.status}}&#xe65e;</div>
            </div>
            <div class="time">{{item.time}}</div>
            <div class="total-con">
              <div class="total">{{item.total}}元</div>
              <div class="content">{{item.content}}</div>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div> 
</template>

<script>
  import BScroll from 'better-scroll'
  export default {
    name: 'orders',
    props: {
      orderList: Array
    },
    methods: {
      refreshPage () {
        this.scroller.refresh()
      }
    },
    mounted () {
      this.scroller = new BScroll(this.$refs.scroll, {
        click: true
      })
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .orderList
    display: flex
    flex-direction: column
    width: 100%
    .header
      display: flex
      padding-left: .2rem
      font-size: .3rem
      align-items: center
      height: .8rem
      background: #fff
      &::after
        border-color: #e0e0e0
      .line
        width: .06rem
        height: .3rem
        background: $bgColor
        margin-right: .14rem
    .scroll
      flex: 1
      overflow: hidden
      background: #fff
      .item
        display: flex
        padding: .2rem
        .info
          margin-left: .2rem
          display: flex
          flex-direction: column
          justify-content: space-around
          flex: 1
          .name-con,
          .total-con
            display: flex
            justify-content: space-between
            .name
              font-size: .3rem
            .status,
            .content
              font-size: .24rem
            .total
              font-size: .26rem
            .content
              width: 1.4rem
              line-height: .3rem
              text-align: center
              background: $bgColor
              color: #fff
        .img-con
          width: 1.6rem
          height: 1.6rem
          .img
            width: 100%
</style>
