<template>
  <div class="eva-con">
    <div class="evaluate" ref="wrapper">
      <div class="evaluate-con">
        <div class="evaluate-item" v-for="item in list" :key="item.id">
          <div class="info">
            <div class="head-img-con">
              <img class="head-img" src="../../../static/images/defaultHead.jpg" alt="">
            </div>
            <div class="user-info">
              <div class="user-top">
                <span class="user-name">匿名用户</span>
                <span class="eva-date">{{item.time}}</span>
              </div>
              <div class="user-bto">
                <praise :num="item.praise"></praise>
                <span class="send">{{item.send}}分钟送达</span>
              </div>
            </div>
          </div>
          <div class="content-con">
            <div class="content">{{item.content}}</div>
            <div class="img-con">
              <div class="img-box">
                <img class="par-img" v-lazy="item.imgURL" alt="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <transition enter-active-class="animated bounceInDown">
      <div class="tip" v-if="show">
        暂无评价
      </div>
    </transition>
    </div>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss">
    </tool-tip>
    <div class="footer"></div>
  </div>
</template>

<script>
  import BScroll from 'better-scroll'
  import axios from 'axios'
  import ToolTip from 'components/ui/toolTip'
  import Praise from './praise'
  export default {
    name: 'shopEvalute',
    data () {
      return {
        errMessage: '',
        errMessageShow: false,
        show: false,
        list: []
      }
    },
    props: {
      shopId: [String, Number]
    },
    components: {
      ToolTip,
      Praise
    },
    watch: {
      list () {
        this.$nextTick(() => {
          this.scrollerPar.refresh()
        })
      }
    },
    methods: {
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
      },
      getEvaluateInfo () {
        axios.get('/api/shop/evaluate/?format=json', {
          params: {
            shopId: this.shopId
          }
        })
        .then(this.handleGetEvaluateSucc.bind(this))
        .catch(this.handleGetEvaluateErr.bind(this))
      },

      handleGetEvaluateSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              const data = res.data.data
              this.show = false
              this.list = data
              if (this.list.length === 0) {
                this.show = true
              }
            } else {
              this.show = true
              this.showNotice('数据获取失败')
            }
          } else {
            this.show = true
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器处理出错')
          }
        } else {
          this.show = true
          this.showNotice('数据获取失败')
        }
      },

      handleGetEvaluateErr () {
        this.showNotice('请求失败')
        this.show = true
      },

      createScroll () {
        this.scrollerPar = new BScroll(this.$refs.wrapper, {
          click: true
        })
      }
    },
    created () {
      this.getEvaluateInfo()
    },
    mounted () {
      this.createScroll()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .eva-con
    padding-bottom: 1.34rem
    .evaluate
      height: 6.2rem
      padding: .4rem
      padding-bottom: 0
      overflow: hidden
      .evaluate-con
        display: flex
        flex-direction: column
        .evaluate-item
          display: flex
          flex-direction: column
          margin-bottom: .2rem
          .info
            display: flex
            .head-img-con
              width: .6rem
              height: .6rem
              border-radius: .3rem
              .head-img
                width: 100%
            .user-info
              display: flex
              padding-left: .3rem
              flex-direction: column
              .user-top
                .user-name
                  line-height: .35rem
                  font-size: .35rem
                  font-weight: bold
                  color: #333
                .eva-date
                  line-height: .35rem
                  font-size: .25rem
                  color: #999
              .user-bto
                display: flex
                height: .3rem
                line-height: .3rem
                padding-right: .1rem
                .send
                  padding-left: .2rem
                  font-size: .25rem
                  color: #999
          .content-con
            padding-left: .6rem
            padding-bottom: .2rem
            .img-con
              display: flex
              flex-wrap: wrap
              padding-left: .2rem
              margin-top: .2rem
              .img-box
                width: 1.42rem
                height: 1.42rem
                margin-right: .2rem
                .par-img
                  width: 100%
            .content
              font-size: .2rem
              line-height: .35rem
              text-indent: .4rem
              padding-right: .2rem
              color: #666
      .tip
        margin: .5rem auto 0
        width: 5rem
        height: .8rem
        background: $bgColor
        border-radius: .1rem
        text-align: center
        line-height: .8rem
    .footer
      position: fixed
      bottom: 0
      left: 0
      width: 100%
      height: 1.34rem
      font-size: .4rem
      line-height: 1.34rem
      text-align: center
      color: #fff
      background: #666
</style>