<template lang="">
  <div class="bg-red-200">
    {{$t('recipes.title')}}
  </div>
</template>
<script setup lang="ts">
  import { useI18n } from 'vue-i18n';

  const { t } = useI18n({});
</script>
<style lang="">

</style>