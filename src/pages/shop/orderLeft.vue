<template>
  <div class="order-left">
    <div class="cate-name border-bottom"
         v-for="item in shopOrderInfo"
         :key="item.id">{{item.name}}</div>
  </div>
</template>

<script>
  export default {
    name: 'shopOrderLeft',
    props: {
      shopOrderInfo: Array
    }
  }
</script>

<style scoped lang="stylus">
  .order-left
    width: 1.52rem
    background: #f8f8f8
    .cate-name
      height: .85rem
      padding: .2rem .2rem
      line-height: .35rem
</style>