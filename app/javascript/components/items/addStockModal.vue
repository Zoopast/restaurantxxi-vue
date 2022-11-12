<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import Select from '../select.vue';
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';

  defineProps({
    items: {
      type: Array,
      default: () => []
    },
  })

  const isOpen = ref(true);


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
          {{$t('items.add.title')}}
    </template>

  </Modal>
</template>
