<script setup lang="ts">
import { csrfToken } from '@rails/ujs';

  const token = csrfToken();

</script>
<template lang="">
  <input
    type="hidden"
    name="authenticity_token"
    :value="token"
  >
</template>