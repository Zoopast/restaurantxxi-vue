<script setup lang="ts">
  import { useI18n } from 'vue-i18n';
  import {
    Dialog,
    DialogPanel,
    DialogTitle,
    DialogDescription,
  } from '@headlessui/vue'
  import { ref } from 'vue'

  const isOpen = ref(true)

  function setIsOpen(value : boolean) {
    isOpen.value = value
  }

  const { t } = useI18n({});
</script>
<template lang="">
  <div class="bg-red-200">
    {{$t('recipes.title')}}
    <Dialog :open="isOpen" @close="setIsOpen" class="relative z-50">
    <!-- The backdrop, rendered as a fixed sibling to the panel container -->
    <div class="fixed inset-0 bg-black/30" aria-hidden="true" />

    <!-- Full-screen container to center the panel -->
    <div class="fixed inset-0 flex items-center justify-center p-4">
      <!-- The actual dialog panel -->
      <DialogPanel class="w-full max-w-sm rounded bg-white">
        <DialogTitle>Complete your order</DialogTitle>

        <!-- ... -->
      </DialogPanel>
    </div>
  </Dialog>
  <button @click="setIsOpen(true)">Open Dialog</button>
  </div>
</template>