<template>
  <div class="order">
    <order-left :shopOrderInfo="shopOrderInfo"></order-left>
    <order-right :shopOrderInfo="shopOrderInfo" :ch="ch"></order-right>
  </div>
</template>

<script>
  import OrderLeft from './orderLeft.vue'
  import OrderRight from './orderRight.vue'
  export default {
    name: 'shopOrder',
    props: {
      shopOrderInfo: Array,
      ch: String
    },
    components: {
      OrderLeft,
      OrderRight
    }
  }
</script>

<style scoped lang="stylus">
  .order
    display: flex
    padding-bottom: 2rem
</style>