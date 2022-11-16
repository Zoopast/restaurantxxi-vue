<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../../components/toggle.vue';

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
        {{t('menus.new.title')}}
      </template>
      <template #content>
        <Form
          action="/menus"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="menu[name]"
            type="text"
            :label="$t('menus.new.name')"
            :placeholder="$t('menus.new.placeholder.name')"
          />
          <TextInput
            name="menu[description]"
            type="text"
            :label="$t('menus.new.description')"
            :placeholder="$t('menus.new.placeholder.description')"
          />
          <Toggle
            name="menu[default_menu]"
            :label="t('menus.new.default')"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-green-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('menus.new.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>
