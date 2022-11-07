<template>
  <div class=" bg-blue-400">
    {{ hello }}
  </div>
</template>
<script setup lang="ts">

  defineProps({
    hello: {
      type: String,
      required: true
    }
  });
</script>
