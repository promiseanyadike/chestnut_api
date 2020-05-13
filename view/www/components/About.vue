<template>
  <div>
    <section class="hero bg-img">
      <div class="hero-head">
        <!-- <nav-bar-menu/> -->
        <nav class="navbar" role="navigation" aria-label="main navigation">
          <div class="navbar-brand">
            <a class="navbar-item" :href="img" target="_blank">
              <img :src="`http://localhost:4000/${this.logo}`" alt="Logo" />
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
      </div>
      <div class="hero-body">
        <div class="container">
          <h1 class="title">
            About Us
          </h1>
        </div>
      </div>
    </section>
    <section class="threshold">
      <div class="container_mask">
        <span style="padding: 50px;">
          <div
            style="text-align: center; padding-bottom: 30px; font-size: 30px; font-weight: 700"
            class="about_res"
            v-html="ret().a1"
          ></div>
          <p
            style="font-size: 16px; margin: auto; width: 85%; text-align: justify"
            v-html="ret().a2"
          ></p>
        </span>
        <div class="box" style="padding-left: 45px;">
          <div class="columns" style="padding: 30px">
            <div class="column is-4">
              <p style="text-align: center">
                <strong v-html="ret().a3"> </strong>
                <span style="padding-top: 15px;padding: 7px;" v-html="ret().a4">
                </span>
              </p>
            </div>
            <div class="column is-4">
              <p style="text-align: center">
                <strong v-html="ret().a5"> </strong>
                <span style="padding-top: 15px;padding: 7px;" v-html="ret().a6">
                </span>
              </p>
            </div>
            <div class="column is-4">
              <p style="text-align: center">
                <strong v-html="ret().a7"> </strong>
                <span style="padding-top: 15px;padding: 7px;" v-html="ret().a8">
                </span>
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="team">
      <div class="container_mask">
        <div class="box">
          <p style="color: white;	text-align: center; padding: 21px;">
            Our Team
          </p>
          <div class="columns">
            <div class="column is-6">
              <div class="card">
                <div class="card-image">
                  <figure class="image is-4by3">
                    <img
                      :src="`http://localhost:4000/${this.ret().a11}`"
                      alt="image"
                    />
                  </figure>
                </div>
                <div class="card-content">
                  <div class="media">
                    <div class="media-left">
                      <figure class="image is-48x48">
                        <img
                          :src="`http://localhost:4000/${this.ret().a11}`"
                          alt="image"
                        />
                      </figure>
                    </div>
                    <div class="media-content">
                      <p class="title is-4" v-html="ret().a9"></p>
                      <p class="subtitle is-6">CEO</p>
                    </div>
                  </div>
                  <div class="content" v-html="ret().a10">
                    <p>
                      <a href="#">read more</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div class="column is-6">
              <div class="card">
                <div class="card-image">
                  <figure class="image is-4by3">
                    <img
                      :src="`http://localhost:4000/${this.ret().a14}`"
                      alt="Placeholder image"
                    />
                  </figure>
                </div>
                <div class="card-content">
                  <div class="media">
                    <div class="media-left">
                      <figure class="image is-48x48">
                        <img
                          :src="`http://localhost:4000/${this.ret().a14}`"
                          alt="Placeholder image"
                        />
                      </figure>
                    </div>
                    <div class="media-content">
                      <p class="title is-4" v-html="ret().a12"></p>
                      <p class="subtitle is-6">MANAGER</p>
                    </div>
                  </div>
                  <div class="content" v-html="ret().a13">
                    <p>
                      <a href="#">read more</a>
                    </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <footer-touch />
  </div>
</template>

<script>
// import NavBarMenu from '~/components/NavBarMenu.vue'
import FooterTouch from "~/components/FooterTouch.vue";
import axios from "axios";

export default {
  components: {
    // NavBarMenu,
    FooterTouch
  },

  data() {
    return {
      img: "http://localhost:4000/static/dtouchlogo.svg",
      attached: false,
      showNav: false,
      errors: [],
      search: "",
      searching: []
    };
  },

  props: {
    data: {
      type: Array,
      default: () => []
    },
    logo: {
      type: String,
      default: ""
    }
  },

  methods: {
    ret() {
      return {
        a1: this.data[0].title,
        a2: this.data[0].content,
        a3: this.data[1].title,
        a4: this.data[1].content,
        a5: this.data[2].title,
        a6: this.data[2].content,
        a7: this.data[3].title,
        a8: this.data[3].content,
        a9: this.data[4].title,
        a10: this.data[4].content,
        a11: this.data[4].images,
        a12: this.data[5].title,
        a13: this.data[5].content,
        a14: this.data[5].images
      };
    }
  }
};
</script>

<style scoped>
.bg-img {
  background-image: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)),
    url("../assets/bk.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  max-height: 100%;
  /* opacity: 0.9; */
}
.container h1 {
  color: white;
}
.threshold {
  background-image: url("../assets/funky-lines.png");
}
.team {
  background-image: url("../assets/funky-lines.png");
}
.team.columns {
  /* margin-left: -62px; */
  padding-bottom: 48px;
  padding-top: 24px;
}
strong {
  color: white;
}
.container_mask {
  /* max-width: 90%; */
  background-color: rgba(0, 0, 0, 0.45);
  height: 100% !important;
}
.container_mask span {
  display: grid;
  justify-content: center;
  /* padding: 50px; */
  color: white;
}
.box {
  background: rgba(0, 21, 60, 0.56) !important;
  /* margin: 9em; */
  margin-top: 0px;
}
.columns {
  color: white;
  padding-left: 0 !important;
  padding-top: 20px !important;
}
.box p {
  font-size: 30px;
}
p span {
  font-size: 14px;
  text-align: justify;
  padding-top: 15px;
}
.card {
  background: transparent !important;
  /* padding-right:62px; */
}
.card-content {
  color: white;
}
.media-content p {
  color: white;
  font-size: 20px;
}
a {
  color: white;
  font-size: 14px;
}
/* .column.is-6 {
		width: 48% !important;
	} */
@media screen and (max-width: 789px) {
  /* .box {
    margin: auto;
    width: 26em;
  } */
  /* .box p span {
    display: table-footer-group !important;
  } */
  strong {
    padding-top: 2em !important;
    color: white;
  }
  .card {
    padding-left: 0 !important;
  }
  .team .columns {
    margin: auto !important;
  }
  .threshold span p {
    width: 71% !important;
  }
  .container .title {
    margin-bottom: 0 !important;
    padding-top: 0 !important;
    /* padding-top: 41px; */
    display: flex;
    justify-content: center;
  }
}
.container_mask span {
  padding: 18px !important;
  padding-bottom: 28px !important;
}
.about_res {
  font-size: 25px !important;
}
.container .title {
  margin-bottom: 100px;
  padding-top: 86px;
  /* padding-top: 41px; */
  display: flex;
  justify-content: center;
  padding-bottom: 40px;
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

@media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
}
.navbar-menu {
  background-color: transparent !important;
} */
</style>
