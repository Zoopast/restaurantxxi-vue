<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import {
    Dialog,
    DialogPanel,
    DialogTitle,
    DialogDescription,
  } from '@headlessui/vue';

  const isOpen = ref(false);

  function setIsOpen()
  {
    isOpen.value = !isOpen.value;
  }
</script>
<template>
  <Dialog
    :open="isOpen"
    @close="setIsOpen"
    class="relative z-50">
    <div class="fixed inset-0 bg-black/30" aria-hidden="true" />
      <div class="fixed inset-0 overflow-y-auto">
        <div class="flex min-h-full items-center justify-center p-4">
        <DialogPanel class="w-full max-w-1/2 rounded bg-white">
          <DialogTitle>
            <slot name="title" />
          </DialogTitle>
          <slot name="content" />
        </DialogPanel>
      </div>
    </div>
  </Dialog>
</template>