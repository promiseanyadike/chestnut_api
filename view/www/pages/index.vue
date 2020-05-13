<template>
  <div>
    <b-carousel :pause-hover="!pauseHover">
      <b-carousel-item v-for="(carousel, i) in AsynCarousel" :key="i">
        <section
          class="hero is-medium"
          id="slider"
          :style="{
            'background-image': `linear-gradient(rgba(0, 0, 0, 0.75),rgba(0, 0, 0, 0.75)), url(http://localhost:4000/${carousel.image})`
          }"
        >
          <div class="hero-head">
            <nav-bar-menu :data="logo" />
          </div>
          <!-- <div class="hero-body" style="padding-top: 4.5em" > -->
          <div class="hero-body">
            <div class="container has-text-centered">
              <h1 class="title">
                <div
                  :class="divClasses"
                  @click="attached = !attached"
                  id="title"
                >
                  {{ carousel.title }}
                </div>
              </h1>
              <h2 class="subtitle">{{ carousel.content }}</h2>
            </div>
          </div>
        </section>
      </b-carousel-item>
    </b-carousel>
    <section class="second_section">
      <h3
        class="container has-text-centered"
        id="just"
        style=" font-size: 50px; padding: 58px; color:dodgerblue"
      >
        {{ s }}
      </h3>
      <div class="container has-text-centered" id="conti">
        <strong class="servix"> Our Services</strong>
      </div>
      <div class="container" style="padding-right: 30px" id="cont">
        <div class="columns is-multiline" id="contin">
          <div class="column is-6 box-wrap">
            <div
              class="box"
              style="background: transparent; box-shadow: 0 0 9px 2px #064e685e"
            >
              <h4 class="never">
                <span class="icon has-text-info">
                  <i style="font-size: 60px" class="mdi mdi-hanger"></i>
                </span>
              </h4>
              <div class="title1">
                <h1>{{ d1 }}</h1>
              </div>
              <div class="msg1">
                <p>
                  <strong class="test1">
                    {{ d2 }}
                  </strong>
                </p>
              </div>
            </div>
            <div
              class="box"
              style="background: transparent; box-shadow: 0 0 9px 2px #064e685e"
            >
              <h4 class="never">
                <span class="icon has-text-info">
                  <i
                    style="font-size: 60px"
                    class="mdi mdi-washing-machine"
                  ></i>
                </span>
              </h4>
              <div class="title2">
                <h1>{{ d3 }}</h1>
              </div>
              <div class="msg2">
                <p>
                  <strong class="test2">
                    {{ d2 }}
                  </strong>
                </p>
              </div>
            </div>
          </div>
          <div class="column is-6 box-wrap" id="continen">
            <div
              class="box"
              style="background: transparent; box-shadow: 0 0 9px 2px #064e685e"
            >
              <h4 class="never">
                <span class="icon has-text-info">
                  <i style="font-size: 60px" class="mdi mdi-waves"></i>
                </span>
              </h4>
              <div class="title4">
                <h1>
                  {{ d5 }}
                </h1>
              </div>
              <div class="msg4">
                <strong class="tes4">
                  {{ d2 }}
                </strong>
              </div>
            </div>
            <div
              class="box"
              style="background: transparent; box-shadow: 0 0 9px 2px #064e685e"
            >
              <h4 class="never">
                <span class="icon has-text-info">
                  <i style="font-size: 60px" class="mdi mdi-weather-sunny"></i>
                </span>
              </h4>
              <div class="title3">
                <h1>
                  {{ d4 }}
                </h1>
              </div>
              <div class="msg3">
                <strong class="test3">
                  {{ d2 }}
                </strong>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="thirdsection">
      <div
        class="container has-text-centered"
        style="font-size: 60px; padding-top: 50px; color: dodgerblue"
      >
        <h1 id="contine">OUR GALLERY</h1>
      </div>
      <div class="container">
        <div
          class="columns is-multiline"
          style="padding-bottom: 146px; padding-right:42px;margin-top: -40px"
        >
          <!--padding-right: 218px; -->
          <div class="column is-4" v-for="img in images" :key="img.id">
            <figure class="image">
              <!-- <img :src="`http://localhost:4000/${img}`" alt="image"> without using props and rendering on this page-->
              <page-box :data="img" />
            </figure>
          </div>
        </div>
      </div>
    </section>
    <section class="fouthsection">
      <div class="container" style="padding-top:5em">
        <h1 class="has-text-centered" style="color: white; font-size: 45px">
          Pricing Plans
        </h1>
        <b-tabs position="is-centered" class="block">
          <b-tab-item label="Under Wash">
            <section class="tab-content">
              <div class="tab-item">
                <div
                  class="columns is-multiline"
                  style="justify-content:center; margin-right: 3em"
                >
                  <div class="column is-4">
                    <div class="box" style="box-shadow: 0 0 9px 2px #064e685e">
                      <!-- <h1 id="alone">&#8358;<span>{{p1}}</span> / Service</h1> -->
                      <h1 id="alone">
                        <span>{{ p1 | currency }}</span> / Service
                      </h1>
                      <div class="content" id="content">
                        <ul>
                          <li v-for="i in p2" :key="i.id">{{ i.name }}</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="column is-4">
                    <div
                      class="box"
                      style="box-shadow: 0 0 9px 2px #064e685e; padding-bottom: 76px"
                    >
                      <h2>
                        <span>{{ p3 | currency }}</span> / Service
                      </h2>
                      <div class="content" id="content">
                        <ul>
                          <li v-for="i in p4" :key="i.id">{{ i.name }}</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                  <div class="column is-4">
                    <div
                      class="box"
                      style="box-shadow: 0 0 9px 2px #064e685e; padding-bottom: 104px"
                    >
                      <h3>
                        <span>{{ p5 | currency }}</span> / Service
                      </h3>
                      <div class="content" id="content">
                        <ul>
                          <li v-for="i in p6" :key="i.id">{{ i.name }}</li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                  <div id="context">
                    <div class="box">
                      <h4 class="has-text-centered" id="alone1">{{ p7 }}</h4>
                      <div class="container special">
                        <div class="columns home is-multiline" id="table_responsive" style="width: 100%;">
                            <div class="column is-6 figs" >
                              {{ p8 }}
                            </div>
                            <div class="column is-6 figs"> 
                              {{ p9 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p10 }}
                            </div>
                              <div class="column is-6 figs">
                              {{ p11 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p12 }}
                            </div>
                             <div class="column is-6 figs">
                              {{ p13 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p14 }}
                            </div>
                             <div class="column is-6 figs">
                              {{ p15 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p16 }}
                            </div>
                             <div class="column is-6 figs">
                              {{ p17 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p18 }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p19 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p20 }}
                            </div>
                               <div class="column is-6 figs">
                              {{ p21 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p22 }}
                            </div>
                                <div class="column is-6 figs">
                            {{ p23 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p24 }}
                            </div>  
                               <div class="column is-6 figs">
                            {{ p25 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p26 }}
                            </div>
                              <div class="column is-6 figs">
                              {{ p27 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p28 }}
                            </div>

                            <div class="column is-6 figs">
                              {{ p29 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p30 }}
                            </div>
                               <div class="column is-6 figs">
                              {{ p31 | currency }}
                            </div>
                            <div class="column is-6 figs">
                              {{ p33 }}
                            </div>
                               <div class="column is-6 figs">
                              {{ p32}}
                            </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </section>
          </b-tab-item>
          <!-- IRONING ONLY-->
          <b-tab-item label="Ironing Only">
            <div class="columns is-multiline" style="justify-content:center">
              <div class="column is-6">
                <div class="box" style="box-shadow: 0 0 9px 2px #064e685e; padding-bottom: 139px">
                  <h6>
                    <span>{{ p34 | currency }}</span
                    >/order
                  </h6>
                  <div class="table_content" style="margin-top:32px">
                    <div id="table_content_id" v-for="i in p_2" :key="i.id">
                      {{ i.name }}
                    </div>
                    <div id="table_content_id">{{ p35 }}</div>
                  </div>
                </div>
              </div>
              <div class="column is-6">
                <div class="box" style="box-shadow: 0 0 9px 2px #064e685e;">
                  <h5 class="has-text-centered">Others</h5>
                    <div class="columns is-multiline" style="padding-top: 35px" >
                      <div class="column is-6 figs">
                        {{ p36 }}
                      </div>
                      <div class="column is-6 figs" >
                        {{ p37 | currency }}
                      </div>
                        <div class="column is-6 figs" >
                          {{ p38 }}
                        </div>
                        <div class="column is-6 figs">
                          {{ p39 | currency }}
                        </div>
                        <div class="column is-6 figs">
                          {{ p40 }}
                        </div>
                        <div class="column is-6 figs">
                          {{ p41 | currency }}
                        </div>
                        <div class="column is-6 figs">
                          {{ p42 }}
                        </div>
                        <div class="column is-6 figs">
                          {{ p43 | currency }}
                        </div>
                    </div>
                  </div>
              </div>
            </div>
          </b-tab-item>
        </b-tabs>
      </div>
    </section>
    <section class="sectionfive">
      <div class="container">
        <h1 id="continent">Our Team</h1>
      </div>
      <div class="container box-wrap">
        <div class="columns is-multiline" style="padding-left: 11em">
          <div class="column is-6">
            <div class="box" style="background:transparent; width: 63%" id="box_res">
              <figure class="image" style="text-align: -webkit-center">
                <!-- <img class="is-rounded" src="../assets/ebube.jpg" alt="image not visible" style="height: 183px; width: 183px; box-shadow: 0 0 9px 2px #064e685e"> -->
                <img
                  :src="`http://localhost:4000/${this.pimage}`"
                  alt="image not visible"
                  style="box-shadow: 0 0 9px 2px #064e685e; height: 183px; width: 183px;"
                  id="img_res"
                />
              </figure>
              <div class="title" style="  padding-top: 1em; text-align: center">
                {{ p44 }}
              </div>
              <div
                class="subtitle"
                style="margin-top: -30px; display:flex; justify-content:center; color: dodgerblue"
              >
                {{ p45 }}
              </div>
            </div>
          </div>
          <div class="column is-6">
            <div class="box" style="background:transparent; width: 63%" id="box_res">
              <figure class="image" style="text-align: -webkit-center">
                <!-- <img class="is-rounded" src="../assets/obinna.jpg" alt="image not visible" style="height: 183px; width: 183px; box-shadow: 0 0 9px 2px #064e685e"> -->
                <img
                  :src="`http://localhost:4000/${this.pobinna}`"
                  alt="image not visible"
                  style="box-shadow: 0 0 9px 2px #064e685e; height: 183px; width: 183px;"
                  id="img_res"
                />
              </figure>
              <div class="title" style="  padding-top: 1em; text-align: center">
                {{ p46 }}
              </div>
              <div
                class="subtitle"
                style="margin-top: -30px;display:flex; justify-content:center; color: dodgerblue"
              >
                {{ p47 }}
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
import NavBarMenu from "~/components/NavBarMenu.vue";
import FooterTouch from "~/components/FooterTouch.vue";
import PageBox from "~/components/PageBox.vue";
import axios from "axios";
import { mapState, mapMutations } from "vuex";
import Vue2Filters from "vue2-filters";

