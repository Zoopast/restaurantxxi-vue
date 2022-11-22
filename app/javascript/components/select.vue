<script setup lang="ts">
  import { ref } from 'vue';
  import {
    Listbox,
    ListboxButton,
    ListboxOptions,
    ListboxOption,
    ListboxLabel,
  } from '@headlessui/vue'

  defineProps({
    model: {
      type: Object,
    },
    options: {
      type: Array,
      default: () => [],
    },
    label: {
      type: String,
      default: '',
    },
    name: {
      type: String,
      default: '',
    },
  })
  const selectedOption = ref(null)

</script>

<template>
  <div class="w-72 m-2">
    <Listbox
      :name="name"
      :defaultValue="options[0]"
    >
      <ListboxLabel>
        {{ label }}
      </ListboxLabel>
      <ListboxButton
        v-slot="{value}"
        class="relative w-full cursor-default rounded-lg bg-white py-2 pl-3 pr-10 text-left shadow-md border"
      >
        {{ value['label'] }}
      </ListboxButton>
      <ListboxOptions>
        <ListboxOption
          v-for="option, idx in options"
          :key="idx"
          :value="option"
        >
          {{ option['label'] }}
        </ListboxOption>
      </ListboxOptions>
  </Listbox>
  </div>
</template>