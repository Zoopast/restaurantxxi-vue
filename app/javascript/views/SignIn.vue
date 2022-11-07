<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  import SignInForm from '../components/sessions/SignInForm.vue';

  const { t } = useI18n({});


</script>

<template>
  <div>
    <SignInForm/>
  </div>
</template>