export default {
  components: {
    NavBarMenu,
    FooterTouch,
    PageBox
  },

  mixins: [Vue2Filters.mixin],

  data() {
    return {
      attached: false,
      showNav: false,
      errors: [],
      search: "",
      searching: [],
      pauseHover: true,
      data: [
        { p11: "", p12: ""}
      ],
      columns: [
        {
          field: 'wear',
          label: '',
          
        },
        {
          field: 'price_wear',
          label: '',
          width: 40
        }
      ]
    };
  },

  async asyncData({ store, error }) {
    try {
      let ret = await store.dispatch("map/getHome");
      let newArr = ret.slice(6, 18);
      let img = [];
      newArr.map(val => img.push(val.image));
      console.log(img);

      let logo = ret[18].image;
      console.log(logo);

      let AsynCarousel = ret.slice(0, 2);
      console.log(AsynCarousel);

      let res = await store.dispatch("map/getPrice");
      console.log(res);
      let newres = res.slice(1, 6);
      console.log(newres);
      let newArray = res.slice(1, 5);
      return {
        content: ret[0].content,
        title: ret[0].title,
        s: ret[1].title,
        d1: ret[2].title,
        d2: ret[2].content,
        d3: ret[3].title,
        d4: ret[4].title,
        d5: ret[5].title,
        images: img,
        logo,
        p1: res[0].price,
        p2: newres,
        p3: res[6].price,
        p4: res.slice(7, 10),
        p5: res[10].price,
        p6: res.slice(11, 13),
        p7: res[13].price,
        p8: res[14].name,
        p9: res[14].price,
        p10: res[15].name,
        p11: res[15].price,
        p12: res[16].name,
        p13: res[16].price,
        p14: res[17].name,
        p15: res[17].price,
        p16: res[18].name,
        p17: res[18].price,
        p18: res[19].name,
        p19: res[19].price,
        p20: res[31].name,
        p21: res[31].price,
        p22: res[20].name,
        p23: res[20].price,
        p24: res[21].name,
        p25: res[21].price,
        p26: res[22].name,
        p27: res[22].price,
        p28: res[23].name,
        p29: res[23].price,
        p30: res[24].name,
        p31: res[24].price,
        p32: res[25].price,
        p33: res[25].name,
        p34: res[6].price,
        p_2: newArray,
        p35: res[11].name,
        p36: res[26].name,
        p37: res[26].price,
        p38: res[29].name,
        p39: res[29].price,
        p40: res[30].name,
        p41: res[30].price,
        p42: res[9].name,
        p43: res[9].price,
        pimage: ret[19].image,
        p44: ret[19].title,
        p45: ret[19].content,
        pobinna: ret[20].image,
        p46: ret[20].title,
        p47: ret[20].content,
        // images: ret[7].image
        AsynCarousel
      };
      console.log("img", img);
    } catch (err) {
      error(err);
    }
  },
  computed: {
    divClasses() {
      return {
        seenWhite: this.attached, // the property css class "seenwhite" is false here..meaning no color white
        seenBlue: !this.attached
      };
    },
    ...mapState("map", ["index"]),
    filterTitle() {
      return this.searching.filter(proms => {
        return (
          // proms.content.match(this.search),
          // proms.date_created.match(this.search),
          //proms.images.match(this.search),
          proms.title.match(this.search)
        ); // i got this right baby
      });
      console.log(searching);
    }
  },

  methods: {
    toggleNav() {
      return (this.showNav = true);
    }
  }
};
</script>

