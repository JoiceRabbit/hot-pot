<template>
  <div>
    <input class="message-input" 
           type="text" 
           placeholder="验证码"
           @input="handleCode"
           v-model="code">
    <div class="send-code" 
          :class="{'code-active': codeShow, 'count-down': count}"
          @click="handleSendCode">
        {{text}}</div>
  </div>
</template>

<script>
  // import axios from 'axios'
  export default {
    name: 'CodeInput',
    data () {
      return {
        code: '',
        text: '发送验证码',
        count: false
      }
    },
    props: {
      codeShow: Boolean,
      countDown: Boolean
    },
    watch: {
      countDown () {
        this.count = this.countDown
        if (this.count) {
          this.text = '60s'
          const timer = setInterval(() => {
            if (parseInt(this.text, 10) === 0) {
              clearInterval(timer)
              this.count = false
              this.$emit('stop')
              this.text = '发送验证码'
            } else {
              this.text = parseInt(this.text, 10) - 1 + 's'
            }
          }, 1000)
        } else {
          //
        }
      }
    },
    methods: {
      handleSendCode () {
        if (this.codeShow) {
          this.$emit('send')
        }
      },
      handleCode (e) {
        this.code = e.target.value
        if (this.code.length >= 6) {
          this.code = this.code.slice(0, 6)
          if (this.checkCode()) {
            this.$emit('login', {
              login: true,
              code: this.code
            })
          } else {
            this.$emit('login', {
              login: false
            })
          }
        } else {
          this.$emit('login', {
            login: false
          })
        }
      },
      checkCode () {
        return /^\d{6}$/.test(this.code)
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
  .count-down
    background: #666
    color: #fff
</style>