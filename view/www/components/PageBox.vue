<template>
  <section>
		<figure class="image">
      <img :src="`http://localhost:4000/${this.data}`" alt="image not visible" style="box-shadow: 0 0 9px 2px #064e685e">
    </figure>
  </section>
</template>

<script>
  import axios from 'axios'

  export default {
    name: 'pagebox',
    //this component info is passsed to the layout page (component to component interaction)
    props: {
      data: {
        type: String,
        default: ""
      }
    }
}
</script>

<style>
</style>