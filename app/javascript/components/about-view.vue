<template>
  <div class=" bg-blue-400">
    {{ props.hello }}
  </div>
</template>
<script setup lang="ts">

  const props = defineProps({
    hello: {
      type: String,
      required: true
    }
  });
</script>
<style lang="">

</style>