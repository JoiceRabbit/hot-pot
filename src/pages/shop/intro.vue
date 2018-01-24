<template>
  <div class="intro">
    <div class="info-con">
      <div class="info-title">
        配送信息
      </div>
      <div class="send-info-con">
        {{shopIntroInfo.information}}
      </div>
   </div>
   <div class="info-con">
     <div class="info-title">商家实景</div>
     <div class="intro-img-con">
       <img class="intro-img" v-for="item in shopIntroInfo.pics" :key="item.id" v-lazy="item.imgUrl" alt="">
     </div>
   </div>
   <div class="info-con">
      <div class="info-title">
        商家信息
      </div>
      <div class="intro-phone intro-item">
        商家电话：{{shopIntroInfo.phone}}
      </div>
      <div class="intro-address intro-item">
        地址：{{shopIntroInfo.address}}
      </div>
      <div class="intro-openingHours intro-item">
        营业时间{{shopIntroInfo.openingHours}}
      </div>
   </div>
  </div>
</template>

<script>
  export default {
    name: 'shopIntro',
    props: {
      shopIntroInfo: Object
    }
  }
</script>

<style scoped lang="stylus">
  .intro
    background: #ccc
    .info-con
      padding: .2rem .4rem
      margin-bottom: .35rem
      background: #fff
      .info-title
        font-size: .34rem
        line-height: .65rem
        font-weight: bold
      .intro-item
        font-size: .26rem
        line-height: .5rem
        color: #333
      .send-info-con
        line-height: .34rem
      .intro-img-con
        display: flex
        .intro-img
          width: 1.56rem
          height: 1.56rem
          margin-right: .1rem
</style>