<template>
  <div class="index">
    <header class="header">
      <span class="position-icon iconfont">&#xe603;</span>
      <span class="position">{{position || "定位中..."}}</span>
    </header>
    <div class="search-con">
      <router-link class="search iconfont" to="/search/" tag="div">
        &#xe61d; 搜索商家、商品名称
      </router-link>
    </div>
    <swiper :sliders="sliders"></swiper>
    <special :special="special"></special>
    <div class="shopList-title">— 推荐商家 —</div>
    <shop-list :shopList="shopList"></shop-list>
    <footer-tab></footer-tab>
  </div>

</template>

<script>
  import axios from 'axios'
  import FooterTab from 'components/common/tab/'
  import Swiper from './swiper.vue'
  import Special from './special.vue'
  import ShopList from './shopList.vue'
  export default {
    name: 'index',
    data () {
      return {
        position: '',
        sliders: [],
        shopList: [],
        special: []
      }
    },
    components: {
      FooterTab,
      Swiper,
      ShopList,
      Special
    },
    created () {
      this.getIndexData()
    },
    methods: {
      getIndexData () {
        axios.get('/static/index.json')
           .then(this.handleGetDataSucc.bind(this))
           .catch(this.handleGetDataErr.bind(this))
      },
      handleGetDataSucc (res) {
        if (res.data && res.data.ret && res.data.data) {
          const data = res.data.data
          data.position && (this.position = data.position)
          data.sliders && (this.sliders = data.sliders)
          data.special && (this.special = data.special)
          data.shopList && (this.shopList = data.shopList)
        } else {
          this.handleGetDataErr()
        }
      },
      handleGetDataErr () {
        console.log('error')
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .header
    display: flex
    height: .69rem
    background: $bgColor
    padding: .2rem .28rem 0
    font-size: .28rem
    color: #fff
    .position
      margin: 0 .1rem
      max-width: 75%
      ellipsis()
  .search-con
    position: sticky
    top: 0
    padding: .14rem .28rem
    background: $bgColor
    z-index: 100
    .search
      line-height: .72rem
      background: #fff
      font-size: .28rem
      color: #999
      text-align: center
  .shopList-title
    margin-top: .2rem
    background: #fff
    text-align: center
    line-height: .72rem
    font-size: .4rem
    color: #000
</style>