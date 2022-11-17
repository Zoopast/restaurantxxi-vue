<script setup lang='ts'>
 import { ref } from 'vue';
 import { useI18n } from 'vue-i18n';
 import AddMenuModal from '../components/menus/addMenuModal.vue';
 import ShowMenuModal from '../components/menus/showMenuModal.vue';
 import EditMenuModal from '../components/menus/editMenuModal.vue';
 import { csrfToken } from '@rails/ujs';
 import axios from 'axios';
 const { t } = useI18n({});

 defineProps({
   menus: {
     type: Array,
     default: () => [],
   },
 });

 const isOpen = ref(false);
 const edit = ref(false);
 const show = ref(false);
 const menu = ref({
    menu: {
      name: '',
      description: '',
      default: false
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


 async function showMenu(menu_id : string) {
  try{
    const response = await axios.get(`/menus/${menu_id}`);
    menu.value = response.data;
    setShow();
  }catch(e){
    console.log(e);
  }
 }

 async function editMenu(menu_id : string){
  await axios.get('/menus/' + menu_id)
    .then((response) => {
      menu.value = response.data;
      edit.value = true;
    })
    .catch((err) => {
      console.log(err);
    });
 }

 async function deleteMenu(menu_id : string){
  await axios.delete('/menus/' + menu_id, {
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
    <h1 class="text-4xl font-bold">{{t('menus.title')}}</h1>
    <button
      class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg"
      @click="setIsOpen"
    >
      {{t('menus.actions.add')}}
    </button>
  </div>
  <AddMenuModal
    :open="isOpen"
    @close="setIsOpen"
  />
  <EditMenuModal
    :open="edit"
    @close="setEdit"
    :menu="menu.menu"
  />

  <ShowMenuModal
    :open="show"
    @close="setShow"
    :menu="menu.menu"
  />
  <div id="menus" class="min-w-full">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
        <div class="overflow-hidden">
          <table class="min-w-full">
            <thead class="border-b">
              <tr>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  ID
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  Nombre
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  Menú por defecto
                </th>
                <th scope="col" class="px-6 py-4 text-sm font-medium text-left text-gray-900">
                  Acciones
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="menu in menus"
                :key="menu.id"
                class="border-b"
              >
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ menu.id }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ menu.name }}
                </td>
                <td class="px-6 py-4 text-sm font-light text-gray-900 whitespace-nowrap">
                  {{ menu.default_menu ? t('actions.yes') : t('actions.no') }}
                </td>
                <td>
                  <button
                    @click="showMenu(menu.id)"
                    class="m-2"
                  >{{t('menus.actions.show')}}</button>
                  <button
                    @click="editMenu(menu.id)"
                    class="m-2"
                  >{{t('menus.actions.edit')}}</button>
                  <button
                    @click="deleteMenu(menu.id)"
                    class="m-2 text-red-600"
                  >{{t('menus.actions.delete')}}</button>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</template>
