<template>
  <div>
	<section class="footer">
    <div class="wrapper">
      <div class="container has-text-centered" style="color:white;font-size: 35px; font-family: Georgia;">
          Get free newsletter to keep up-to-date with our Brands
        </div>
        <div class="container">
				  <div class="field has-addons">
            <div class="control">
              <input class="input" type="text" placeholder="Email">
          </div>
            <div class="control">
              <a class="button">
                Subscribe
              </a>
            </div>
          </div>
            <p id="respect">
              we respect your privacy. No spam ever!
            </p>
        </div>
          <div class="container">
          	<div class="columns is-multiline" id="colum" style="padding-left: 1rem;">
            	<div class="column first is-one-third">
              	<h5 id="about" style="padding-left: 12px;">About us</h5>
              	<div class="content" style="color: white; padding-top: 21px;font-size: 15px; text-align: justify;padding-left: 12px;" id= "content">
              	  We at D'TouchExpertsLaundry thrive because of our long-term game changer and actionable synergy culture.
              	  Dynamically touching base about engineering low hanging fruit will make us leaders
              	  in the value-added best practice industry. We use our customer-focused
              	  standard setters to globally manage our stack expectations. We use our
              	  seamless platforms to strategically manage our brand expectations.
                </div>
            	</div> 
            	<div class="column first is-one-third">
              	<h5 id="social"> Social Media Handles </h5>
              		<div class="contents"  id="maintain">
                		<a href="#" target="_blank">
                  		<p>
                    		<span class="icon">
                      		<i class="mdi mdi-facebook-box"></i>
                    		</span>
                    	facebook
                  	</p>
                	</a>
                <a href="facebook.com/dtouchexperts.com" target="_blank">
                  <p>
                    <span class="icon">
                      <i class="mdi mdi-twitter"></i>
                    </span>
                    twitter
                  </p>
                </a>
                <a href="#" target="_blank">
                  <p>
                    <span class="icon">
                    <i class="mdi mdi-google-plus"></i>
                    </span>
                    google+
                  </p>
                </a>
                <a href="#" target="_blank">
                  <p>
                    <span class="icon">
                      <i class="mdi mdi-instagram"></i>
                    </span>
                    instagram
                  </p>
                </a>
              </div>
            </div>
            <div class="column first is-one-third">
              <h5 id="dtouch">
                D'touchExperts
              </h5>
              <!-- <div class="content" style="padding-top: 45px" id="footerLast"> -->
              <div class="contents"  style="padding-top: 10px">
                <p id="mail">
                  <span class="icon">
                    <i class="mdi mdi-home"></i>
                  </span>
                  20, Kayode Street,Ejigbo Lagos Nigeria.
                </p>
                <p id="mail">
                  <span class="icon">
                    <i class="mdi mdi-phone"></i>
                  </span>
                  +2348168131014
                </p>
                <p id="mail">
                  <span class="icon">
                    <i class="mdi mdi-email"></i>
                  </span>
                  dtouchexpertslaundry@gmail.com
                </p>
              </div>
            </div>
          </div>
        </div>
        <div class =" columns copyright" id="copyright">
          <div class="column is-12">
            © 2019 D`TouchExpertsLaundry . All rights reserved | Design by Anyadike Promise.
          </div>
        </div>   
      </div>
    </section>
  </div>
</template>

<script>
export default {
	
}
</script>

<style>
/*
css code for footer*/
	#social {
    display: flex;
    justify-content: center;
	}
	#dtouch {
    display: flex;
    justify-content: center;
	}
	#footerLast{
		padding-top: 45px;
		padding-left: 4px;
	}
	.field.has-addons {
    padding-top: 45px;
    justify-content: center;
    }
	.footer {
    background: black;
	}	
	.button {
  	background-color:dodgerblue;
  	border-color: transparent;
  	color: #fff;
	}
 	.icon {  
    color: dodgerblue;
	}	
	#respect {
  	color:white;
  	font-size: 15px;
  	padding: 3em;
  	border-bottom: 1px solid dodgerblue;
  	text-align: center;
  }
  .contents p {
    color: white;
  }
	.footer .copyright .column {
  	text-transform: capitalize;
  	text-align: center;
  	color: white;
	}
	h5 {
		color: white;
	}
	a p {
 		padding-top: 1em;
	}	
	.wrapper {
  	padding-top: 28px;
	}
#mail {
  display: flex;
  justify-content: center;
  padding: 10px;
}
#maintain {
  display: flex;
  flex-direction: column;
  align-items: center;
  padding-top: 5px;

}
</style>

