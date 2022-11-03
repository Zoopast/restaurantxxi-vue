<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  import NewRecipeModal from '../components/recipes/new-recipe-modal.vue';

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

  const submitted = ref(false);
  const submitHandler = async () => {
    await new Promise((r) => setTimeout(r, 1000));
    submitted.value = true;
  }

  const isOpen = ref(true);

  function setIsOpen() {
    isOpen.value = !isOpen.value
  }

  const { t } = useI18n({});


  async function deleteRecipe(recipe_id : string) {

    await axios.delete('/recipes/' + recipe_id)
      .then(function (response) {
        console.log(response);
        window.location.reload()
      })
      .catch(function (error) {
        console.log(error);
        window.location.reload()
      });
  };
</script>
<template>
  <div class="flex flex-col items-center">
    <h1
      class="text-xl"
    >
      {{$t('recipes.title')}}
    </h1>
    <NewRecipeModal
      :open="isOpen"
      @close="setIsOpen"
      :menus="menus"
      :kitchens="kitchens"
      :recipes="recipes"
    />
    <button @click="setIsOpen" class="bg-green-500 rounded-sm p-2 text-white">{{$t('recipes.new.title')}}</button>
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
                  <td class="flex flex-row gap-2">
                    <button
                    >{{$t('recipes.show.button')}}</button>
                    <button
                    >{{$t('recipes.show.edit')}}</button>
                    <button
                      @click="deleteRecipe(recipe.id)"
                      class="text-red-500"
                    >{{$t('recipes.show.delete')}}</button>
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