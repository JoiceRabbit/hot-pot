<template>
  <div class="find">
    <header class="find-con">
      <p class="back iconfont">&#xe624;</p>
      <div class="find">发现</div>
    </header>
    <main class="content-con">
      <div class="content content-left border-right">
        <div class="item" v-for="item in lists[0]" :key="item.id">
          <div class="item-left">
            <div class="con-title">{{item.title}}</div>
            <div class="con-desc">{{item.desc}}</div>
          </div>
          <div class="con-img">
            <img :src="item.imgUrl" class="iconImg">
          </div>
        </div>
      </div>

      <div class="content">
        <div class="item" v-for="item in lists[1]" :key="item.id">
          <div class="item-left">
            <div class="con-title">{{item.title}}</div>
            <div class="con-desc">{{item.desc}}</div>
          </div>
          <div class="con-img">
            <img :src="item.imgUrl" class="iconImg">
          </div>
        </div>
      </div>
    </main>
    <div class="imgs-con">
      <div class="img-item" v-for="imgItem in imgs" :key="imgItem.id">
        <img :src="imgItem.imgUrl" class="img">
      </div>       
    </div>
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
  import ToolTip from 'components/ui/toolTip'
  export default {
    name: 'find-index',
    data () {
      return {
        lists: [],
        imgs: [],
        errMessage: '',
        errMessageShow: false
      }
    },
    components: {
      FooterTab
    },
    created () {
      axios.get('/api/find/?format=json')
           .then(this.handleGetListSucc.bind(this))
           .catch(this.handleGetListErr.bind(this))
    },
    methods: {
      handleGetListSucc (res) {
        if (res.data && res.data.ret && res.data.data) {
          res.data.imgs && (this.imgs = res.data.imgs)
          res.data.data.forEach((value, index) => {
            let list = Math.floor(index / 3)
            if (!this.lists[list]) {
              this.lists[list] = []
            }
            this.lists[list].push(value)
          })
          this.lists = Object.assign({}, this.lists)
        } else {
          this.showNotice('呀，数据迷路啦^_^')
        }
      },
      handleGetListErr () {
        this.showNotice('服务器开小差了T_T')
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
  .find
    display: flex
    flex-direction: column
    justify-content: space-between
    padding-bottom: .6rem
    .find-con
      height: .88rem
      background: $bgColor
      font-size: .36rem
      color: #fff  
      text-align: center
      line-height: .88rem
      font-weight: 700
      .back
        position: absolute
        left: 0
        top: 0
        bottom: 0
        right: 0
        width:.88rem     
      .find
        margin: 0 auto;
        width: 2rem      
        ellipsis()
    .imgs-con
        margin-top: .2rem
        background: #fff
        display: flex
        flex-direction: column
        .img-item
          margin-bottom: .15rem
          width: 100%
          height: 0
          padding-bottom: 22.8%
          overflow: hidden
          .img
            width: 100%
    .content-con
      flex: 1
      display: flex
      background: #fff
      min-height: 4rem
      margin-bottom: .21rem
      font-size: .35rem
      line-height: 3rem
      text-align: center
      .content-left
        border-color: #ededed
      .content
        display: flex
        flex-direction: column       
        width: 50%     
        .item
          display: flex
          justify-content: space-between
          align-items: center
          border-top: 1px solid #ededed
          padding: 0 .3rem
          height: 1.59rem
          text-align: left
          .item-left
            max-width: 2.25rem
            .con-title
              margin-bottom: .12rem
              line-height: 1.2
              font-size: .42rem
              color: #ff9300
              ellipsis()
            .con-desc
              line-height: 1.2
              font-size: .32rem
              color: #999
              ellipsis()
          .con-img
            display: flex
            width: .9rem
            height: .9rem
            .iconImg
              width: 100%
</style>