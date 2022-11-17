<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../../components/toggle.vue';


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
        {{t('tables.new.title')}}
      </template>
      <template #content>
        <Form
          action="/tables"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="table[table_number]"
            type="number"
            :label="$t('tables.new.table_number')"
            :placeholder="$t('tables.new.placeholder.table_number')"
          />
          <TextInput
            name="table[seats]"
            type="number"
            :label="$t('tables.new.seats')"
            :placeholder="$t('tables.new.placeholder.seats')"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-green-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('tables.new.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>
