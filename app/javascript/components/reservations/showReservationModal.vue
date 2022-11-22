<script setup lang='ts'>
  import { ref, reactive, watch } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  import { formatDate, formatTime } from '../../utils/timezones';

  const props = defineProps({
    reservation: {
      type: Object,
      default: () => {},
    },
  });


  const { t } = useI18n({});
  const isOpen = ref(false);
  const client = ref({
    id: 0,
    full_name: '',
    email: '',
  });
  const table = ref({
    id: 0,
    table_number: 0,
    seats: 0,
  })
  function setIsOpen()
  {
    isOpen.value = !isOpen.value;
  }

  async function findClient(client_id : number)
  {
    await axios.get(`/customers/${client_id}`).then((response) => {
      client.value = response.data.client;
    }).catch((e) => {
      console.log(e);
    });
  }

  async function findTable(table_id : number){
    await axios.get('/tables/' + table_id).then((response) => {
      table.value = response.data.table;
    }).catch((e) => {
      console.log(e);
    });
  }

  watch(() => props.reservation, (newVal) => {
    findClient(newVal.client_id);
    findTable(newVal.table_id);
  })
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
          <div
            class="italic"
          >
            {{t('reservation.title')}}
            {{ reservation.id }}
          </div>
        </div>
      </template>
      <template #content>
        <div class="flex flex-col p-2">
          <span class="italic underline">{{t('reservation.information.title')}}</span>
          <span>{{t('reservation.information.date')}}: {{formatDate({date: reservation['reservation_datetime']})}}</span>
          <span>{{t('reservation.information.time')}}: {{formatTime({date: reservation['reservation_datetime']})}}</span>
          <span>{{t('reservation.information.number_of_people')}}: {{reservation.number_of_people}}</span>
          <span>{{t('reservation.information.status')}}: {{reservation.status}}</span>
        </div>
        <div class="grid grid-cols-2 p-2">
          <div class="flex flex-col">
            <span class="italic underline">{{t('reservation.table.title')}}</span>
            <span>{{t('reservation.table.number')}}: {{table.table_number}}</span>
          </div>
          <div class="flex flex-col">
            <span class="italic underline">{{t('reservation.client.title')}}</span>
            <span>{{t('reservation.client.full_name')}}: {{client.full_name}}</span>
          </div>
        </div>
      </template>
    </Modal>
</template>