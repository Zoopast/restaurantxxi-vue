<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  import SignUpForm from '../components/registrations/SignUpForm.vue';

  const { t } = useI18n({});


</script>

<template>
  <div>
    <SignUpForm/>
  </div>
</template>
