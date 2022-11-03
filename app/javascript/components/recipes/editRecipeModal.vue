<script setup lang="ts">
  import { ref, reactive, toRef } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Select from '../select.vue';

  const props = defineProps({
    recipe: {
      type: Object,
      default: () => {},
    },
    menus: {
      type: Array,
      default: () => []
    },
    kitchens: {
      type: Array,
      default: () => []
    },
    ingredients: {
      type: Array,
      default: () => []
    },
  })


  const ingredients = toRef(props, 'ingredients');
  const isOpen = ref(true);
  const selectedMenu = ref(null);
  const selectedKitchen = ref(null);
  const submitted = ref(false);
  const { t } = useI18n({});

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
        {{$t('recipes.edit.title')}}
      </template>
      <template #content>
        <Form
          action="/recipes/update_recipe"
          method="post"
        >
          <csrfInput />
          <TextInput
            name="recipe[name]"
            type="text"
            :value="recipe.name"
            v-bind:label="$t('recipes.new.name')"
            :placeholder="$t('recipes.new.placeholder.name')"
          />

          <TextInput
            name="recipe[description]"
            type="text"
            :value="recipe.description"
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
                  :value="field.name"
                  v-bind:label="$t('recipes.new.ingredients.name')"
                  :placeholder="$t('recipes.new.placeholder.name')"
                />
                <TextInput
                  :id="`quantity_${idx}`"
                  :name="`ingredients[${idx}][quantity]`"
                  type="number"
                  :value="field.qty"
                  v-bind:label="$t('recipes.new.ingredients.quantity')"
                  :placeholder="$t('recipes.new.placeholder.quantity')"
                />
                <TextInput
                  :id="`unit_${idx}`"
                  :name="`ingredients[${idx}][unit]`"
                  type="text"
                  :value="field.unit"
                  v-bind:label="$t('recipes.new.ingredients.unit')"
                  :placeholder="$t('recipes.new.placeholder.unit')"
                />
                <input
                  type="hidden"
                  :id="`id_${idx}`"
                  :name="`ingredients[${idx}][id]`"
                  :value="field.id"
                />
              <button
                v-if="ingredients.length > 1"
                type="button"
                @click="removeRow(idx)"
                class="bg-red-400 hover:bg-red-500 text-white font-bold py-2 px-4 rounded mx-2"
              >
                {{$t('buttons.delete')}}
              </button>
              <button
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
              name="recipe[menu_id]"
              v-model="selectedMenu"
              :options="menus"
              :label="$t('menu.title')"
            />
            <Select
              name="recipe[kitchen_id]"
              v-model="selectedKitchen"
              :options="kitchens"
              :label="$t('kitchens.title')"
            />
            <input
              type="hidden"
              name="recipe[id]"
              :value="recipe.id"
            />
          </div>
          <button
            type="submit"
            class="bg-green-600 text-light-300 rounded-sm p-4 m-2 flex mx-auto w-40"
          >
            {{$t('buttons.edit')}}
          </button>
        </Form>
      </template>
    </Modal>
</template>
