<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import { useI18n } from 'vue-i18n';
  import {
    Dialog,
    DialogPanel,
    DialogTitle,
    DialogDescription,
  } from '@headlessui/vue'

  const recipe = reactive({
    name: '',
    description: '',
    kitchen_id: 1,
    menu_id: 1
  });

  const props = defineProps({
    menus: {
      type: Array,
      default: () => []
    },
    kitchens: {
      type: Array,
      default: () => []
    },
  })

  const submited = ref(false);
  const submitHandler = async () => {
    await new Promise((r) => setTimeout(r, 1000));
    submited.value = true;
  }

  const isOpen = ref(false)

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
        <DialogTitle>{{$t('recipes.new.title')}}</DialogTitle>


        <FormKit
          type="form"
          id="recipes"
          :form-class="submited ? 'hide' : 'show'"
          submit-label="Agregar"
          action="/recipes"
          method="post"
        >
          <FormKit
            type="text"
            name="recipe[name]"
            :label="$t('recipes.new.name')"
          />
          <FormKit
            type="select"
            name="recipe[menu_id]"
            :label="$t('menu.title')"
            :options="props.menus"
            />
          <FormKit
            type="select"
            name="recipe[kitchen_id]"
            :label="$t('kitchens.title')"
            :options="props.kitchens"
            />
      </FormKit>
      </DialogPanel>
    </div>
  </Dialog>
  <button @click="setIsOpen(true)">{{$t('recipes.new.title')}}</button>
  </div>
</template>