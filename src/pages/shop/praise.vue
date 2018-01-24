<template>
  <div class="praise">
    <i class="iconfont" :class="{'active': par[0]}">&#xe67c;</i>
    <i class="iconfont" :class="{'active': par[1]}">&#xe67c;</i>
    <i class="iconfont" :class="{'active': par[2]}">&#xe67c;</i>
    <i class="iconfont" :class="{'active': par[3]}">&#xe67c;</i>
    <i class="iconfont" :class="{'active': par[4]}">&#xe67c;</i>
  </div>
</template>

<script>
  export default {
    name: 'Praise',
    props: {
      num: [String, Number]
    },
    data () {
      return {
        par: [false, false, false, false, false]
      }
    },
    created () {
      for (let i = 0; i < this.num; i++) {
        this.par[i] = true
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .praise
    font-size: .25rem
    color: #999
    .active
      color: $bgColor
</style>