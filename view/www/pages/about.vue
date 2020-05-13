<template>
  <div>
		<about :data="Ret" :logo="logo"/>
  </div>
</template>

<script>
import About from '~/components/About.vue'
import axios from 'axios'

export default {
  layout: 'about', 
  components: {
    About
  },

  async asyncData({ store, error }) {
    try {
      let ret = await store.dispatch("map/getAboutPage")
      let img = await store.dispatch("map/getHome")
      let logo = img[18].image
      return {
        Ret: ret,
        logo
      }
    } catch(err) {
        error(err)
    }
  }
}
</script>

<style>

</style>
