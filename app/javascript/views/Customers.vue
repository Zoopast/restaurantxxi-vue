<script setup lang='ts'>
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import AddClientModal from '../components/clients/addClientModal.vue';
  import ShowClientModal from '../components/clients/showClientModal.vue';
  import EditClientModal from '../components/clients/editClientModal.vue';
  import { csrfToken } from '@rails/ujs';
  import axios from 'axios';

  const { t } = useI18n({});
  defineProps({
    clients: {
      type: Array,
      default: () => [],
    },
  });

  const isOpen = ref(false);
  const edit = ref(false);
  const show = ref(false);
  const client = ref({
    client: {
      fullName: '',
      password: '',
      password_confirmation: '',
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


  async function showClient(client_id : string) {
    try{
      const response = await axios.get(`/customers/${client_id}`);
      client.value = response.data;
      setShow();
    }catch(e){
      console.log(e);
    }
  }

 async function editClient(client_id : string){
  await axios.get('/customers/' + client_id)
    .then((response) => {
      client.value = response.data;
      edit.value = true;
    })
    .catch((err) => {
      console.log(err);
    });
 }

 async function deleteClient(client_id : string){
  await axios.delete('/customers/' + client_id, {
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
    <h1 class="text-4xl font-bold">{{t('clients.title')}}</h1>
    <button
      class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg"
      @click="setIsOpen"
    >
      {{t('clients.actions.add')}}
    </button>
  </div>
  <AddClientModal
    :open="isOpen"
    @close="setIsOpen"
  />
  <EditClientModal
    :open="edit"
    @close="setEdit"
    :client="client.client"
  />
  <ShowClientModal
    :open="show"
    @close="setShow"
    :client="client.client"
  />
  <div id="tables" class="min-w-full">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
        <div class="overflow-hidden">
          <table class="min-w-full">
            <thead class="border-b">
              <tr>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('clients.full_name')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('clients.email')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('clients.last_visited')}}
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  {{t('actions.title')}}
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="client in clients"
                :key="client['id']"
                class="border-b "
              >
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{client['full_name']}}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{client['email']}}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{client['last_visited'] ?? t('clients.never_visited')}}
                </td>
                <td>
                  <button
                    @click="showClient(client['id'])"
                    class="m-2"
                  >{{t('clients.actions.show')}}</button>
                  <button
                    @click="editClient(client['id'])"
                    class="m-2"
                  >{{t('clients.actions.edit')}}</button>
                  <button
                    @click="deleteClient(client['id'])"
                    class="m-2 text-red-600"
                  >{{t('clients.actions.delete')}}</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
