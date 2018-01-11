<template>
  <div>
    <input class="message-input" type="text" placeholder="验证码">
    <div class="send-code" 
          :class="{'code-active': codeShow}"
          @click="handleSendCode">
        发送验证码</div>
  </div>
</template>

<script>
  // import axios from 'axios'
  export default {
    name: 'CodeInput',
    props: {
      codeShow: Boolean
    },
    methods: {
      handleSendCode () {
        if (this.codeShow) {
          this.$emit('send')
          //  此处应弹出提示提醒用户手机号不合法
        }
      },
      handleSendCodeSucc (res) {
        console.log(res.data.ret)
      },
      handleSendCodeErr (e) {
        console.log(2)
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
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
</style>