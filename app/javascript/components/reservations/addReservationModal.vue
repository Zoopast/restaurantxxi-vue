<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../toggle.vue';
  import Select from '../select.vue';

  defineProps({
    clients: {
      type: Array,
      required: true
    },
    tables: {
      type: Array,
      required: true
    },
  });

  const { t } = useI18n({});
  const isOpen = ref(false);
  const selectedClient = ref(null);
  const selectedTable = ref(null);

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
          action="/reservations"
          method="POST"
        >
          <csrfInput />
          <Select
            name="reservation[table_id]"
            v-model="selectedTable"
            :options="tables"
            :label="$t('reservations.new.table')"
          />
          <Select
            name="reservation[client_id]"
            v-model="selectedClient"
            :options="clients"
            :label="$t('reservations.new.client')"
          />
          <TextInput
            name="reservation[number_of_people]"
            type="number"
            :label="$t('reservations.new.number_of_people')"
            :placeholder="$t('reservations.new.placeholder.number_of_people')"
          />
          <TextInput
            name="reservation[reservation_datetime]"
            type="datetime-local"
            :label="$t('reservations.new.reservation_datetime')"
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
