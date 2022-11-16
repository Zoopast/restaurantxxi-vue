<script setup lang='ts'>
 import { ref } from 'vue';
 import { useI18n } from 'vue-i18n';
 import AddMenuModal from '../components/menus/addMenuModal.vue';
 import showMenuModal from '../components/menus/showMenuModal.vue';
 const { t } = useI18n({});

 defineProps({
   menus: {
     type: Array,
     default: () => [],
   },
 });

 const isOpen = ref(false);

 function setIsOpen() {
    isOpen.value = !isOpen.value
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
                    class="m-2"
                  >{{t('menus.actions.show')}}</button>
                  <button
                    class="m-2"
                  >{{t('menus.actions.edit')}}</button>
                  <button
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
