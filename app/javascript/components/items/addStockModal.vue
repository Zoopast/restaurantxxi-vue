<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import Select from '../select.vue';
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';

  const props = defineProps({
    items: {
      type: Array,
      default: () => []
    },
  })

  const isOpen = ref(true);
  const selectedInventory = ref(props.items);

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
          {{$t('items.add.title')}}
    </template>
    <template #content>
      <Form
        action="/items/add_stock"
        method="post"
      >
        <csrfInput />
        <div class="overflow-auto h-96">
          <div
            v-for="item, idx in selectedInventory"
            :key="item.id"
            class="flex flex-row justify-center items-center"
          >
            <span>{{item.name}} </span>
            <span>{{item.stock}} </span>
            <TextInput
              :name="`items[${idx}][stock]`"
              type="number"
              :value="0"
              v-bind:label="$t('items.add.stock')"
              :placeholder="$t('items.add.placeholder.stock')"
            />
            <input
              type="hidden"
              :id="`id_${idx}`"
              :name="`items[${idx}][id]`"
              :value="item.id"
            />
          </div>
          <button
          type="submit"
          class="bg-green-600 text-light-300 rounded-sm p-4 m-2 flex mx-auto w-40"
        >
          {{$t('items.add.button')}}
        </button>
        </div>
      </Form>
    </template>

  </Modal>
</template>
