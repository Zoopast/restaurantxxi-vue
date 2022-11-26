<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';
  import { formatDate, formatTime } from '../../utils/timezones';
  const { t } = useI18n({});
  const props = defineProps({
    expenses:{
      type: Array,
      default: () => []
    },
  });

  function formatDatetimes(datetime : any){
    return formatDate({date: datetime}) + ' ' + formatTime({date: datetime});
  }
</script>

<template>
  <div class="flex flex-col justify-center items-center">
    <h1
      class="text-2xl font-bold"
    >
      {{t('finances.expenses.title')}}
    </h1>
    <div
      v-for="expense in expenses"
      :key="expense.id"
      class="flex flex-col border-2 rounded p-2"
    >
      <span>{{t('finances.expenses.expense.id')}}: {{expense.id}}</span>
      <span>{{t('finances.expenses.expense.description')}}: {{expense.description}}</span>
      <span>{{t('finances.expenses.expense.amount')}}: {{expense.amount}}</span>
      <span>{{t('finances.expenses.expense.date')}}: {{formatDatetimes(expense.created_at)}}</span>
    </div>
  </div>

</template>