<style>
html {
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI",
    Roboto, "Helvetica Neue", Arial, sans-serif;
  font-size: 16px;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
}

*,
*:before,
*:after {
  box-sizing: border-box;
  margin: 0;
}

.content {
  color:white;
  display: flex;
  justify-content: center;
}

/* @media screen and (max-width: 481px) {
  .subtitle {
    font-size: 7.4px !important;
    line-height: 1.8em !important;
    display: flex !important;
    justify-content: center !important;
  }
  .column.is-3 {
    width: 100% !important;
  }
  .title div {
    width: 78% !important;
    margin-top: -50px;
  }
  .hero-body {
    padding-top: 4.5em;
  }
  #context {
    width: 94% !important;
  }
  .b-tabs .tab-content {
    padding: 5px;
  }
} */

@media screen and (max-width: 789px) {
  .subtitle {
    padding-top: 30px !important;
    font-weight: bolder !important;
    text-align: justify;
  }
  .box h6 {
    font-size: 50px !important;
    overflow: hidden;
  }
  .box h5 {
    font-size: 50px !important;
  }
  
   #box_res{
    width: 100% !important;   
  }
  #img_res {
    width: 270px !important;
  }
  .hero-body {
    padding-top: 4.5em !important;
  }
  .title div {
    width: 100% !important;
  }
  .second_section h3 {
    margin-right: 58px !important;
    font-size: 29px !important;
  }
  #alone {
    font-size: 10px;
  }
  .is-multiline {
    display: contents;
  }
  .container {
    padding-right: 12px !important;
  }
  .servix {
    color: blueviolet;
  }
  #colum {
    margin-top: -52px !important;
  }
  #about {
    display: flex;
    justify-content: center;
    padding-top: 4em;

  }
  /* #maintain {
    padding-left: 54px !important;
    padding-top: 0 !important;
  } */
  #content {
    /* padding-right: 23px !important; */
    padding-top: 15px !important;
  }
  #footerLast {
    padding-top: 16px !important;
    line-height: 24px !important;
  }
  #just {
    padding: 0 !important;
    padding-left: 46px !important;
    padding-top: 20px !important;
  }
  /* #dtouch {
    padding-left: 54px !important;
  } */
  /* #social {
    padding-left: 30px !important;
  } */
  #cont {
    padding-top: 6px !important;

  }
  #conti {
    padding-top: 10px !important;
  }
  #contin {
    padding-bottom: 20px !important;
  }
  #contine {
    margin-top: -36px;
  }
  #copyright {
    padding-right: 31px !important;
  }
  #continen {
    padding-bottom: 23px;
  }
  #continent {
    font-size: 42px !important;
    padding-top: 24px !important;
  }
  .box-wrap {
    text-align: -webkit-center !important;
  }
  .subtitle {
    padding-left: 0 !important;
  }
  .sectionfive {
    padding-bottom: 36px !important;
  }
  .column.is-3 {
    width: 100% !important;
  }
  #context {
    width: 94% !important;
  }
  .figs {
    font-weight: 700;
    font-size: 15px !important;
    color: black;
  }
  .b-tabs .tab-content {
    padding: 5px !important;
  }
}


