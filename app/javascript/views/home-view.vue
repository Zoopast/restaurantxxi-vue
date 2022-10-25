<script setup lang="ts">
  import { useI18n } from 'vue-i18n';
  import { ref } from 'vue'
  import {
    Listbox,
    ListboxButton,
    ListboxOptions,
    ListboxOption,
  } from '@headlessui/vue'
  const { t } = useI18n({});

  const people = [
    { id: 1, name: 'Durward Reynolds', unavailable: false },
    { id: 2, name: 'Kenton Towne', unavailable: false },
    { id: 3, name: 'Therese Wunsch', unavailable: false },
    { id: 4, name: 'Benedict Kessler', unavailable: true },
    { id: 5, name: 'Katelyn Rohan', unavailable: false },
  ]
  const selectedPerson = ref(people[0])
</script>
<template>
  <div>
    {{ t('home.title') }}
  </div>
</template>