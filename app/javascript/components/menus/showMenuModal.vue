<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';

  defineProps({
    menu: {
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
          <span>{{menu.name}}</span>
          <span
            class="italic font-weight-light"
          >
            {{menu.description}}
          </span>
        </div>

      </template>
      <template #content>
        {{menu.default_menu}}
      </template>
    </Modal>
</template>
