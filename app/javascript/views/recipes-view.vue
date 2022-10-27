<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../components/TextInput.vue';
  import csrfInput from '../components/csrf-input.vue';
  import {
    Dialog,
    DialogPanel,
    DialogTitle,
    DialogDescription,
  } from '@headlessui/vue'

  const selectedMenu = ref(null);
  const selectedKitchen = ref(null);

  const ingredients = ref([
    {name: 'sadsadsad', quantity: 0, unit: ''},
  ]);


  const addRow = () => {
    ingredients.value.push({name: '', quantity: 0, unit: ''});
  }

  const removeRow = (index: number) => {
    ingredients.value.splice(index, 1);
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
    recipes: {
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
  <div class="">
    {{$t('recipes.title')}}
    <Dialog :open="isOpen" @close="setIsOpen" class="relative z-50">
    <!-- The backdrop, rendered as a fixed sibling to the panel container -->
    <div class="fixed inset-0 bg-black/30" aria-hidden="true" />

    <!-- Full-screen container to center the panel -->
    <div class="fixed inset-0 flex items-center justify-center p-4">
      <!-- The actual dialog panel -->
      <DialogPanel class="flex flex-col  items-center justify-center max-w-1/2 rounded bg-white">
        <DialogTitle>{{$t('recipes.new.title')}}</DialogTitle>

        <Form
          action="/recipes"
          method="POST"
        >
        <csrfInput />
        <TextInput
          name="recipe[name]"
          type="text"
          v-bind:label="$t('recipes.new.name')"
          placeholder="Name"
        />

        <TextInput
          name="recipe[description]"
          type="text"
          v-bind:label="$t('recipes.new.description')"
          placeholder="Description"
        />

          <fieldset
            class="InputGroup"
            v-for="(field, idx) in ingredients"
            :key="idx"
          >
            <legend>Recipe #{{ idx }}</legend>
            <label :for="`name_${idx}`">Name</label>
            <Field :id="`name_${idx}`" :name="`ingredients[${idx}].name`"/>
            <label :for="`quantity_${idx}`">Name</label>
            <Field :id="`quantity_${idx}`" :name="`ingredients[${idx}].quantity`"/>
            <label :for="`unit_${idx}`">Name</label>
            <Field :id="`unit_${idx}`" :name="`ingredients[${idx}].unit`"/>
            <button type="button" @click="addRow">Add</button>
            <button type="button" @click="removeRow(idx)">Remove</button>
          </fieldset>

          <label for="menu_id">Menú</label>
          <Field name="menu" as="select" v-model="selectedMenu">
            <option :value="null" disabled> Select a menu</option>
            <option v-for="menu in menus" :value="menu">{{ menu }}</option>
          </Field>
          <label for="kitchen_id">Cocina</label>
          <Field name="kitchen" as="select" v-model="selectedKitchen">
            <option :value="null" disabled> Select a kitchen</option>
            <option v-for="kitchen in kitchens" :value="kitchen">{{ kitchen }}</option>
          </Field>
          <input
            v-if="selectedMenu !== null"
            type="hidden"
            :value="selectedMenu"
            name="recipe[menu_id]"
          >
          <input
                  v-if="selectedKitchen !== null"
                  type="hidden"
                  :value="selectedKitchen"
                  name="recipe[kitchen_id]"
          >
          <button type="submit">Submit</button>
        </Form>
      </DialogPanel>
    </div>
  </Dialog>
  <button @click="setIsOpen(true)">{{$t('recipes.new.title')}}</button>
  <div id="recipes" class="min-w-full">
    <div class="overflow-x-auto sm:-mx-6 lg:-mx-8">
      <div class="py-2 inline-block min-w-full sm:px-6 lg:px-8">
        <div class="overflow-hidden">
          <table class="min-w-full">
            <thead class="border-b">
              <tr>
                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                  Nombre
                </th>
                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                  Descripción
                </th>
                <th scope="col" class="text-sm font-medium text-gray-900 px-6 py-4 text-left">
                  Acciones
                </th>
              </tr>
            </thead>
            <tbody>
              <tr
                v-for="recipe, idx in recipes"
                :key = "idx"
                class="border-b">
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                  <span>{{recipe.name}}</span>
                </td>
                <td class="text-sm text-gray-900 font-light px-6 py-4 whitespace-nowrap">
                  <span>{{recipe.description}}</span>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  </div>
</template>