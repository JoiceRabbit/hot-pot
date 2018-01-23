<template>
<div class="food-bar">
  <div class="iconfont sub-food food-btn" 
       @click="handleSubFood"
       v-show="show">&#xe712;</div>
  <div class="food-num"
       v-show="show">{{foodNum}}</div>
  <div class="iconfont add-food food-btn" 
       @click.self.stop="handleAddFood">&#xe6e0;</div>
</div>
</template>

<script>
  export default {
    name: 'foodBar',
    props: {
      food: Object
    },
    data () {
      return {
        foodItem: {},
        show: false,
        foodNum: 0
      }
    },
    methods: {
      handleAddFood (e) {
        this.show = true
        this.foodNum += 1
        this.$emit('food', {
          id: this.food.id,
          title: this.food.title,
          price: this.food.price,
          count: this.foodNum
        })
      },
      handleSubFood () {
        this.foodNum -= 1
        if (this.foodNum === 0) {
          this.show = false
        }
        this.$emit('food', {
          id: this.food.id,
          title: this.food.title,
          price: this.food.price,
          count: this.foodNum
        })
      }
    }
  }
</script>

<style scoped lang="stylus">
  .food-bar
    position: absolute
    top: 1rem
    right: .4rem
    width: 1.5rem
    height: .5rem
    .food-btn
      position: absolute
      font-size: .5rem
      color: #2695fe
    .food-num
      position: absolute
      top: 0
      left: .5rem
      width: .5rem
      font-size: .35rem
      line-height: .5rem
      text-align: center
    .sub-food
      top: 0
      left: 0
    .add-food
      top: 0
      right: 0
</style>