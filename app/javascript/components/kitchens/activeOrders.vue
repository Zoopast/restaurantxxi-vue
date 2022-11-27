<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  import { useCurrentTime } from "../../composables/useCurrentTime";
  import axios from 'axios';
  const { t } = useI18n({});

  const props = defineProps({
    orders: {
      type: Array,
      default: () => []
    },
  });

  function getMinutes(updated_at){
    const currentTime = new Date().getTime();
    const updatedAt = new Date(updated_at).getTime();

    return Math.floor((currentTime - updatedAt) / 1000 / 60);
  }

  async function markOrderAsReady(product_id){
    await axios.patch(`/api/v1/products/${product_id}`, {
      product: {
        status: 'ready'
      }
    }).then((response) => {
      window.location.reload();
    }).catch((error) => {
      console.log(error);
    });
  }

</script>

<template>
  <div>
    <span
      class="text-2xl font-bold"
    >{{t('kitchens.orders.active_orders.title')}}</span>
    <div>
      <div
        v-for="order, idx in orders"
        :key="order['id']"
        class="grid grid-cols-3 gap-4"
      >
        <div
          class="flex flex-col"
        >
          <span
            class="font-bold"
          >
            {{t('kitchens.orders.active_orders.order_number')}}
          </span>
          <p>{{idx + 1}}</p>
        </div>
        <div class="flex flex-col">
          <span
            class="font-bold"
          >
            {{t('kitchens.orders.active_orders.time_passed')}}
          </span>
          <p class="">{{ getMinutes(order['updated_at']) }} {{t('time.minutes')}}</p>
        </div>
        <div class="flex flex-col">
          <span
            class="font-bold"
          >
            {{t('kitchens.orders.active_orders.finish')}}
          </span>
          <button
            @click="markOrderAsReady(order['id'])"
            class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
          >
            {{t('kitchens.orders.active_orders.ready')}}
          </button>
        </div>
    </div>
    </div>

  </div>
</template>
