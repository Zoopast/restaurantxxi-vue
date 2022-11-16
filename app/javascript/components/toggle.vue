<script setup lang='ts'>
import { ref } from 'vue'
import { Switch, SwitchGroup, SwitchLabel } from '@headlessui/vue'

const props = defineProps({
  name: {
    type: String,
    default: ''
  },
  label: {
    type: String,
    default: ''
  },
  default: {
    type: Boolean,
    default: false
  }
});

const enabled = ref(props.default);

</script>

<template>
  <div class="m-2">
    <SwitchGroup
    >
    <div class="flex items-center">
      <Switch
        v-model="enabled"
        :class='enabled ? "bg-blue-600" : "bg-gray-200"'
        class="relative inline-flex h-6 w-11 items-center rounded-full transition-colors focus:outline-none focus:ring-2 focus:ring-indigo-500 focus:ring-offset-2"
        :name="name"
      >
        <span
          :class='enabled ? "translate-x-6" : "translate-x-1"'
          class="inline-block h-4 w-4 transform rounded-full bg-white transition-transform"
        />
      </Switch>
      <SwitchLabel class="m-4">{{label}}</SwitchLabel>
    </div>
  </SwitchGroup>
  </div>
</template>
