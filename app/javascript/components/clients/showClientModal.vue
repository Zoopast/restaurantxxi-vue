<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../../components/toggle.vue';

  defineProps({
    client: {
      type: Object,
      required: true
    }
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
        <div class="flex flex-col">
          <span>{{client.full_name}}</span>
          <span>{{client.email}}</span>
        </div>
      </template>
      <template #content>
      </template>
    </Modal>
</template>