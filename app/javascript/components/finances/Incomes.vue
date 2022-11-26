<script setup lang='ts'>
  import { useI18n } from 'vue-i18n';

  const { t } = useI18n({});

  const props = defineProps({
    incomes: {
      type: Array,
      default: () => []
    }
  });

</script>

<template>
  <div
    class="flex justify-center items-center"
  >
    <div
      class="flex flex-col justify-center items-center"
    >
      <h1
        class="text-2xl font-bold"
      >
        {{t('finances.incomes.title')}}
      </h1>
      <div
        v-for="income in incomes"
        :key="income.id"
        class="flex flex-col border-2 rounded p-2"
      >
        <span>{{t('finances.incomes.income.id')}}: {{income.id}}</span>
        <span>{{t('finances.incomes.income.description')}}: {{income.description}}</span>
        <span>{{t('finances.incomes.income.amount')}}: {{income.amount}}</span>
        <span>{{t('finances.incomes.income.date')}}: {{income.created_at}}</span>
      </div>
    </div>
  </div>
</template>
