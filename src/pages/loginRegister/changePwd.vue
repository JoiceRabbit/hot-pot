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
      <input @input="handleCheckPwd2" type="password" placeholder="确认密码" class="pwd2-input">
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
  import axios from 'axios'
  export default {
    name: 'ChangePwd',
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
        countDown: false, // 验证码倒计时是否开始
        password: '',
        checkPwd: false,
        checkPwd2: false // 验证二次输入的密码
      }
    },
    components: {
      ToolTip,
      PhoneInput,
      PwdInput,
      CodeInput
    },
    methods: {
      handleCheckPwd2 (e) {
        if (e.target.value === this.password) {
          this.checkPwd2 = true
        } else {
          this.checkPwd2 = false
        }
        this.showLoginBtn()
      },
      handlePassword (e) {
        this.password = e.password
        this.checkPwd = e.check
        this.showLoginBtn()
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      handleCodeShow (e) {
        this.codeShow = e.codeShow
        this.checkNum = this.$refs.phone.checkPhoneNum()
        this.showLoginBtn()
      },
      handleSendCode () {
        if (!this.countDown) {
          if (this.$refs.phone.checkPhoneNum()) {
            axios.post('/api/user/getVerCode/?format=json', {
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
        this.showNotice('系统异常')
      },
      handleLogin (e) {
        this.login = e.login
        this.code = e.code
        this.showLoginBtn()
      },
      handleLoginClick () {
        if (this.loginShow) {
          axios.post('/api/user/setPassword/?format=json', {
            tel: this.phoneNum,
            verCode: this.code,
            password: this.password
          })
          .then(this.handleLoginClickSucc.bind(this))
          .catch(this.handleLoginClickErr.bind(this))
        } else if (!this.codeShow) {
          this.showNotice('检查您的手机号是否正确')
        } else if (!this.sendCode) {
          this.showNotice('未成功发送验证码')
        } else if (!this.login) {
          this.showNotice('验证码为6位数字')
        } else if (!this.checkPwd2) {
          this.showNotice('两次密码输入不一致')
        } else if (!this.checkPwd) {
          this.showNotice('密码只能输入6-20个字母、数字、下划线')
        }
      },
      showLoginBtn () {
        if (this.login && this.sendCode && this.codeShow && this.checkPwd2 && this.checkPwd) {
          this.loginShow = true
        } else {
          this.loginShow = false
        }
      },
      handleLoginClickSucc (res) {
        if (res && res.data) {
          const data = res.data
          if (data.ret) {
            this.showNotice('修改成功')
            this.$router.go(-1)
          } else {
            this.showNotice(data.errMsg ? data.errMsg : '服务器处理出错')
          }
        } else {
          this.showNotice('数据获取失败')
        }
      },
      handleLoginClickErr () {
        this.showNotice('系统异常')
      },
      handleStop () {
        this.countDown = false
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