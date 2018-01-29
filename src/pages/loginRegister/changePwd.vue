<template>
  <div class="change-pwd">
    <div class="pwd-input-con">
      <input type="text" :value="'手机号 : ' + tel" disabled class="default-input">
    </div>
    <div class="pwd-input-con">
      <pwd-input ref="password"
                 @password="handlePassword"
                 @check="handleCheckPwd"></pwd-input>
    </div>
    <div class="pwd-input-con">
      <input @input="handleCheckPwd2" 
             @blur="handlePwd2Blur"
             type="password" placeholder="确认密码" class="pwd2-input">
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
  import PwdInput from './pwdInput.vue'
  import CodeInput from './codeInput.vue'
  import axios from 'axios'
  export default {
    name: 'ChangePwd',
    props: {
      tel: String
    },
    data () {
      return {
        errMessage: '', //  错误或提示信息
        code: '', //  验证码
        password: '', // 密码
        password2: '', // 二次输入的密码
        codeShow: true, // 发送验证码是否展示
        errMessageShow: false, //  错误或提示是否展示
        sendCode: false, //  是否成功发送验证码
        login: false,  // 验证码正则验证
        loginShow: false, // 登录按钮是否显示
        countDown: false, // 验证码倒计时是否开始
        checkPwd: false, // 验证第一次输入的密码
        checkPwd2: false // 验证二次输入的密码
      }
    },
    components: {
      ToolTip,
      PwdInput,
      CodeInput
    },
    methods: {
      handleCheckPwd (e) {
        if (!e.check) {
          this.showNotice('密码只能输入6-20个字母、数字、下划线')
        }
      },
      handleCheckPwd2 (e) {
        this.password2 = e.target.value
        if (this.password2 === this.password) {
          this.checkPwd2 = true
        } else {
          this.checkPwd2 = false
        }
        this.showLoginBtn()
      },
      handlePwd2Blur (e) {
        this.password2 = e.target.value
        if (this.password2 !== this.password) {
          this.showNotice('两次密码输入不一致')
          this.checkPwd2 = false
        }
      },
      handlePassword (e) {
        this.password = e.password
        this.checkPwd = e.check
        if (this.password2 !== this.password) {
          this.checkPwd2 = false
        } else {
          this.checkPwd2 = true
        }
        this.showLoginBtn()
      },
      handleErrMiss () {
        this.errMessageShow = false
        this.errMessage = ''
      },
      handleSendCode () {
        if (!this.countDown) {
          axios.post('/api/user/getVerCode/?format=json', {
            tel: this.tel
          })
          .then(this.handleSendCodeSucc.bind(this))
          .catch(this.handleSendCodeErr.bind(this))
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
            this.showNotice(res.data.errMsg ? res.data.errMsg : '服务器错误')
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
            tel: this.tel,
            verCode: this.code,
            password: this.password
          })
          .then(this.handleLoginClickSucc.bind(this))
          .catch(this.handleLoginClickErr.bind(this))
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
        if (this.login && this.sendCode && this.checkPwd2 && this.checkPwd) {
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
    background: linear-gradient(#ffc36b, #ff9944)
    padding: 2.5rem .5rem 0 .5rem
    .pwd-input-con
      position: relative
      width: 100%
      padding-top: .35rem
      .default-input
        width: 100%
        line-height: .8rem
        font-size: .3rem
        text-indent: .2rem
        color: $lightFont
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