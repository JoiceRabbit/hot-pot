<template>
  <div id="app">
    <transition enter-active-class="animated fadeIn"
                leave-active-class="animated fadeOut"
                animation-duration: 200
                mode='out-in'>
      <keep-alive include="index,find">
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
