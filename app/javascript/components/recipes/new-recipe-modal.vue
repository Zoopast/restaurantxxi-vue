<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Dropdown from '../dropdown.vue';

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

  const isOpen = ref(true);
  const selectedMenu = ref(null);
  const selectedKitchen = ref(null);
  const submitted = ref(false);
  const { t } = useI18n({});

  const ingredients = ref([
    {name: '', quantity: 0, unit: ''},
  ]);

  const addRow = () => {
    ingredients.value.push({name: '', quantity: 0, unit: ''});
  }

  const removeRow = (index: number) => {
    ingredients.value.splice(index, 1);
  }

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
        {{$t('recipes.new.title')}}
      </template>
      <template #content>
        <Form
          action="/recipes"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="recipe[name]"
            type="text"
            v-bind:label="$t('recipes.new.name')"
            :placeholder="$t('recipes.new.placeholder.name')"
          />

          <TextInput
            name="recipe[description]"
            type="text"
            v-bind:label="$t('recipes.new.description')"
            :placeholder="$t('recipes.new.placeholder.description')"
          />
          <div
            class="m-2"
          >
            <span class="text-xl">
              {{$t('recipes.new.ingredients.title')}}
            </span>
            <fieldset
              class="InputGroup"
              v-for="(field, idx) in ingredients"
              :key="idx"
            >
              <legend>{{$t('recipes.new.ingredients.subtitle')}} {{ idx + 1 }}</legend>
              <div class="grid grid-cols-5">
                <TextInput
                :id="`name_${idx}`"
                :name="`ingredients[${idx}][name]`"
                type="text"
                v-bind:label="$t('recipes.new.ingredients.name')"
                :placeholder="$t('recipes.new.placeholder.name')"
              />
              <TextInput
                :id="`quantity_${idx}`"
                :name="`ingredients[${idx}][quantity]`"
                type="number"
                v-bind:label="$t('recipes.new.ingredients.quantity')"
                :placeholder="$t('recipes.new.placeholder.quantity')"
              />
              <TextInput
                :id="`unit_${idx}`"
                :name="`ingredients[${idx}][unit]`"
                type="text"
                v-bind:label="$t('recipes.new.ingredients.unit')"
                :placeholder="$t('recipes.new.placeholder.unit')"
              />
              <button
                type="button"
                @click="addRow"
                class="bg-green-300 hover:bg-green-400 text-white font-bold py-2 px-4 rounded mx-2"
                >Add</button>
              <button
                type="button"
                @click="removeRow(idx)"
                class="bg-red-300 hover:bg-red-400 text-white font-bold py-2 px-4 rounded mx-2"
                >Remove</button>
              </div>
            </fieldset>
          </div>
          <label for="menu_id">Menú</label>
          <Field name="menu" as="select" v-model="selectedMenu">
            <option :value="null" disabled> Select a menu</option>
            <option v-for="menu, idx in menus" :value="menu" :key="idx">{{ menu }}</option>
          </Field>
          <label for="kitchen_id">Cocina</label>
          <Field name="kitchen" as="select" v-model="selectedKitchen">
            <option :value="null" disabled> Select a kitchen</option>
            <option v-for="kitchen, idx in kitchens" :value="kitchen" :key="idx">{{ kitchen }}</option>
          </Field>
          <input
            v-if="selectedMenu !== null"
            type="hidden"
            :value="selectedMenu"
            name="recipe[menu_id]"
          />
          <input
            v-if="selectedKitchen !== null"
            type="hidden"
            :value="selectedKitchen"
            name="recipe[kitchen_id]"
          />
          <Dropdown />
          <button type="submit">Submit</button>
        </Form>
      </template>
  </Modal>
</template>