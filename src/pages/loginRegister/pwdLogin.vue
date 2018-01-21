<template>
  <div class="pwd-login">
    <div class="pwd-input-con">
      <phone-input @codeShow="handleCodeShow"
                   ref="phone"></phone-input>
    </div>
    <div class="pwd-input-con">
      <pwd-input ref="password"
                 @password="handlePassword"></pwd-input>
    </div>
    <p class="notice">温馨提示：忘记密码请选择<span class="message-login" @click="handleMessageClick">短信登录</span></p>
    <div class="login-btn" 
         @click="handleLoginClick"
         :class="{'login-active': loginShow}">登录</div>
    <tool-tip :errMessage="errMessage"
              v-show="errMessageShow"
              @miss="handleErrMiss"></tool-tip>
  </div>
</template>

<script>
  import ToolTip from 'components/ui/toolTip.vue'
  import PhoneInput from './phoneInput.vue'
  import PwdInput from './pwdInput.vue'
  import axios from 'axios'
  export default {
    name: 'pwdLogin',
    data () {
      return {
        phoneNum: '', //  手机号
        errMessage: '', //  错误或提示信息
        password: '', // 密码
        errMessageShow: false, //  错误或提示是否展示
        loginShow: false, // 登录按钮是否显示
        checkNum: false, // 手机号正则验证
        checkPwd: false  // 密码正则验证
      }
    },
    components: {
      PhoneInput,
      PwdInput,
      ToolTip
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
      handleMessageClick () {
        this.$emit('message')
      },
      handlePassword (e) {
        this.password = e.password
        this.checkPwd = e.check
        this.showLogin()
      },
      handleCodeShow (e) {
        this.phoneNum = e.phoneNum
        this.checkNum = e.check
        this.showLogin()
      },
      showLogin () {
        if (this.checkNum && this.checkPwd) {
          this.loginShow = true
        } else {
          this.loginShow = false
        }
      },
      handleLoginClick () {
        if (this.loginShow) {
          axios.post('/api/user/loginPwd/?format=json', {
            tel: this.phoneNum,
            pwd: this.password
          })
          .then(this.handleLoginSucc.bind(this))
          .catch(this.handleLoginErr.bind(this))
        }
      },
      handleLoginSucc (res) {
        if (res && res.data && res.data.data) {
          const data = res.data.data
          if (data.login) {
            this.showNotice(data.tel + '登录成功')
            this.$router.go(-1)
          } else {
            this.showNotice('登陆失败')
          }
        } else {
          this.showNotice('数据获取失败')
        }
      },
      handleLoginErr () {
        this.showNotice('系统异常')
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
  .login-active
    background: #4cd96f
</style>