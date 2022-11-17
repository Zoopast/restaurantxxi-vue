<script setup lang='ts'>
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import AddTableModal from '../components/tables/addTableModal.vue';
  import ShowTableModal from '../components/tables/showTableModal.vue';
  import EditTableModal from '../components/tables/editTableModal.vue';
  import { csrfToken } from '@rails/ujs';
  import axios from 'axios';

  const { t } = useI18n({});
  defineProps({
    tables: {
      type: Array,
      default: () => [],
    },
  });

  const isOpen = ref(false);
  const edit = ref(false);
  const show = ref(false);
  const table = ref({
    table: {
      table_number: 0,
      seats: 0,
    }
 });
  function setIsOpen() {
    isOpen.value = !isOpen.value
  }

  function setShow() {
   show.value = !show.value;
  }

  function setEdit() {
    edit.value = !edit.value;
  }

  async function showTable(table_id : string) {
  try{
    const response = await axios.get(`/tables/${table_id}`);
    table.value = response.data;
    setShow();
  }catch(e){
    console.log(e);
  }
 }

 async function editTable(table_id : string){
  await axios.get('/tables/' + table_id)
    .then((response) => {
      table.value = response.data;
      edit.value = true;
    })
    .catch((err) => {
      console.log(err);
    });
 }

 async function deleteTable(table_id : string){
  await axios.delete('/tables/' + table_id, {
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

</script>

<template>
  <div class="flex flex-col items-center justify-center">
    <h1 class="text-4xl font-bold">{{t('tables.title')}}</h1>
    <button
      class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg"
      @click="setIsOpen"
    >
      {{t('tables.actions.add')}}
    </button>
  </div>
  <AddTableModal
    :open="isOpen"
    @close="setIsOpen"
  />
  <div id="menus" class="min-w-full">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
        <div class="overflow-hidden">
          <table class="min-w-full">
            <thead class="border-b">
              <tr>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('tables.table_number')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('tables.seats_number')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('tables.reserved_at')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('actions.title')}}
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="table in tables"
                :key="table.id"
                class="border-b"
              >
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ table.table_number }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ table.seats }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ table.reserved_at }}
                </td>
                <td>
                  <button
                    @click="showTable(table.id)"
                    class="m-2"
                  >{{t('tables.actions.show')}}</button>
                  <button
                    @click="editTable(table.id)"
                    class="m-2"
                  >{{t('tables.actions.edit')}}</button>
                  <button
                    @click="deleteTable(table.id)"
                    class="m-2 text-red-600"
                  >{{t('tables.actions.delete')}}</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
