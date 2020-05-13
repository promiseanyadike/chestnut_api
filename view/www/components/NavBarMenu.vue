<template>
  <nav class="navbar" role="navigation" aria-label="main navigation">
    <div class="navbar-brand">
      <a class="navbar-item" :href="logo" target="_blank">
        <img :src="`http://localhost:4000/${this.data}`" alt="Logo" />
        <!-- <img :src="`http://localhost:4000/${this.ret()}`" alt="Logo"> -->
      </a>
      <!-- <span class="navbar-burger burger" data-target="navbarMenuHeroA" @click="showNav = !showNav" :class="{'is-active': showNav}" style= "color: #f5e1f9"> -->
      <span
        class="navbar-burger burger"
        data-target="navbarMenuHeroA"
        @click="showNav = !showNav"
        :class="{ 'is-active': showNav }"
        style="color: #f5e1f9"
      >
        <span></span>
        <span></span>
        <span></span>
      </span>
    </div>
    <div
      id="navbarMenuHeroA"
      class="navbar-menu"
      :class="{ 'is-active': showNav }"
    >
      <div class="navbar-end">
        <b-field>
          <b-input
            placeholder="Search..."
            type="search"
            icon="magnify"
            v-model="search"
          >
          </b-input>
          <p class="control">
            <button class="button is-info">Search</button>
          </p>
        </b-field>
        <nuxt-link class="navbar-item" to="/">
          Home
        </nuxt-link>
        <!-- <header-nav-menu style="padding-top: 10px; padding-left: 12px" class="is-active"/> -->
        <nuxt-link
          class="navbar-item"
          to="/about"
          exact-active-class="is-active"
        >
          About
        </nuxt-link>
        <nuxt-link
          class="navbar-item"
          to="/contact"
          exact-active-class="is-active"
        >
          Contact us
        </nuxt-link>
      </div>
    </div>
  </nav>
</template>

<script>
export default {
  data() {
    return {
      attached: false,
      showNav: false,
      search: "",
      logo: "http://localhost:4000/static/dtouchlogo.svg"
    };
  },
  props: {
    data: {
      type: String,
      default: ""
    }
  }
};
</script>

<style scoped>
.navbar {
  background-color: transparent;
}
.field.has-addons {
  padding-top: 18px !important;
  justify-content: center;
}
.navbar-item {
  color: white;
}
/* .navbar-item :hover{
    color:black;
  } */
.navbar-end a {
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 95%;
  font-weight: bold;
}
/* nav a img {
    min-height: 860% !important;
  } */
.navbar-item img {
  max-height: 3.5rem;
}
@media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
}

@media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
}
.navbar-menu {
  background-color: transparent !important;
}
</style>
