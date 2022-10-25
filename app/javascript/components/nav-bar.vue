<script setup lang="ts">
  import { useI18n } from 'vue-i18n';
  const { t } = useI18n({});

</script>
<template lang="">
  <div class=" h-12 flex flex-row items-center justify-between text-gray-500 bg-gray-100 hover:text-gray-700 focus:text-gray-700">
    <div>
      <a href="/">RestaurantXXI</a>
    </div>
    <div class="">
      <a href="/" class="p-2 nav-item">{{t('inventory.title')}}</a>
      <a href="/" class="p-2 nav-item">{{t('menu.title')}}</a>
      <a href="/recipes" class="p-2 nav-item">{{t('recipes.title')}}</a>
      <a href="/" class="p-2 nav-item">{{t('tables.title')}}</a>
      <a href="/" class="p-2 nav-item">{{t('clients.title')}}</a>
      <a href="/" class="p-2 nav-item">{{t('reservations.title')}}</a>
      <a href="/" class="p-2 nav-item">{{t('finances.title')}}</a>
    </div>
    <div class="flex flex-row gap-2">
      <a>{{t('user.title')}}</a>
      <a>{{t('session.signin')}}</a>
      <a>{{t('session.signup')}}</a>
      <a>{{t('session.signout')}}</a>
    </div>
  </div>
</template>