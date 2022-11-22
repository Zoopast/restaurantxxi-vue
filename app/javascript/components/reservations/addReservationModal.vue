<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../toggle.vue';
  import Select from '../select.vue';

  const props = defineProps({
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
  const selectedClient = ref(props.clients[0]);
  const selectedTable = ref(props.tables[0]);
  const statuses = reactive([
    {value: 'active', label: t('reservations.statuses.active')},
    {value: 'finished', label: t('reservations.statuses.finished')},
    {value: 'cancelled', label: t('reservations.statuses.cancelled')},
    {value: 'filed', label: t('reservations.statuses.filed')},
    {value: 'scheduled', label: t('reservations.statuses.scheduled')},
  ]);
  const selectedStatus = ref(statuses[0]);

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
            v-model="selectedTable"
            :options="tables"
            :label="$t('reservations.new.table')"
          />
          <Select
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
          <Select
            v-model="selectedStatus"
            :options="statuses"
            :label="$t('reservations.new.status')"
          />
          <input
            type="hidden"
            name="reservation[status]"
            :value="selectedStatus?.value"
          />
          <input
            type="hidden"
            name="reservation[client_id]"
            :value="selectedClient?.value"
          />
          <input
            type="hidden"
            name="reservation[table_id]"
            :value="selectedTable?.value"
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
