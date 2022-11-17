<script setup lang='ts'>
  import { ref } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Form } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';


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
        {{t('tables.edit.title')}}
      </template>
      <template #content>
        <Form
          action="/tables/update_table"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="table[table_number]"
            type="number"
            :value="table.table_number"
            :label="$t('tables.new.table_number')"
            :placeholder="$t('tables.new.placeholder.table_number')"
          />
          <TextInput
            name="table[seats]"
            type="number"
            :value="table.seats"
            :label="$t('tables.new.seats')"
            :placeholder="$t('tables.new.placeholder.seats')"
          />
          <input
            type="hidden"
            name="table[id]"
            :value="table.id"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-gray-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('tables.edit.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>