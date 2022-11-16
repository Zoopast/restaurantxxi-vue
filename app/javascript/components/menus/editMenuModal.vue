<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../../components/toggle.vue';


  defineProps({
    menu: {
      type: Object,
      default: () => {},
    },
  });

  const { t } = useI18n({});
  const isOpen = ref(false);

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
      {{t('menus.edit.title')}}
    </template>
    <template #content>
      <Form
          action="/menus/update_menu"
          method="POST"
      >
        <csrfInput />
        <TextInput
          name="menu[name]"
          type="text"
          :label="$t('menus.new.name')"
          :value="menu.name"
          :placeholder="$t('menus.new.placeholder.name')"
        />
        <TextInput
          name="menu[description]"
          type="text"
          :label="$t('menus.new.description')"
          :value="menu.description"
          :placeholder="$t('menus.new.placeholder.description')"
        />
        <Toggle
          name="menu[default_menu]"
          :label="t('menus.new.default')"
          :default="menu.default_menu"
        />
        <input
          type="hidden"
          name="menu[id]"
          :value="menu.id"
        />
        <div
          class="flex mx-auto justify-center"
        >
          <button
            type="submit"
            class="bg-gray-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
          >
            {{$t('menus.edit.button')}}
          </button>
        </div>
      </Form>
    </template>
  </Modal>
</template>
