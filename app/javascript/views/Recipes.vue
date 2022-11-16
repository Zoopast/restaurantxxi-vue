<script setup lang="ts">
  import { ref, reactive } from 'vue';
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  import NewRecipeModal from '../components/recipes/new-recipe-modal.vue';
  import ShowRecipeModal from '../components/recipes/showRecipeModal.vue';
  import EditRecipeModal from '../components/recipes/editRecipeModal.vue';


  const { t } = useI18n({});

  defineProps({
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

  const recipe = ref({
    recipe: {
      name: '',
      description: '',
      menu_id: '',
      kitchen_id: '',
      ingredients: [
        {
          name: '',
          quantity: 0,
          unit: ''
        }
      ]
    },
  });

  const ingredients  = ref([
    {
      name: '',
      quantity: 0,
      unit: '',
    },
  ]);

  const show = ref(false);
  const edit = ref(false);
  const isOpen = ref(false);

  function setIsOpen() {
    isOpen.value = !isOpen.value
  }

  function setShow() {
    show.value = !show.value;
  }


  function setEdit() {
    edit.value = !edit.value;
  }

  async function deleteRecipe(recipe_id : string) {

    await axios.delete('/recipes/' + recipe_id)
      .then(function (response) {
        window.location.reload()
      })
      .catch(function (error) {
        window.location.reload()
      });
  };

  async function showRecipe(recipe_id : string) {
    const response = await axios.get('/recipes/' + recipe_id)
      .then(function (response) {
        recipe.value = response.data;
        show.value = true;
      })
      .catch(function (error) {
        console.log(error);
        return error
      });
  }

  async function editRecipe(recipe_id : string) {
    const response = await axios.get('/recipes/' + recipe_id)
      .then(function (response) {
        recipe.value = response.data;
        edit.value = true;
      })
      .catch(function (error) {
        console.log(error);
        return error
      });
  }

</script>
<template>
  <div class="flex flex-col items-center">
    <h1
      class="text-4xl font-bold"
    >
      {{$t('recipes.title')}}
    </h1>
    <EditRecipeModal
      :open="edit"
      @close="setEdit"
      :recipe="recipe.recipe"
      :menus="menus"
      :kitchens="kitchens"
      :ingredients="recipe.ingredients"
    />


    <NewRecipeModal
      :open="isOpen"
      @close="setIsOpen"
      :menus="menus"
      :kitchens="kitchens"
      :recipes="recipes"
    />

    <ShowRecipeModal
      :open="show"
      @close="setShow"
      :recipe="recipe"
    />
    <button
      @click="setIsOpen"
      class="block px-5 py-3 m-2 font-medium text-white bg-green-600 rounded-lg"
    >
      {{$t('recipes.new.title')}}
    </button>
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
                      @click="showRecipe(recipe.id)"
                    >{{$t('recipes.show.button')}}</button>
                    <button
                      @click="editRecipe(recipe.id)"
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