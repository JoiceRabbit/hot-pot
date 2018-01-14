<template>
  <div class="shop">
    <div class="shop-top"></div>
  </div>
</template>

<script>
  export default {
    name: 'shop',
    props: {
      shopId: [String, Number]
    },
    watch: {
      shopId () {
        if (this.shopId) {
          console.log(1)
        }
      }
    }
  }
</script>

<style scoped lang="stylus">
  
</style>