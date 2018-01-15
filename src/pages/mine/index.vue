<template>
  <div class="mine">
    <div class="img-con" @click="handleMineClick">
      <img src="../../../static/images/mine.jpg" class="img">
    </div>
    <footer-tab></footer-tab>
  </div>
</template>

<script>
  import FooterTab from 'components/common/tab/'
  export default {
    name: 'mine',
    components: {
      FooterTab
    },
    methods: {
      handleMineClick () {
        this.$router.push('/login')
      }
    }
  }
</script>

<style scoped lang="stylus">
  .mine
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    .img-con
      width: 100%
      height: 100%
      .img
        width: 100%
</style>