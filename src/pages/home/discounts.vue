<template>
  <div class="shop-discounts">
    <div class="praise iconfont" v-if="praise">&#xe602; 口碑人气好店</div>
    <hr class="line">
    <div class="discounts">
      <ul class="dis-con">
        <li v-for="item in tempDisList.discountList" 
            :key="item.id" 
            v-show="item.show" 
            class="dis-item">
          <span class="dis-icon" 
                v-bind:class="{ 
                  pink: item.cate === '减', 
                  green: item.cate === '首',
                  pinkLight: item.cate === '特',
                  greenLight: item.cate === '赠'
                }">
            {{item.cate}}
          </span>
          <span class="dis">{{item.desc}}</span>
        </li>
      </ul>
      <div class="dis-num" 
           v-show="tempDisList.hasMore"
           @click="handleMoreDis($event)">展开</div>
    </div>
  </div>
</template>

<script>
  export default {
    name: 'discounts',
    props: {
      discounts: Object,
      praise: Boolean,
      shopIndex: Number
    },
    data () {
      return {
        discountsList: {},
        tempDisList: {}
      }
    },
    mounted () {
      this.discountsList = JSON.parse(JSON.stringify(this.discounts))
      this.discountsList.discountList = this.discountsList.discountList.map((value, index) => {
        value.show = true
        return value
      })
      this.tempDisList = this.discounts
    },
    methods: {
      handleMoreDis (e) {
        if (e.target.innerHTML === '展开') {
          e.target.innerHTML = '收起'
          this.tempDisList = this.discountsList
        } else {
          e.target.innerHTML = '展开'
          this.tempDisList = this.discounts
        }
      }
    }
  }
</script>

<style scoped lang="stylus">
  @import '../../assets/styles/common/mixin.styl'
  .shop-discounts
    margin: .1rem 0 0 1.7rem
    .praise
      font-size: .28rem
      color: #e8470b
      padding-bottom: .1rem
    .line
      background: #eee
    .discounts
      position: relative
      .dis-item
        display: flex
        line-height: .35rem
        font-size: .24rem
        color: #666
        .dis-icon
          margin-right: .15rem
          width: .28rem
          line-height: .28rem
          color: #fff
          text-align: center
          border-radius: .08rem
          background: pink
        .dis
          flex: 1
          ellipsis()
        .pink
          background: rgb(240, 115, 115)
        .green
          background: rgb(112, 188, 70)
        .pinkLight
          background: rgb(241, 136, 79)
        .greenLight
          background: rgb(60, 199, 145)
      .dis-num
        position: absolute
        top: 0
        right: 0
        font-size: .24rem
</style>