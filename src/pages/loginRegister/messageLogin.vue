<template>
  <div class="message-login">
    <div class="message-input-con">
      <input class="message-input" v-model="phoneNum" type="text" placeholder="手机号" @input="handlePhoneNum">
    </div>
    <div class="message-input-con">
      <input class="message-input" type="text" placeholder="验证码">
      <div class="send-code" 
            :class="{'code-active': codeShow}"
            @click="handleSendCode">
          发送验证码</div>
    </div>
    <p class="notice">温馨提示：未注册同城火锅帐号的手机号，登录时将自动注册，且代表您已同意<span>《用户服务协议》</span></p>
    <div class="login-btn">登录</div>
  </div>
</template>

<script>
  export default {
    name: 'messageLogin',
    data () {
      return {
        phoneNum: '',
        codeShow: false
      }
    },
    methods: {
      handlePhoneNum (e) {
        this.phoneNum = e.target.value
        if (this.phoneNum.length >= 11) {
          this.phoneNum = this.phoneNum.slice(0, 11)
          this.codeShow = true
        } else {
          this.codeShow = false
        }
      },
      handleSendCode () {
        console.log(this.checkPhoneNum())
      },
      checkPhoneNum () {
        return /^1[3578]\d{9}$/.test(this.phoneNum)
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .message-input-con
    position: relative
    width: 100%
    padding-top: .35rem
    .message-input
      width: 100%
      line-height: .8rem
      font-size: .3rem
      text-indent: .2rem
      color: $lightFont
      background: $loginInputBg
    .send-code
      position: absolute
      top: .48rem
      right: .14rem
      width: 1.6rem
      height: .54rem
      line-height: .54rem
      text-align: center
      font-size: .26rem
      color: #fff
      background: #b0d5a2
    .code-active
      background: #4cd96f
  .notice
    padding-top: .35rem
    font-size: .12rem
    line-height: .34rem
    color: $lightFont
  .login-btn
    margin-top: .35rem
    width: 100%
    line-height: .8rem
    text-align: center
    color: #fff
    background: #b0d5a2
</style>