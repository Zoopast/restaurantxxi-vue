<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import Select from '../select.vue';
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';

  defineProps({
    kitchens: {
      type: Array,
      default: () => []
    },
    inventories: {
      type: Array,
      default: () => []
    },
  });

  const isOpen = ref(true);
  const selectedInventory = ref(null);
  const selectedKitchen = ref(null);
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
        {{$t('items.new.title')}}
  </template>
  <template #content>
    <Form
      action="/items"
      method="POST"
    >
      <csrfInput />
      <TextInput
        name="item[name]"
        type="text"
        v-bind:label="$t('items.new.name')"
        :placeholder="$t('items.new.placeholder.name')"
      />
      <TextInput
        name="item[price]"
        type="number"
        v-bind:label="$t('items.new.price')"
        :placeholder="$t('items.new.placeholder.price')"
      />
      <TextInput
        name="item[stock]"
        type="number"
        v-bind:label="$t('items.new.stock')"
        :placeholder="$t('items.new.placeholder.stock')"
      />
      <div class="flex flex-row m-2">
        <Select
          name="item[inventory_id]"
          v-model="selectedInventory"
          :options="inventories"
          :label="$t('inventory.title')"
        />
        <Select
          name="item[kitchen_id]"
          v-model="selectedKitchen"
          :options="kitchens"
          :label="$t('kitchens.title')"
        />
      </div>
      <button
        type="submit"
        class="bg-green-600 text-light-300 rounded-sm p-4 m-2 flex mx-auto w-40"
      >
        {{$t('buttons.add')}}
      </button>
    </Form>
  </template>

  </Modal>
</template>
