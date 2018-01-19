<template>
  <swiper class="wrapper" :options="swiperOption">
    <swiper-slide class="content" v-for="item in sliders" :key="item.id">
      <img :src="item.imgUrl || defaultImg" class="banner-img">
    </swiper-slide>
    <div class="swiper-pagination"  slot="pagination"></div>
  </swiper>
</template>

<script>
  export default {
    name: 'index-swiper',
    props: {
      sliders: Array
    },
    data () {
      return {
        defaultImg: '/static/banner/default.jpg',
        swiperOption: {
          pagination: '.swiper-pagination',
          loop: true,
          autoplay: 3000,
          speed: 2500,
          observer: true,
          observerParents: true,
          initialSlide: 1
        }
      }
    }
  }
</script>

<style scoped lang="stylus">
  .wrapper
    background: #fff
    width: 100%
    overflow: hidden
    height: 0
    padding-bottom: 31.25%
    .banner-img
      width: 100%
    .swiper-pagination
      bottom: .03rem
      & >>> .swiper-pagination-bullet
        background: #f34300
</style>