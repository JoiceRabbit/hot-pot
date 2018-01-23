<template>
  <div class="create-order">
    <header class="head">
      <span class="back iconfont" @click="handleBack">&#xe624;</span>
      订单生成中。。。
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
    name: 'createOrder',
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
  .create-order
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    background: #fff
    .head
      position: relative
      text-align: center
      padding: .44rem
      color: #fff
      font-size: .35rem
      background: $bgColor
      .back
        position: absolute
        left: 5px
        top: 15px
        font-size: .4rem
        color: #fff
        font-weight: bold
        margin-right: .2rem
    .tip
      margin: 5rem auto 0
      width: 5rem
      height: .8rem
      background: $bgColor
      border-radius: .1rem
      text-align: center
      line-height: .8rem
</style>