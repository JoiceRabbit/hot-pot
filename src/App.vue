<template>
  <div id="app">
    <transition enter-active-class="animated fadeIn"
                leave-active-class="animated fadeOut"
                animation-duration: 300
                mode='out-in'>
      <keep-alive exclude="shop">
      	<router-view></router-view>
      </keep-alive>
    </transition>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
</style>