#slider {
  /* background-image: url('../assets/slide-1.jpg'); */
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  max-height: 100%;
  /* background-image: linear-gradient(rgba(0, 0, 0, 0.75),rgba(0, 0, 0, 0.75)); */
}
.subtitle {
  font-size: 16px;
  line-height: 1.4em;
  /* width: 41%; */
  /* text-align: justify; */
  padding-top: 25px;
  color: white;
}
/* .title div {
  display: flex;
  justify-content: flex-start;
  width: 12em;
  font-size: 40px;
} */
.second_section {
  background-image: url("../assets/full-bloom.png");
}
.columns {
  padding-left: 3em;
  padding-top: 5em;
}
.column.is-3 {
  -webkit-box-flex: 0;
  -ms-flex: none;
  flex: none;
  width: 50%;
}
.never {
  padding-top: 2em;
  text-align: center;
}
strong {
  line-height: 1.8;
}
.title1 h1 {
  text-align: center;
  padding-top: 2em;
}
.title2 h1 {
  text-align: center;
  padding-top: 2em;
}
.title3 h1 {
  text-align: center;
  padding-top: 2em;
}
.title4 h1 {
  text-align: center;
  padding-top: 2em;
}
.msg1 {
  text-align: center;
  padding: 22px;
}
.msg2 {
  text-align: center;
  padding: 22px;
}
.msg3 {
  text-align: center;
  padding: 22px;
}
.msg4 {
  text-align: center;
  padding: 22px;
}
.thirdsection {
  background: gainsboro;
}
/* .container .has-text-centered {
text-align: center;} */

