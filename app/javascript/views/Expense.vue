<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  const { t } = useI18n({});

  defineProps({
    expense: {
      type: Object,
      required: true
    },
    expenseItems: {
      type: Array,
      default: () => []
    },
  })

</script>

<template>
  <div class="flex flex-col justify-center items-center m-2">
    <h1 class="text-2xl"><span class="font-bold">{{t('expenses.show.title')}}:</span> <span class="italic">{{expense.id}}</span></h1>
    <span><span class="font-bold">{{t('expenses.show.description')}}: </span><span class="italic">{{expense.description}}</span></span>
    <span><span class="font-bold">{{t('expenses.show.total')}}: </span><span class="italic">{{expense.amount}}</span></span>
    <div>
      <h2 class="text-xl font-bold">{{t('expenses.show.items.title')}}</h2>
      <div
        v-for="item in expenseItems"
        :key="item.id"
      >
        {{item.name}}
        {{item.quantity}}
        {{item.price}}
      </div>
    </div>
  </div>
  <div>
    {{JSON.stringify(expense)}}
  </div>
</template>
