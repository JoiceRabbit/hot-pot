<template>
  <div class="mine">
   <header class="mine-con">     
      <div class="mine">我的</div>
      <div class="push-set-con">
        <p class="header-r push iconfont">&#xe639;</p>
        <p class="header-r setting iconfont">&#xe606;</p>
      </div>
    </header>
    <div class="login-con">
      <div class="photo-con">
        <img :src="userImg" class="img" ref="userHeaderImg">
      </div>
      <div class="login-r" @click="handleGoLogin">
        <div class="login-cont">
          <p class="login" ref="userName">{{userName}}</p>
          <p class="login-desc" ref="userPhone">{{userTel}}</p>
        </div>
        <span class="login-link iconfont">&#xe65e;</span>
      </div>    
    </div>
    <div class="benefit border-bottom">
      <div class="wallet benefit-item">
        <p class="wallet-icon benefit-icon iconfont">&#xe61b;</p>
        <p class="benefit-title">钱包</p>
      </div>
      <div class="red-packet benefit-item">
        <p class="red-icon benefit-icon iconfont">&#xe613;</p>
        <p class="benefit-title">红包</p>
      </div>
      <div class="gold benefit-item">
        <p class="gold-icon benefit-icon iconfont">&#xe633;</p>
        <p class="benefit-title">金币</p>
      </div>
    </div>

    <div class="addr-coll block-con border-top">
      <div class="addr-con item-con border-bottom">
        <p class="addr-icon info-icon iconfont">&#xe603;</p>
        <p class="info-title">收货地址</p>
      </div>
      <div @click="handleGoChangePwd" 
           class="coll-con item-con border-bottom"
           v-if="loginStatus">
        <p class="coll-icon info-icon iconfont">&#xe678;</p>
        <p class="info-title">密码设置</p>
      </div>
    </div>
    <div class="gold-mall-con block-con border-top">
      <div class="gold-mall item-con border-bottom">
        <p class="gols-mall-icon info-icon iconfont">&#xe6d0;</p>
        <p class="info-title">金币商城</p>
      </div>
    </div>
    <div class="other-con block-con border-top">
      <div class="custom-service-con item-con border-bottom">
        <p class="custom-service-icon info-icon iconfont">&#xe673;</p>
        <p class="info-title">我的客服</p>
      </div>
      <div class="judge-con item-con border-bottom">
        <p class="judge-icon info-icon iconfont">&#xe62c;</p>
        <p class="info-title">欢迎评分</p>
      </div>
      <div class="coop-con item-con border-bottom">
        <p class="coop-icon info-icon iconfont">&#xe663;</p>
        <p class="info-title">加盟合作</p>
      </div>
    </div>
    <div class="logout-con" v-show="loginStatus">
      <div class="logout" @click="handleLogoutClick">退出登录</div>
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
    name: 'mine',
    data () {
      return {
        loginStatus: false,
        userId: '',
        userTel: '登录后享受更多特权',
        userImg: '/static/images/defaultPhoto.jpg',
        userName: '立即登录',
        errMessage: '',
        errMessageShow: false
      }
    },
    components: {
      FooterTab,
      ToolTip
    },
    methods: {
      handleGoLogin () {
        if (!this.loginStatus) {
          this.$router.push('/login')
        } else {
          this.showNotice('您已登录')
        }
      },
      getData () {
        axios.get('/api/mine/getUserInfo/?format=json')
             .then(this.getDataSucc.bind(this))
             .catch(this.getDataError.bind(this))
      },
      getDataSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              const { login, id, name, tel, headImg } = res.data.data
              login && (this.loginStatus = login)
              if (login) {
                id && (this.userId = id)
                name && (this.userName = name)
                tel && (this.userTel = tel)
                headImg && (this.userImg = headImg)
              }
            } else {
              this.showNotice('呀，数据迷路了~')
            }
          } else {
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器忍痛拒绝了您')
          }
        } else {
          this.showNotice('服务器没有正确返回哦^_^~')
        }
      },
      getDataError () {
        this.showNotice('服务器忍痛拒绝了您~')
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
      },
      handleLogoutClick () {
        const userLogout = confirm('确认退出登录吗？')
        if (userLogout) {
          axios.get('/api/user/logout/?format=json')
          .then(this.handleLogoutSucc.bind(this))
          .catch(this.handleLogoutErr.bind(this))
        }
      },

      handleLogoutSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              const logout = res.data.data.logout
              if (logout) {
                window.location.reload()
              } else {
                this.showNotice('登陆失败')
              }
            } else {
              this.showNotice('呀，数据迷路了~')
            }
          } else {
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器忍痛拒绝了您')
          }
        } else {
          this.showNotice('服务器没有正确返回哦^_^~')
        }
      },

      handleLogoutErr () {
        this.showNotice('服务器忍痛拒绝了您~')
      },

      handleGoChangePwd () {
        if (this.loginStatus) {
          this.$router.push('/change')
        }
      }
    },
    created () {
      this.getData()
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  @import '../../assets/styles/common/mixin.styl'
  .mine
    padding-bottom: 1.2rem
    .addr-coll,
    .gold-mall-con,
    .other-con
      margin-bottom: .3rem
    .block-con
      background: #fff
      font-size: .32rem
      color: #666
      border-color: #e0dcdc
      padding-left: .2rem
      .item-con
        border-color: #e0dcdc
        display: flex
        line-height: 1rem
        .info-icon
          margin-right: .4rem
    .benefit
      border-color: #e0dcdc
      margin-bottom: .3rem
      background: #fff
      display: flex
      padding-top: .6rem
      .benefit-item
        width: 33.33%
        text-align: center
        .benefit-icon
          font-size: .6rem
        .wallet-icon
          color: #008aff
        .red-icon
          background: linear-gradient(to right, #ff6a00, #ff3500)
          -webkit-background-clip: text
          color: transparent
        .gold-icon
          background: linear-gradient(to right, #ffc900, #ffa500)
          -webkit-background-clip: text
          color: transparent
        .benefit-title
          line-height: .52rem
          font-size: .24rem
          color: #666666
    .login-con
      background: $bgColor
      display: flex
      padding: .6rem .4rem
      color: #fff
      .login-r
        width: 100%
        display: flex
        justify-content: space-between
        .login-link
          font-size: .32rem
          line-height: 1.2rem
        .login
          font-size: .36rem
          line-height: .7rem
        .login-desc
          font-size: .26rem
          line-height: .4rem
      .photo-con
        width: 1.2rem
        height: 1.2rem
        margin-right: .5rem
        .img
          width: 100%
          border-radius: .6rem
    .mine-con
      height: .88rem
      background: $bgColor
      font-size: .36rem
      color: #fff  
      text-align: center
      line-height: .88rem
      font-weight: 700   
      .mine
        margin: 0 auto;
        width: 2rem      
        ellipsis()
      .push-set-con
        position: absolute
        top: 0
        right: 0
        padding: 0 .15rem
        line-height: .88rem
        display: flex
        .header-r
          font-size: .28rem
          padding: 0 .15rem
          line-height: .88rem
    .logout-con
      padding: .3rem
      .logout
        width: 100%
        height: 1rem
        line-height 1rem
        border-radius: .3rem
        font-size: .4rem
        color: #fff
        font-weight: bold
        text-align: center
        background: #ff4444
</style>
