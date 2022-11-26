<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';

  const { t } = useI18n({});

  defineProps({
    orders: {
      type: Array,
      default: () => []
    },
  });
</script>

<template>
  <div
    class="flex flex-col justify-center items-center"
  >
      <div
        class="text-2xl font-bold"
      >
        {{t('kitchens.orders.active_orders.title')}}
      </div>
    <div
      class="border-2 rounded"
      v-for="order in orders"
    >

    </div>
  </div>
</template>
