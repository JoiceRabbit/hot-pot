<template>
  <div>  
    <input class="pwd-input" 
           v-model="password" 
           type="password" 
           placeholder="密码:只能输入6-20个字母、数字、下划线 " 
           @input="handlePwd"
           @blur="handleCheck">
  </div>
</template>

<script>
  export default {
    name: 'pwdInput',
    data () {
      return {
        password: ''
      }
    },
    methods: {
      handlePwd (e) {
        this.password = e.target.value
        if (this.checkPwd()) {
          this.$emit('password', {
            password: this.password,
            check: true
          })
        } else {
          this.$emit('password', {
            password: this.password,
            check: false
          })
        }
      },
      checkPwd () {
        return /^(\w){6,20}$/.test(this.password)
      },
      handleCheck (e) {
        this.password = e.target.value
        if (this.checkPwd()) {
          this.$emit('check', {
            check: true
          })
        } else {
          this.$emit('check', {
            check: false
          })
        }
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/varibles.styl'
  .pwd-input
    width: 100%
    line-height: .8rem
    font-size: .3rem
    text-indent: .2rem
    color: $lightFont
    background: $loginInputBg
</style>