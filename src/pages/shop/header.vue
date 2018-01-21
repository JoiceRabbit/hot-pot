<template>
  <div class="header">
    <div class="header-con">
      <div class="name">{{shopInfo.name}}</div>
      <div class="intro">
        好评率{{shopInfo.favComments}}% 月售{{shopInfo.orders}}单 商家配送 约{{shopInfo.sendTime}}分钟 距离{{shopInfo.distance}}m
      </div>
      <div class="notice border">
        <span class="first-order">首单</span> 新用户下单立减12元（不与其他活动同享）
      </div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'shopHeader',
    props: {
      shopInfo: Object
    }
  }
</script>

<style scoped lang="stylus">
  .header
    position: relative
    height: 2.1rem
    padding: .8rem .3rem 0 .3rem
    .name
      line-height: .7rem
      font-size: .45rem
      text-align: center
      font-weight: bolder
      .right-arrow
        position: relative
        width: .3rem
        line-height: .7rem
        padding: 0 .2rem
        &::after
          content: "";
          border-style: solid;
          border-width: .146667rem 0 .146667rem .173333rem;
          border-width: 1.466667vw 0 1.466667vw 1.733333vw;
          border-color: transparent transparent transparent rgba(0,0,0,.67);
          position: absolute;
          right: -.1rem;
          top: .15rem;
    .intro
      text-align: center
      font-size: .24rem
    .notice
      overflow: hidden
      padding: .1rem
      text-align: center
      white-space: nowrap
      text-overflow: ellipsis
      color: #707070
      .first-order
        display: inline-block
        border-radius: .1rem
        padding: 0.05rem .1rem
        background: #76b656
        color: #fff
</style>