.fouthsection {
  background-image: linear-gradient(rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0.75)),url("../assets/bk.jpg");
  padding-bottom: 93px;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
  max-height: 100%;
}
.sectionfive {
  background-image: url("../assets/full-bloom.png");
  padding-bottom: 110px;
}
.seenBlue {
  display: flex;
}
.others {
  background: #efefef;
  margin-bottom: 5px;
  padding: 3px 5px;
  border-radius: 6px;
}
.lgls {
  display: flex;
  justify-content: flex-start;
  font-weight: 500;
  font-size: 20px;
  color: black;
}
.figs {
  /* font-weight: 500; */
  font-size: 22px;
  color:white;
  font-style: italic;
  text-align: center;
  padding-bottom: 40px;

}
a span {
  color: white;
}
a span {
  color: white;
}
.seenBlue {
  color: dodgerblue;
}
.seenWhite {
  color: white;
}
#alone {
  background: radial-gradient(black, transparent);
  color: white;
  font-size: 34px;
  text-align: center;
}
.box h2 {
  background: radial-gradient(black, transparent);
  font-size: 34px;
  color: white;
  text-align: center;
  border-radius: 20px;
}
.box h3 {
  background: radial-gradient(black, transparent);
  font-size: 34px;
  color: white;
  text-align: center;
  border-radius: 20px;
}
#alone1 {
  background: radial-gradient(black, transparent);
  font-size: 48px;
  color: white;
}
.box h6 {
  background: radial-gradient(black, transparent);
  color: white;
  font-size: 53px;
  border-radius: 20px;
  text-align: center;
}
.box h5 {
  background: radial-gradient(black, transparent);
  font-size: 53px;
  color: white;
  border-radius: 20px;
}
#contin {
  padding-bottom: 98px;
}
#continent {
  justify-content: center;
  text-align: center;
  font-size: 34px;
  color: dodgerblue;
  padding-top: 3em;
}
.table {
  width: 100%;
  margin-top: 10px;
}
/* .table td {
  font-style: italic;
  font-size: 22px;
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
    Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
  padding: 1.4em;
} */
#context { 
  box-shadow: 0 0 9px 2px #064e685e;
  margin: 30px;
  width: 94%;
}

#table_content_id {
  padding: 8px;
  color:white;
  font-style: italic;
  text-align: center;
}
/* #table_id {
  padding: 15px !important;
} */

.navbar {
  background-color: #555;
}
.field.has-addons {
  padding-top: 18px !important;
  justify-content: center;
}
.navbar-item {
  color: white;
}
.navbar-end a {
  text-transform: uppercase;
  letter-spacing: 1px;
  font-size: 95%;
  font-weight: bold;
}
.navbar-item img {
  max-height: 3.5rem;
}
/* @media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
} */

@media screen and (max-width: 481px) {
  .navbar-item img {
    max-height: 4.75rem !important;
  }
/* .hero-body .title {
  color: white;
}
.hero-body .content{
  color: white;
} */
.hero-body .container .title {
  display: flex;
  justify-content: center;
}
/* .hero-body .container .subtitle {
 
} */
 /* .box h6 {
    font-size: 50px !important;
  }
  .box h5 {
    font-size: 50px !important;
  } */
 
   #box_res{
    width: 100% !important;   
  }
  #img_res {
    width: 270px !important;
  }
}
#title {
  display:flex;
  justify-content: center;
}

.box {
  background-color: transparent !important;

}
/* .container .special {
  margin-left: 6em;
  margin-top: -4em;
} */

</style>
