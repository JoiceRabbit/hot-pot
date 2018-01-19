<template>
  <div class="bought">
    <header class="header border-bottom">
      <i class="line"></i>附近买过
    </header>
    <div class="scroll" ref="scroll">
      <ul class="content">
        <li class="item"  v-for="item in bought" :key="item.id">
          <div class="img-con">
              <img v-lazy="item.imgUrl"  class="img">
          </div>
          <div class="title">{{item.title}}</div>
        </li>
      </ul>
    </div>
  </div> 
</template>

<script>
  import BScroll from 'better-scroll'
  export default {
    name: 'bought',
    props: {
      bought: Array
    },
    methods: {
      refreshPage () {
        this.scroller.refresh()
      }
    },
    mounted () {
      this.scroller = new BScroll(this.$refs.scroll, {
        scrollX: true,
        scrollY: false,
        click: true
      })
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
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
    width: 100%
    height: 2.5rem
    margin-bottom: .2rem
    overflow: hidden
    float: left
    background: #fff
    .content
      float: left
      font-size: 0
      white-space: nowrap
      .item
        display: inline-block
        padding: .2rem
        .title
          font-size: .24rem
          color: #666
          line-height: .44rem
          text-align: center
          ellipsis()
        .img-con
          width: 1.6rem
          height: 1.6rem
          .img
            width: 100%
            border-radius: 50%
</style>
