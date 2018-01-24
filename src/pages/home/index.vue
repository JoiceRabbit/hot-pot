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
    <div class="shopList-title" v-show="show">— 推荐商家 —</div>
    <shop-list :shopList="shopList"></shop-list>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss">
    </tool-tip>
    <footer-tab></footer-tab>
  </div>

</template>

<script>
  import axios from 'axios'
  import FooterTab from 'components/common/tab/'
  import Swiper from './swiper.vue'
  import Special from './special.vue'
  import ShopList from './shopList.vue'
  import ToolTip from 'components/ui/toolTip'
  export default {
    name: 'index',
    data () {
      return {
        position: '',
        sliders: [],
        shopList: [],
        special: [],
        seacherTop: 0,
        show: false,
        errMessage: '',
        errMessageShow: false
      }
    },
    components: {
      FooterTab,
      Swiper,
      ShopList,
      Special,
      ToolTip
    },
    created () {
      this.getIndexData()
    },
    mounted () {
      this.seacherTop = this.$refs.seacher.offsetTop
      window.addEventListener('scroll', this.handleScroll)
    },
    destoryed () {
      window.removeEventListener('scroll', this.handleScroll)
    },
    updated () {
      this.show = true
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
          this.showNotice('呀，数据迷路了~')
        }
      },
      handleGetDataErr () {
        this.showNotice('服务器忍痛拒绝了您~')
      },
      handleScroll () {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop
        if (scrollTop > this.seacherTop) {
          this.$refs.seacher.style.position = 'fixed'
          this.$refs.seacher.style.top = 0
        } else {
          this.$refs.seacher.style.position = ''
        }
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
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