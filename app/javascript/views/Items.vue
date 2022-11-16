<script setup lang="ts">
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  import NewItemModal from '../components/items/newItemModal.vue';
  import ShowItemModal from '../components/items/showItemModal.vue';
  import AddStockModal from '../components/items/addStockModal.vue';
  const { t } = useI18n({});


  const show = ref(false);
  const submitted = ref(false);
  const isOpen = ref(false);
  const addItems = ref(false);

  defineProps({
    items: {
      type: Array,
      required: true
    },
    kitchens: {
      type: Array,
      required: true
    },
    inventories: {
      type: Array,
      required: true
    },
  })

  const item = ref({
    name: '',
    stock: 0,
  });

  function setIsOpen() {
    isOpen.value = !isOpen.value
  }

  function setAddItems() {
    addItems.value = !addItems.value
  }

  async function showItem(item_id : string) {
    const response = await axios.get('/recipes/' + item_id)
      .then(function (response) {
        item.value = response.data;
        show.value = true;
      })
      .catch(function (error) {
        console.log(error);
        return error
      });
  }
</script>
<template>

  <div class="flex flex-col items-center justify-center">
    <h1 class="text-4xl font-bold">{{t('items.title')}}</h1>
    <button @click="setIsOpen" class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg">{{$t('items.new.title')}}</button>
    <button @click="setAddItems" class="block px-5 py-3 m-2 font-medium text-white bg-blue-500 rounded-lg">{{$t('items.add.button')}}</button>
  </div>
<div class="flex flex-col">

<div class="flex items-center justify-between">
  <h1 class="text-4xl font-bold">{{t('items.title')}}</h1>
</div>

<NewItemModal
  :open="isOpen"
  @close="setIsOpen"
  :kitchens="kitchens"
  :inventories="inventories"
/>

<AddStockModal
  :open="addItems"
  @close="setAddItems"
  :items="items"
/>

<div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
  <div class="inline-block min-w-full py-2 sm:px-6 lg:px-8">
    <div class="overflow-hidden">
      <table class="min-w-full dark:text-white">
        <thead class="border-b dark:text-white">
          <tr>
            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left dark:text-white">
              {{t('items.name')}}
            </th>
            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left dark:text-white">
              {{t('items.stock')}}
            </th>
            <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left dark:text-white">
              {{t('actions.title')}}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr
            v-for="item in items"
            :key="item.id"
            class="border-b"
          >
            <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
              <span>{{item.name}}</span>
            </td>
            <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
              <span>{{item.stock}}</span>
            </td>
            <td class="flex flex-row gap-2">
              <button
                @click="showItem(item.id)"
              >
                {{$t('items.show.button')}}
              </button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</div>
</div>
</template>