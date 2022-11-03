<script setup lang="ts">
  import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'

  defineProps({
    options: {
      type: Array,
      defualt: () => [],
    },
  })
</script>
<template>
  <Menu>
    <MenuButton>
      <slot name="title" />
    </MenuButton>
    <MenuItems
      v-for="option, idx in options"
      :key="idx"
    >
      {{ option }}
    </MenuItems>
  </Menu>
</template>