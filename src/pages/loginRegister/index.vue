<template>
  <div class="login">
    <div class="login-main">
      <div class="logo-con">
        <div class="img-con">
          <img class="logo-img" src="/static/images/logo.png" alt="">
        </div>
      </div>
      <div class="tab-con">
        <div class="tab-item" :class="{'tab-active': messageShow}">
          <span class="tab-item-con" @click.stop="handleMessageClick">
            短信登录
          </span>
        </div>
        <div class="tab-item" :class="{'tab-active': !messageShow}">
          <span class="tab-item-con" @click="handlePwdClick">
            密码登录
          </span>
        </div>
      </div>
      <div class="tab-main">
        <message-login v-show="messageShow"></message-login>
        <pwd-login v-show="!messageShow" @message="handleChangeMessage"></pwd-login>
      </div>
    </div>
  </div>
</template>

<script>
  import messageLogin from './messageLogin.vue'
  import pwdLogin from './pwdLogin.vue'
  export default {
    name: 'loginRegister',
    data () {
      return {
        messageShow: true
      }
    },
    components: {
      messageLogin,
      pwdLogin
    },
    methods: {
      handleMessageClick () {
        this.messageShow = true
      },
      handlePwdClick () {
        this.messageShow = false
      },
      handleChangeMessage () {
        this.messageShow = true
      }
    }
  }
</script>

<style scoped lang="stylus">
  .login
    display: flex
    flex-direction: column
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    padding: 0 .44rem
    background: linear-gradient(#ffc36b, #ff9944)
    .login-main
      padding-top: 1.1rem
      .logo-con
        height: 2.34rem
        padding: 0 2.13rem 1.3rem 2.13rem
        .img-con
          width: 2.35rem
          height: 0
          padding-bottom: 100%
          .logo-img
            width: 100%
      .tab-con
        display: flex
        padding-left: .72rem
        padding-right: 1.38rem
        justify-content: space-between
        .tab-item
          padding: 0 .08rem
          line-height: .56rem
        .tab-active
          background: url(../../../static/images/tab-bg.png) bottom no-repeat
</style>
