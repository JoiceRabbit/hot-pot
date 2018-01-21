<template>
  <div class="order-left" ref="wrapper">
    <div>
      <div class="cate-name border-bottom"
           v-for="item in shopOrderInfo"
           :key="item.id"
           @click="handleCateClick">{{item.name}}</div>
    </div>
  </div>
</template>

<script>
  import BScroll from 'better-scroll'
  import bus from './bus'
  export default {
    name: 'shopOrderLeft',
    props: {
      shopOrderInfo: Array
    },
    watch: {
      shopOrderInfo () {
        this.$nextTick(() => {
          this.scroller.refresh()
        })
      }
    },
    methods: {
      createScroll () {
        this.scroller = new BScroll(this.$refs.wrapper, {
          click: true
        })
      },
      handleCateClick (e) {
        bus.$emit('cate', {
          el: e.target.innerText
        })
      }
    },
    mounted () {
      this.createScroll()
    }
  }
</script>

<style scoped lang="stylus">
  .order-left
    width: 1.52rem
    // height: 11.5rem
    overflow: hidden
    background: #f8f8f8
    .cate-name
      height: .85rem
      padding: .2rem .2rem
      line-height: .35rem
</style>