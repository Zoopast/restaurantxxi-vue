<script setup lang='ts'>
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import AddReservationModal from '../components/reservations/addReservationModal.vue';
  import ShowReservationModal from '../components/reservations/showReservationModal.vue';
  import EditReservationModal from '../components/reservations/editReservationModal.vue';
  import { formatDate, formatTime } from '../utils/timezones';
  import { csrfToken } from '@rails/ujs';
  import axios from 'axios';

  const { t } = useI18n({});
  const props = defineProps({
    reservations: {
      type: Array,
      default: () => [],
    },
    tables: {
      type: Array,
      default: () => [],
    },
    clients: {
      type: Array,
      default: () => [],
    },
  });

  const isOpen = ref(false);
  const edit = ref(false);
  const show = ref(false);

  const reservation = ref({
    reservation: {
      table_id: 0,
      client_id: 0,
      reservation_datetime: new Date(),
      status: 1,
    }
  })

  function setIsOpen() {
    isOpen.value = !isOpen.value
  }

  function setShow() {
   show.value = !show.value;
  }

  function setEdit() {
    edit.value = !edit.value;
  }

  async function showReservation(reservation_id : string) {
  try{
    const response = await axios.get(`/reservations/${reservation_id}`);
    reservation.value = response.data;
    setShow();
  }catch(e){
    console.log(e);
  }
 }

 async function editReservation(reservation_id : string){
  await axios.get('/reservations/' + reservation_id)
    .then((response) => {
      reservation.value = response.data;
      edit.value = true;
    })
    .catch((err) => {
      console.log(err);
    });
 }

 async function deleteReservation(reservation_id : string){
  await axios.delete('/reservations/' + reservation_id, {
    headers: {
        'X-CSRF-Token': csrfToken(),
      },
  }).then((response) => {
    window.location.reload();
  }).catch((error) => {
    console.log(error);
    window.location.reload();
  });
 }

 function formatDatetimes(datetime : any){
  return formatDate({date: datetime}) + ' ' + formatTime({date: datetime});
 }
</script>
<template>
  <div class="flex flex-col items-center justify-center">
      <h1 class="text-4xl font-bold">{{t('reservations.title')}}</h1>
      <button
        class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg"
        @click="setIsOpen"
      >
        {{t('reservations.actions.add')}}
      </button>
  </div>
  <AddReservationModal
    :open="isOpen"
    @close="setIsOpen"
    :clients="clients"
    :tables="tables"
  />
  <ShowReservationModal
    :open="show"
    @close="setShow"
    :reservation="reservation.reservation"
  />
  <EditReservationModal
    :open="edit"
    @close="setEdit"
    :clients="clients"
    :tables="tables"
    :reservation="reservation.reservation"
  />
  <div id="tables" class="min-w-full">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
        <div class="overflow-hidden">
          <table class="min-w-full">
            <thead class="border-b">
              <tr>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('reservations.id')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('reservations.reservation_datetime')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('reservations.client')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('reservations.status')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('actions.title')}}
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="reservation in reservations"
                :key="reservation['id']"
                class="border-b"
              >
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ reservation['id'] }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ formatDatetimes(reservation['reservation_datetime']) }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ reservation['client_id'] }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ t('reservations.statuses.' + reservation['status']) }}
                </td>
                <td>
                  <button
                    @click="showReservation(reservation['id'])"
                    class="m-2"
                  >{{t('reservations.actions.show')}}</button>
                  <button
                    @click="editReservation(reservation['id'])"
                    class="m-2"
                  >{{t('reservations.actions.edit')}}</button>
                  <button
                    @click="deleteReservation(reservation['id'])"
                    class="m-2 text-red-600"
                  >{{t('reservations.actions.delete')}}</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
