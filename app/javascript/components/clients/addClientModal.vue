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
        {{t('clients.new.title')}}
      </template>
      <template #content>
        <Form
          action="/clients"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="client[full_name]"
            type="text"
            :label="$t('clients.new.full_name')"
            :placeholder="$t('clients.new.placeholder.full_name')"
          />
          <TextInput
            name="client[email]"
            type="email"
            :label="$t('clients.new.email')"
            :placeholder="$t('clients.new.placeholder.email')"
          />
          <TextInput
            name="client[password]"
            type="password"
            :label="$t('clients.new.password')"
            :placeholder="$t('clients.new.placeholder.password')"
          />
          <TextInput
            name="client[password_confirmation]"
            type="password"
            :label="$t('clients.new.password_confirmation')"
            :placeholder="$t('clients.new.placeholder.password_confirmation')"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-green-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('clients.new.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>
