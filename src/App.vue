<template>
  <div id="app">
    <transition enter-active-class="animated fadeIn"
                leave-active-class="animated fadeOut">
      <router-view></router-view>
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
