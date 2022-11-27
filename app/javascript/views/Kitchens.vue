<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  import ActiveOrders from '../components/kitchens/activeOrders.vue';
  const { t } = useI18n({});

  defineProps({
    orders: {
      type: Array,
      default: () => []
    },
    activeOrders: {
      type: Array,
      default: () => []
    },
  });
</script>

<template>
  <div
    class="flex flex-col justify-center items-center"
  >
    <ActiveOrders
      :orders="activeOrders"
    />
  </div>
</template>
