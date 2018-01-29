<template>
  <div class="search">
    <header class="head">
      <span class="back iconfont" @click="handleBack">&#xe624;</span>
      <div class="input-con">
        <span class="input-icon iconfont">&#xe61d;</span>
        <input type="text"
               class="input-cont"
               placeholder="输入商家、商品名称"
               @input="handleSearch">
      </div>
      <span class="searchBtn">搜索</span> 
    </header>
    <div class="hot-con">
      <div class="hot-title">热门搜索</div>
      <div class="hot-list">
        <div class="hot-list-item" v-for="item in hotList">{{item}}</div>
      </div>
    </div>
    <search-result :inpValue="inpValue"
                   v-show="inpValue.length ? true : false"
                   :showNotice="showNotice">
    </search-result>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss"></tool-tip>
  </div>
</template>

<script>
  import SearchResult from './searchResult.vue'
  import axios from 'axios'
  import ToolTip from 'components/ui/toolTip.vue'
  export default {
    name: 'search',
    data () {
      return {
        hotList: [],
        errMessage: '',
        errMessageShow: false,
        inpValue: ''
      }
    },
    components: {
      ToolTip,
      SearchResult
    },
    methods: {
      handleSearch (e) {
        this.inpValue = e.target.value
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
      },
      handleBack () {
        this.$router.go(-1)
      },
      getHotListData () {
        axios.get('/api/search/hot/?format=json')
             .then(this.getHotListDataSucc.bind(this))
             .catch(this.getHotListDataError.bind(this))
      },
      getHotListDataSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              this.hotList = res.data.data.hotSearch
            } else {
              this.showNotice('呀，数据迷路了')
            }
          } else {
            this.showNotice('服务器未正确返回')
          }
        } else {
          this.showNotice('服务器忍痛拒绝您~')
        }
      },
      getHotListDataError () {
        this.showNotice('请求发送失败')
      }
    },
    created () {
      this.getHotListData()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .search
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    background: #fff
    .hot-con
      padding: 0 .2rem
      .hot-list
        display: flex
        .hot-list-item
          font-size: .3rem
          color: #666
          line-height: .5rem
          background: #f8f8f8
          padding: 0 .2rem
          margin: 0 .15rem
          border-radius: .05rem
      .hot-title
        padding: .2rem 0
        color: #666
        font-size: .36rem
        font-weight: 700
    .head
      display: flex
      align-items: center
      justify-content: space-between
      padding: .44rem
      .back
        font-size: .4rem
        color: #666
        margin-right: .2rem
      .searchBtn
        font-size: .36rem
        color: #000
        margin-left: .2rem
      .input-con
        flex: 1
        font-size: .32rem
        color: #666
        background: #f8f8f8
        padding-left: .1rem
        display: flex
        .input-icon
          padding-top: .05rem
          font-size: .4rem
          margin-right: .1rem
        .input-cont
          color: #666
          background: #f8f8f8
          flex: 1
          padding: 0 .1rem 
    .tip
      margin: 5rem auto 0
      width: 5rem
      height: .8rem
      background: $bgColor
      border-radius: .1rem
      text-align: center
      line-height: .8rem
</style>