<template>
  <div class="message-login">
    <div class="message-input-con">
      <phone-input @codeShow="handleCodeShow"
                   ref="phone"></phone-input>
    </div>
    <div class="message-input-con">
      <code-input :codeShow="codeShow"
                  @send="handleSendCode"></code-input>
    </div>
    <p class="notice">温馨提示：未注册同城火锅帐号的手机号，登录时将自动注册，且代表您已同意<span>《用户服务协议》</span></p>
    <div class="login-btn">登录</div>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss"></tool-tip>
  </div>
</template>

<script>
  import ToolTip from 'components/ui/toolTip.vue'
  import PhoneInput from './phoneInput.vue'
  import CodeInput from './codeInput.vue'
  import axios from 'axios'
  export default {
    name: 'messageLogin',
    data () {
      return {
        phoneNum: '',
        codeShow: false,
        errMessage: '',
        errMessageShow: false
      }
    },
    components: {
      PhoneInput,
      CodeInput,
      ToolTip
    },
    methods: {
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      handleCodeShow (e) {
        this.codeShow = e.codeShow
      },
      handleSendCode () {
        if (this.$refs.phone.checkPhoneNum()) {
          axios.post('/api/user/getVerCode', {
            tel: this.phoneNum
          })
          .then(this.handleSendCodeSucc.bind(this))
          .catch(this.handleSendCodeErr.bind(this))
        } else {
          this.errMessage = '请输入正确手机号'
          this.errMessageShow = true
          this.codeShow = false
        }
      },
      handleSendCodeSucc (res) {
        console.log(res.data.ret)
      },
      handleSendCodeErr (err) {
        console.log(err)
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