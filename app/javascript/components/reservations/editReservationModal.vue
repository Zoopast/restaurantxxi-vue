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
    reservation: {
      type: Object,
      required: true
    },
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
  const selectedClient = ref(findSelectedClient());
  const selectedTable = ref(null);
  const statuses = reactive([
    {value: 'active', label: t('reservations.statuses.active')},
    {value: 'finished', label: t('reservations.statuses.finished')},
    {value: 'cancelled', label: t('reservations.statuses.cancelled')},
    {value: 'filed', label: t('reservations.statuses.filed')},
    {value: 'scheduled', label: t('reservations.statuses.scheduled')},
  ]);
  const selectedStatus = ref(statuses[0]);

  function findSelectedClient(){
    return props.clients.find(client => client === props.reservation.client_id);
  }

  function setIsOpen()
  {
    isOpen.value = !isOpen.value;
  }

  function formatDate(date : string)
  {
    return date.split('Z')[0];
  }
</script>

<template>
    <Modal
      :open="isOpen"
      @close="setIsOpen"
    >
      <template #title>
        {{t('reservations.edit.title')}}
      </template>
      <template #content>
        <Form
          action="/reservations/update_reservation"
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
            :value="reservation.number_of_people"
            :label="$t('reservations.new.number_of_people')"
            :placeholder="$t('reservations.new.placeholder.number_of_people')"
          />
          <TextInput
            name="reservation[reservation_datetime]"
            type="datetime-local"
            :value="formatDate(reservation.reservation_datetime)"
            :label="$t('reservations.new.reservation_datetime')"
          />
          <Select
            v-model="selectedStatus"
            :options="statuses"
            :label="$t('reservations.new.status')"
          />
          <input
            type="hidden"
            name="id"
            :value="reservation.id"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-gray-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('reservations.edit.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>