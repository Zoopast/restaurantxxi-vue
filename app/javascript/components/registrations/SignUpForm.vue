<script setup lang='ts'>
  import { Field, Form, ErrorMessage, FieldArray } from 'vee-validate';
  import TextInput from '../text-input.vue';
  import csrfInput from '../csrf-input.vue';
</script>

<template>
  <div
    class="flex flex-col justify-center items-center m-10"
  >
    <h1 class="text-2xl font-bold mb-4">
      {{$t('users.sign_up')}}
    </h1>
    <div class="flex justify-center items-center border rounded-md p-5">
      <Form
        action="/users"
        method="POST"
      >
      <csrfInput />
      <TextInput
        name="user[email]"
        :label="$t('users.email')"
        :placeholder="$t('users.email_placeholder')"
        type="email"
      />
      <TextInput
        name="user[password]"
        :label="$t('users.password')"
        :placeholder="$t('users.password_placeholder')"
        type="password"
      />
      <TextInput
        name="user[password_confirmation]"
        :label="$t('users.password_confirmation')"
        :placeholder="$t('users.password_confirmation_placeholder')"
        type="password"
      />
      <div class="flex m-2">
        <button type="submit" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 mx-auto rounded">
          {{$t('users.sign_up')}}
        </button>
      </div>
      </Form>
    </div>
  </div>
</template>
