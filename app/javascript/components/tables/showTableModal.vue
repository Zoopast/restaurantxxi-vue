<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';

  defineProps({
    table: {
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
          <span>{{table.table_number}}</span>
          <span>{{table.seats}}</span>
        </div>
      </template>
    </Modal>
</template>
