<template>
  <div class="toolTip">{{errMessage}}</div>
</template>

<script>
  export default {
    name: 'toolTip',
    data () {
      return {
        timer: null
      }
    },
    props: {
      errMessage: String
    },
    watch: {
      errMessage () {
        clearTimeout(this.timer)
        this.timer = setTimeout(() => {
          this.$emit('miss')
        }, 3000)
      }
    }
  }
</script>

<style scoped lang="stylus">
  .toolTip
    position: absolute
    bottom: 1.8rem
    left: 50%
    width: 3.5rem
    margin-left: -1.7rem
    line-height: .4rem
    border-radius: .4rem
    text-align: center
    padding: .1rem
    font-size: .24rem
    color: #fff
    background: #666
</style>