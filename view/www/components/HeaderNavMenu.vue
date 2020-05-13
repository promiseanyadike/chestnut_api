<template>
  <section>
    <b-dropdown hoverable aria-role="list">
      <div slot="trigger">
        <span>
            Services
				</span>
          <b-icon icon="menu-down"></b-icon>
      </div>
      <b-dropdown-item aria-role="listitem">suits</b-dropdown-item>
      <b-dropdown-item aria-role="listitem">Ankara</b-dropdown-item>
      <b-dropdown-item aria-role="listitem">Shirts</b-dropdown-item>
			<b-dropdown-item aria-role="listitem">jeans</b-dropdown-item>
			<b-dropdown-item aria-role="listitem">Others</b-dropdown-item>
    </b-dropdown>
	</section>
</template>

<style scoped>
    .tag {
        cursor: pointer;
    }
</style>

<script>
export default {

}
</script>

<style scoped>
section {
	text-transform: uppercase;
	letter-spacing: 1px;
	font-size: 95%;
	font-weight: bold;
}
</style>