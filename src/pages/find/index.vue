<template>
  <div>
    <header class="find-con">
      <p class="back iconfont">&#xe624;</p>
      <div class="find">发现</div>
    </header>
  </div>
</template>

<script>
  export default {
    name: 'find-index'
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .find-con
    position: relative
    height: .88rem
    background: $bgColor
    font-size: .37rem
    color: #fff
    text-align: center
    line-height: .88rem
    font-weight: 700
    ellipsis()
    .back
      position: absolute
      left: 0
      top: 0
      bottom: 0
      right: 0
      width:.88rem
      line-height: .88rem
</style>