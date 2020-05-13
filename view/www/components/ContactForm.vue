<template>
  <div>
    <section class="hero bg-img">
      <!-- <nav-bar-menu style="color:white"/> -->
      <nav
        class="navbar"
        role="navigation"
        aria-label="main navigation"
        style="color:white"
      >
        <div class="navbar-brand">
          <a class="navbar-item" :href="img" target="_blank">
            <img :src="`http://localhost:4000/${this.log}`" alt="Logo" />
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
      <div class="hero-body">
        <div class="container">
          <h1 class="title" style="color: white">
            Contact Us
          </h1>
        </div>
      </div>
    </section>
    <section>
      <div class="contentpage">
        <div class="contentpage_mask">
          <div class="columns is-multiline">
            <!--padding-right: 218px; -->
            <div class="column  is-4">
              <div class="contact">
                <h1><p>OUR OFFICE</p></h1>
                <span v-html="det().c1"></span>
                <p>Phone: <span v-html="det().c2"></span></p>
                <p>Email: dtouchexpertslaundry@gmail.com</p>
              </div>
            </div>
            <div class="column is-8" style="padding-bottom: 81px" id="column_contact">
              <div class="box" style="box-shadow: 0 0 9px 2px #064e685e">
                <section class="form">
                  <b-field>
                    <label class="label" style="  color: white !important;">
                      Name
                      <b-input v-model="name"></b-input>
                    </label>
                  </b-field>
                  <b-field type="is-danger" message="This email is invalid">
                    <label class="label" style=" color: white !important">
                      Email
                      <b-input
                        type="email"
                        value="john@gmail.com"
                        maxlength="30"
                      >
                      </b-input>
                    </label>
                  </b-field>
                  <b-field>
                    <label class="label" style=" color: white !important">
                      Message
                      <b-input maxlength="200" type="textarea"></b-input>
                    </label>
                  </b-field>
                  <b-field horizontal style="display: contents"
                    ><!-- Label left empty for spacing -->
                    <p class="control">
                      <button class="button is-info">
                        Send message
                      </button>
                    </p>
                  </b-field>
                </section>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<script>
// import NavBarMenu from '~/components/NavBarMenu.vue'

export default {
  components: {
    // NavBarMenu,
  },
  data() {
    return {
      name: "John Silver",
      img: "http://localhost:4000/static/dtouchlogo.svg",
      attached: false,
      showNav: false,
      errors: [],
      search: "",
      searching: []
    };
  },

  props: {
    log: {
      type: String,
      default: ""
    },
    data: {
      type: Array,
      default: () => []
    }
  },

  methods: {
    det() {
      return {
        c1: this.data[21].title,
        c2: this.data[21].content
      };
    }
  }
};
</script>

<style scoped>
.bg-img {
  background-image: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)),
    url("../assets/clean.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  max-height: 100%;
  opacity: 0.9;
}

.box {
  /* background: black; */
  margin-right: 4em;
}
.contentpage {
  background-image: url("../assets/funky-lines.png");
}
.contentpage_mask {
  background-color: rgba(0, 0, 0, 0.45);
  color: white;
}
.contact p {
  line-height: 3em;
}
.seenBlue {
  color: dodgerblue;
}
.seenWhite {
  color: white;
}
.columns {
  padding-left: 4em;
  padding-top: 4em;
}
.container .title {
  margin-bottom: 100px;
  padding-top: 86px;
  display: flex;
  justify-content: center;
  padding-bottom: 40px;
}
@media screen and (max-width: 789px) {
  .container .title {
    margin-bottom: 0 !important;
    padding-top: 0 !important;
    display: flex;
    justify-content: center;
  }
  .columns {
    padding-left: 0 !important;
  }
  .contact {
    text-align: center;
  }
  #column_contact {
    margin-left: 4em;
  }
  .button .is-info {
    margin-left: 2em
  }
}

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

/* @media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
}
.navbar-menu {
  background-color: transparent !important;
} */
</style>
