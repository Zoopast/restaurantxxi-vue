<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import { useI18n } from 'vue-i18n';
  import {
    Dialog,
    DialogPanel,
    DialogTitle,
    DialogDescription,
  } from '@headlessui/vue'

  const ingredients = reactive([
    {name: '', quantity: '', unit: ''},
  ])

  const addRow = () => {
    ingredients.push({name: '', quantity: '', unit: ''});
  }

  const removeRow = (index: number) => {
    ingredients.splice(index, 1);
  }

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
  <div class="bg-red-300">
    {{$t('recipes.title')}}
    <Dialog :open="isOpen" @close="setIsOpen" class="relative z-50">
    <!-- The backdrop, rendered as a fixed sibling to the panel container -->
    <div class="fixed inset-0 bg-black/30" aria-hidden="true" />

    <!-- Full-screen container to center the panel -->
    <div class="fixed inset-0 flex items-center justify-center p-4">
      <!-- The actual dialog panel -->
      <DialogPanel class="flex flex-col  items-center justify-center max-w-1/2 rounded bg-white">
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
            input-class="w-full h-10 px-3 text-base text-gray-700 placeholder-gray-400"
            :label="$t('recipes.new.name')"
          />
          <FormKit
            type="text"
            input-class="w-full h-10 px-3 text-base text-gray-700 placeholder-gray-400"
            name="recipe[description]"
            :label="$t('recipes.new.description')"
          />

          <span class=" font-bold">{{$t('recipes.new.ingredients.title')}}</span>

          <div v-for="item, index in ingredients" :key="item">
            <div class="flex flex-row">
              <FormKit
              type="text"
              name="recipe[ingredients][{{index}}][name]"
              :label="$t('recipes.new.ingredients.name')" />
              <FormKit
                type="number"
                name="recipe[ingredients][{{index}}][quantity]"
                :label="$t('recipes.new.ingredients.quantity')" />
              <FormKit
                type="text"
                name="recipe[ingredients][{{index}}][unit]"
                :label="$t('recipes.new.ingredients.unit')" />

              <button
                type="button"
                class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded"
                @click="removeRow(index)"
              >
                x
              </button>
              <button
                type="button"
                class="bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded"
                @click="addRow"
              > + </button>
            </div>
          </div>
          <FormKit
            type="textarea"
            name="recipe[preparation]"
            rows="10"
            :label="$t('recipes.new.preparation')"
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