<template>
  <div class="index">
    <header class="header">
      <div class="position iconfont position-icon">&#xe603; {{position || "定位中..."}}</div>
    </header>
    <div class="search-con" ref="seacher">
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
    mounted () {
      window.addEventListener('scroll', this.handleScroll)
    },
    destoryed () {
      window.removeEventListener('scroll', this.handleScroll)
    },
    methods: {
      getIndexData () {
        axios.get('/api/index/?format=json')
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
      },
      handleScroll () {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
        const offsetTop = this.$refs.seacher.offsetTop
        if (scrollTop > offsetTop) {
          this.$refs.seacher.style.position = 'fixed'
          this.$refs.seacher.style.top = 0
        } else {
          this.$refs.seacher.style.position = ''
        }
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
      padding: .01rem 0
      max-width: 75%
      ellipsis()
  .search-con
    padding: .14rem .28rem
    background: $bgColor
    z-index: 100
    width: 100%
    box-sizing: border-box
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