<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Select from '../select.vue';

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

  const isOpen = ref(false);
  const selectedMenu = ref(props.menus[0]);
  const selectedKitchen = ref(props.kitchens[0]);
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
            :label="$t('recipes.new.name')"
            :placeholder="$t('recipes.new.placeholder.name')"
          />

          <TextInput
            name="recipe[description]"
            type="text"
            :label="$t('recipes.new.description')"
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
                v-if="ingredients.length > 1 && (idx + 1) === ingredients.length"
                type="button"
                @click="removeRow(idx)"
                class="bg-red-400 hover:bg-red-500 text-white font-bold py-2 px-4 rounded mx-2"
              >
                {{$t('buttons.delete')}}
              </button>
              <button
                v-if="ingredients.length >= 1 && (idx + 1) === ingredients.length"
                type="button"
                @click="addRow"
                class="bg-green-400 hover:bg-green-500 text-white font-bold py-2 px-4 rounded mx-2"
              >
                {{$t('buttons.add')}}
              </button>
              </div>
            </fieldset>
          </div>
          <div class="flex flex-row m-2">
            <Select
              v-model="selectedMenu"
              :options="menus"
              :label="$t('menu.title')"
            />
            <Select
              v-model="selectedKitchen"
              :options="kitchens"
              :label="$t('kitchens.title')"
            />
            <input
              type="hidden"
              name="recipe[menu_id]"
              :value="selectedMenu.value"
            />
            <input
              type="hidden"
              name="recipe[kitchen_id]"
              :value="selectedKitchen.value"
            />
          </div>
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-green-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('buttons.add')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
  </template>