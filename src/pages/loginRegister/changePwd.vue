<template>
  <div class="change-pwd">
    <div class="pwd-input-con">
      <phone-input @codeShow="handleCodeShow"
                   ref="phone"></phone-input>
    </div>
    <div class="pwd-input-con">
      <pwd-input ref="password"
                 @password="handlePassword"></pwd-input>
    </div>
    <div class="pwd-input-con">
      <input type="text" placeholder="确认密码" class="pwd2-input">
    </div>
    <div class="pwd-input-con">
      <code-input :codeShow="codeShow"
                  :countDown="countDown"
                  @send="handleSendCode"
                  @login="handleLogin"
                  @stop="handleStop"
                  ref="code"></code-input>
    </div>
    <div class="login-btn" 
         @click="handleLoginClick"
         :class="{'login-active': loginShow}">确认</div>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss"></tool-tip>
  </div>
</template>

<script>
  import ToolTip from 'components/ui/toolTip.vue'
  import PhoneInput from './phoneInput'
  import PwdInput from './pwdInput.vue'
  import CodeInput from './codeInput.vue'
  export default {
    name: 'ChangePwd',
    components: {
      ToolTip,
      PhoneInput,
      PwdInput,
      CodeInput
    },
    methods: {
      handleCodeShow (e) {
        this.codeShow = e.codeShow
        this.checkNum = this.$refs.phone.checkPhoneNum()
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .change-pwd
    position: absolute
    top: 0
    right: 0
    bottom: 0
    left: 0
    background: $bgColor
    padding: 2.5rem .5rem 0 .5rem
    .pwd-input-con
      position: relative
      width: 100%
      padding-top: .35rem
      .pwd2-input
        width: 100%
        line-height: .8rem
        font-size: .3rem
        text-indent: .2rem
        color: $lightFont
        background: $loginInputBg
    .login-btn
      margin-top: .35rem
      width: 100%
      line-height: .8rem
      text-align: center
      color: #fff
      background: #b0d5a2
    .login-active
      background: #4cd96f
</style>