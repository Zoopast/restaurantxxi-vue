<script setup lang='ts'>
  import { ref, reactive } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
  import Toggle from '../../components/toggle.vue';

  defineProps({
    client: {
      type: Object,
      default: () => ({
        full_name: '',
        email: '',
        password: '',
        password_confirmation: '',
      }),
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
        {{t('clients.edit.title')}}
      </template>
      <template #content>
        <Form
          action="/customers/update_customer"
          method="POST"
        >
          <csrfInput />
          <TextInput
            name="client[full_name]"
            type="text"
            :value="client.full_name"
            :label="$t('clients.new.full_name')"
            :placeholder="$t('clients.new.placeholder.full_name')"
          />
          <TextInput
            name="client[email]"
            type="email"
            :value="client.email"
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
          <input
            type="hidden"
            name="id"
            :value="client.id"
          />
          <div
            class="flex mx-auto justify-center"
          >
            <button
            type="submit"
            class="bg-gray-600 text-light-300 rounded-sm p-4 m-2 w-40 text-center"
            >
              {{$t('clients.edit.button')}}
            </button>
          </div>
        </Form>
      </template>
    </Modal>
</template>
