<script setup lang="ts">
import { toRef } from 'vue';
import { useField } from 'vee-validate';
const props = defineProps({
  type: {
    type: String,
    default: 'text',
  },
  value: {
    type: [String, Number],
    default: '',
  },
  name: {
    type: String,
    required: true,
  },
  label: {
    type: String,
    required: true,
  },
  successMessage: {
    type: String,
    default: '',
  },
  placeholder: {
    type: String,
    default: '',
  },
});

const name = toRef(props, 'name');

const {
  value: inputValue,
  errorMessage,
  handleBlur,
  handleChange,
  meta,
} = useField(name, undefined, {
  initialValue: props.value,
});

</script>
<template>
  <div
    class="flex flex-col"
    :class="{ 'has-error': !!errorMessage, success: meta.valid }"
  >
    <label
      :for="name"
      class="mx-2">{{ label }}</label>
    <input
      class=" border border-gray-300 rounded-md p-2 mx-2"
      :name="name"
      :id="name"
      :type="type"
      :value="inputValue"
      :placeholder="placeholder"
      @input="handleChange"
      @blur="handleBlur"
    />

    <p class="help-message" v-show="errorMessage || meta.valid">
      {{ errorMessage || successMessage }}
    </p>
  </div>
</template>