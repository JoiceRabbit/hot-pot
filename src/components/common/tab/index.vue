<template>
  <footer class="footer">
    <router-link class="item" to="/" tag='div'>
      <div class="icon iconfont">&#xe608;</div>
      <div class="title">外卖</div>
    </router-link>
    <router-link class="item" to="/find/" tag='div'>
      <div class="icon iconfont">&#xe60f;</div>
      <div class="title">发现</div>
    </router-link>
    <router-link class="item" to="/order/" tag='div'>
      <div class="icon iconfont">&#xe601;</div>
      <div class="title">订单</div>
    </router-link>
    <router-link class="item" to="/mine/" tag='div'>
      <div class="icon iconfont">&#xe600;</div>
      <div class="title">我的</div>
    </router-link>
  </footer>
</template>

<script>
  export default {
    name: 'footer-common'
  }
</script>

<style scoped lang="stylus">
  @import '../../../assets/styles/common/varibles.styl'
  .footer
    display: flex
    justify-content: space-around
    align-items: center
    position: fixed
    bottom: 0
    width: 100%
    background: #fff
    height: 1.2rem
    .item
      flex: 1
      text-align: center      
      .icon
        font-size: .45rem
      .title
        line-height: .4rem
        font-size: .27rem
    .router-link-exact-active
      color: $bgColor
</style>