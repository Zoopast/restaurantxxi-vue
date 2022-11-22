<script setup lang='ts'>
  import { ref, reactive, watch } from 'vue';
  import Modal from "../modal.vue";
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  const props = defineProps({
    reservation: {
      type: Object,
      default: () => {},
    },
  });


  const { t } = useI18n({});
  const isOpen = ref(false);
  const client = ref({
    id: 0,
    full_name: '',
    email: '',
  });
  function setIsOpen()
  {
    isOpen.value = !isOpen.value;
  }

  async function findClient(client_id : number)
  {
    await axios.get(`/customers/${client_id}`).then((response) => {
      client.value = response.data.client;
    }).catch((e) => {
      console.log(e);
    });
  }

  watch(() => props.reservation, (newVal) => {
    findClient(newVal.client_id);
  })
</script>
<template>
  <Modal
    :open="isOpen"
    @close="setIsOpen"
  >
      <template #title>
        <div
          class="flex flex-col"
        >
          <div
            class="italic"
          >
            {{t('reservation.title')}}
            {{ reservation.id }}
          </div>
          <div>
            <span>{{client['full_name']}}</span>
          </div>
        </div>
      </template>
      <template #content>
        <div
          class="flex flex-col"
        >
          <span>{{client['id']}}</span>
          <span>{{reservation.table_id}}</span>
          <span>{{reservation.number_of_people}}</span>
          <span>{{reservation.reservation_datetime}}</span>
        </div>
      </template>
    </Modal>
</template>