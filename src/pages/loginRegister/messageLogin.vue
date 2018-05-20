<template>
  <div class="message-login">
    <div class="message-input-con">
      <phone-input @codeShow="handleCodeShow"
                   ref="phone"></phone-input>
    </div>
    <div class="message-input-con">
      <code-input :codeShow="codeShow"
                  :countDown="countDown"
                  @send="handleSendCode"
                  @login="handleLogin"
                  @stop="handleStop"
                  ref="code"></code-input>
    </div>
    <p class="notice">温馨提示：未注册同城火锅帐号的手机号，登录时将自动注册，且代表您已同意<span>《用户服务协议》</span></p>
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
  import CodeInput from './codeInput.vue'
  import axios from 'axios'
  export default {
    name: 'messageLogin',
    data () {
      return {
        phoneNum: '', //  手机号
        errMessage: '', //  错误或提示信息
        code: '', //  验证码
        codeShow: false, // 发送验证码是否展示
        errMessageShow: false, //  错误或提示是否展示
        sendCode: false, //  是否成功发送验证码
        login: false,  // 验证码正则验证
        loginShow: false, // 登录按钮是否显示
        checkNum: false, // 手机号正则验证
        countDown: false // 验证码倒计时是否开始
      }
    },
    components: {
      PhoneInput,
      CodeInput,
      ToolTip
    },
    watch: {
      codeShow () {
        this.showLoginBtn()
      }
    },
    methods: {
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      handleCodeShow (e) {
        this.codeShow = e.codeShow
        this.phoneNum = e.phoneNum
        this.checkNum = this.$refs.phone.checkPhoneNum()
      },
      handleSendCode () {
        if (!this.countDown) {
          if (this.$refs.phone.checkPhoneNum()) {
            axios.post('/api/user/getVerCode', {
              tel: this.phoneNum
            })
            .then(this.handleSendCodeSucc.bind(this))
            .catch(this.handleSendCodeErr.bind(this))
          } else {
            this.showNotice('请输入正确手机号')
            this.codeShow = false
          }
        } else {
          this.showNotice('暂时无法发送')
        }
      },
      showNotice (str) {
        this.errMessageShow = true
        this.errMessage = str
      },
      handleSendCodeSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              const data = res.data.data
              if (data.send) {
                this.sendCode = true
                this.showNotice('发送成功')
                this.countDown = true
              } else {
                this.sendCode = false
                this.showNotice('发送失败')
              }
            } else {
              this.sendCode = false
              this.showNotice('服务器处理出错')
            }
          } else {
            this.sendCode = false
            this.codeShow = false
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器错误，请检查您的手机号')
          }
        } else {
          this.showNotice('数据获取失败')
        }
      },
      handleSendCodeErr () {
        this.showNotice('服务器拒绝了您的请求')
      },
      handleLogin (e) {
        this.login = e.login
        this.code = e.code
        this.showLoginBtn()
      },
      handleLoginClick () {
        if (this.loginShow) {
          axios.post('/api/user/loginVerCode/?format=json', {
            tel: this.phoneNum,
            verCode: this.code
          })
          .then(this.handleLoginClickSucc.bind(this))
          .catch(this.handleLoginClickErr.bind(this))
        } else {
          this.showNotice('手机号或验证码格式不正确，验证码为6位数字')
        }
      },
      showLoginBtn () {
        if (this.login && this.sendCode && this.codeShow) {
          this.loginShow = true
        } else {
          this.loginShow = false
        }
      },
      handleLoginClickSucc (res) {
        if (res && res.data) {
          if (res.data.ret) {
            if (res.data.data) {
              const data = res.data.data
              if (data.login) {
                this.showNotice('登录成功')
                this.$router.go(-1)
              } else {
                this.showNotice('登录失败')
              }
            } else {
              this.showNotice('服务器处理出错了')
            }
          } else {
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器错误')
          }
        } else {
          this.showNotice('数据获取失败')
        }
      },
      handleLoginClickErr () {
        this.showNotice('服务器拒绝了您的请求')
      },
      handleStop () {
        this.countDown = false
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
  .login-active
    background: #4cd96f
</style>