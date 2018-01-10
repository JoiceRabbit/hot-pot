<template>
  <div class="pwd-login">
    <div class="pwd-input-con">
      <input class="pwd-input" type="text" placeholder="手机号">
    </div>
    <div class="pwd-input-con">
      <input class="pwd-input" type="text" placeholder="密码">
    </div>
    <p class="notice">温馨提示：忘记密码请选择<span class="message-login" @click="handleMessageClick">短信登录</span></p>
    <div class="login-btn">登录</div>
  </div>
</template>

<script>
  export default {
    name: 'pwdLogin',
    methods: {
      handleMessageClick () {
        this.$emit('message')
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .pwd-input-con
    position: relative
    width: 100%
    padding-top: .35rem
    .pwd-input
      width: 100%
      line-height: .8rem
      font-size: .3rem
      text-indent: .2rem
      color: $lightFont
      background: $loginInputBg
  .notice
    padding-top: .35rem
    font-size: .12rem
    line-height: .34rem
    color: $lightFont
    .message-login
      color: $blueFont
      padding: 0 .1rem
  .login-btn
    margin-top: .35rem
    width: 100%
    line-height: .8rem
    text-align: center
    color: #fff
    background: #b0d5a2
</style>