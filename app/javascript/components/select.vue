<script setup lang="ts">
  import { ref } from 'vue'
  import {
    Listbox,
    ListboxButton,
    ListboxOptions,
    ListboxOption,
  } from '@headlessui/vue'

  defineProps({
    options: {
      type: Array,
      default: () => [],
    },
  })
  const selectedOption = ref(null)

</script>

<template>
  <div>
    <Listbox v-model="selectedOption">
    <ListboxButton
      class="relative w-full cursor-default rounded-lg bg-white py-2 pl-3 pr-10 text-left shadow-md focus:outline-none focus-visible:border-indigo-500 focus-visible:ring-2 focus-visible:ring-white focus-visible:ring-opacity-75 focus-visible:ring-offset-2 focus-visible:ring-offset-orange-300 sm:text-sm"
    >{{ selectedOption }}</ListboxButton>
    <ListboxOptions>
      <ListboxOption
        v-for="option, idx in options"
        :key="idx"
        :value="option"
      >
        {{ option }}
      </ListboxOption>
    </ListboxOptions>
  </Listbox>
  </div>
</template>