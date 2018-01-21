<template>
  <div class="search">
    <header class="head">
      <span class="back iconfont" @click="handleBack">&#xe624;</span>
      <div class="input-con border">
        <span class="input-icon iconfont">&#xe61d;</span>输入商家、商品名称
      </div>
      <span class="searchBtn">搜索</span> 
    </header>
    <transition enter-active-class="animated bounceInDown">
      <div class="tip" v-if="show">
        工程师在快马加鞭哦^_^
      </div>
    </transition>
  </div>
</template>

<script>
  export default {
    name: 'search',
    data () {
      return {
        show: false
      }
    },
    methods: {
      handleBack () {
        this.$router.go(-1)
      }
    },
    created () {
      setTimeout(() => {
        this.show = true
      }, 0)
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .search
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    background: #fff
    .head
      display: flex
      align-items: center
      justify-content: space-between
      padding: .44rem
      .back
        font-size: .4rem
        color: #666
        margin-right: .2rem
      .searchBtn
        font-size: .36rem
        color: #000
        margin-left: .2rem
      .input-con
        flex: 1
        font-size: .32rem
        color: #bbb
        &::after,
        &::before
          border-color: #eee
        .input-icon
          font-size: .38rem
          margin-right: .1rem
    .tip
      margin: 5rem auto 0
      width: 5rem
      height: .8rem
      background: $bgColor
      border-radius: .1rem
      text-align: center
      line-height: .8rem
</style>