<template>
  <div>
    <header class="find-con">
      <p class="back iconfont">&#xe624;</p>
      <div class="find">发现</div>
    </header>
    <main class="content-con">
      {{errMsg}}
      <!-- <div class="content content-left borderright" v-for="item of list-left" :key="item.id">
        <div class="inner-left">
          <div class="con-title">{{item.title}}</div>
          <div class="con-desc">{{item.desc}}</div>
        </div>
        <div class="con-img">
          <img :src="item.imgUrl" class="iconImg">
        </div>
      </div> -->

      <!-- <div class="content" v-for="item of list-right" :key="item.id">
        <div class="inner-left">
          <div class="con-title">{{item.title}}</div>
          <div class="con-desc">{{item.desc}}</div>
        </div>
        <div class="con-img">
          <img :src="item.imgUrl" class="iconImg">
        </div>
      </div> -->
    </main>
  </div>
</template>

<script>
  import axios from 'axios'
  export default {
    name: 'find-index',
    data () {
      return {
        list: [],
        errMsg: ''
      }
    },
    created () {
      axios.get('/static/find.json')
           .then(this.handleGetListSucc.bind(this))
           .catch(this.handleGetListErr.bind(this))
    },
    methods: {
      handleGetListSucc (res) {
        if (res) {
          if (res.data) {
            if (res.data.ret && res.data.data) {
              res.data.data.forEach ((value, index) => {
                /*if (index % 3 === 0) {
                  this.list.list-left.push(value)
                } else {
                  this.list.list-right.push(value)
                }
                console.log(this.list)    查询vue数组操作方法*/
              })
            } else {
              this.handleGetListErr()
            }
          } else {
            this.handleGetListErr()
          }
        } else {
          this.handleGetListErr()
        }
      },
      handleGetListErr () {
        this.errMsg = '服务器开小差了T_T,请尝试刷新页面'
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .find-con
    position: relative
    height: .88rem
    background: $bgColor
    font-size: .37rem
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
  .content-con
      display: flex
      min-height: 4rem
      margin-bottom: .21rem
      font-size: .35rem
      line-height: 3rem
      // text-align: center
      background: red
      .content
        display: flex
        justify-content: space-between
        align-items: center
        width: 50%
        border-top: 1px solid #ededed
        padding: 0 .3rem
      .content-left
        border-color: #ededed
        .inner-left
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
          width: .9rem
          height: .9rem
          .iconImg
            width: 100%
</style>