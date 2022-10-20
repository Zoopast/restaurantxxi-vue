<template>
  <div class=" bg-blue-400">
    {{ this.hello }}
  </div>
</template>
<script lang="ts">
export default {
  props: {
    hello: {
      type: String,
      default: ''
    }
  }
}
</script>
<style lang="">

</style>