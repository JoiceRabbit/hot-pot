<template>
  <div>  
    <input class="message-input" 
           v-model="phoneNum" 
           type="text" 
           placeholder="手机号" 
           @input="handlePhoneNum">
  </div>
</template>

<script>
  export default {
    name: 'PhoneInput',
    data () {
      return {
        phoneNum: ''
      }
    },
    methods: {
      handlePhoneNum (e) {
        this.phoneNum = e.target.value
        if (this.phoneNum.length >= 11) {
          this.phoneNum = this.phoneNum.slice(0, 11)
          this.$emit('codeShow', {
            codeShow: true,
            phoneNum: this.phoneNum,
            check: this.checkPhoneNum()
          })
        } else {
          this.$emit('codeShow', {
            codeShow: false,
            check: this.checkPhoneNum()
          })
        }
      },
      checkPhoneNum () {
        return /^1[3578]\d{9}$/.test(this.phoneNum)
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
</style>