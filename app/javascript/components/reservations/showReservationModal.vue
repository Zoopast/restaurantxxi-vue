<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';

  defineProps({
    reservation: {
      type: Object,
      default: () => {},
    },
  });


  const { t } = useI18n({});
  const isOpen = ref(false);

  function setIsOpen()
  {
    isOpen.value = !isOpen.value;
  }
</script>
<template>
  <Modal
    :open="isOpen"
    @close="setIsOpen"
  >
      <template #title>
        <div
          class="flex flex-col"
        >
          {{reservation.id}}
        </div>
      </template>
      <template #content>
        <div
          class="flex flex-col"
        >
          <span>{{reservation.client_id}}</span>
          <span>{{reservation.table_id}}</span>
          <span>{{reservation.number_of_people}}</span>
          <span>{{reservation.reservation_datetime}}</span>
        </div>
      </template>
    </Modal>
</template>