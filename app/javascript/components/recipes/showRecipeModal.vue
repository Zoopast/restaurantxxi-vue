<script setup lang="ts">
  import Modal from "../modal.vue";

  defineProps({
    recipe: {
      type: Object,
      default: () => {},
    },
  })

</script>
<template>
  <Modal>
    <template #title>
      {{ recipe.recipe.name }}
    </template>
    <template #content>
      {{ recipe.recipe.description }}

      <button>asdjkas</button>
    </template>
  </Modal>
</template>
