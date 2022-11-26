<script setup lang='ts'>
  import { ref } from 'vue';
  import { useI18n } from 'vue-i18n';
  import ExpensesComponent from  '../components/finances/Expenses.vue';
  import IncomesComponent from '../components/finances/Incomes.vue';
  const { t } = useI18n({});
  const props = defineProps({
    expenses:{
      type: Array,
      default: () => []
    },
    incomes: {
      type: Array,
      default: () => []
    }
  });

  const revenue = ref(calculateRevenue(props.incomes, props.expenses));
  const totalExpenses = ref(calculateTotalExpenses(props.expenses));
  const totalIncomes = ref(calculateTotalIncomes(props.incomes));

  function calculateRevenue(incomes : Array<Object>, expenses : Array<Object>) : number {
    let revenue = 0;
    incomes.forEach(income => {
      revenue += income.amount;
    });
    expenses.forEach(expense => {
      revenue -= expense.amount;
    });
    return revenue;
  }

  function calculateTotalExpenses(expenses) {
    let totalExpenses = 0;
    expenses.forEach(expense => {
      totalExpenses += expense.amount;
    });
    return totalExpenses;
  }

  function calculateTotalIncomes(incomes){
    let totalIncomes = 0;
    incomes.forEach(income => {
      totalIncomes += income.amount;
    });
    return totalIncomes;
  }
</script>

<template>
  <div class="flex flex-col justify-center items-center">
    <h1
      class="text-3xl font-bold"
    >
      {{t('finances.title')}}
    </h1>
    <ExpensesComponent :expenses="expenses" />
    <div>
      <span>{{t('finances.totalExpenses')}}: {{totalExpenses}}</span>
    </div>
    <IncomesComponent :incomes="incomes" />
    <div>
      <span>{{t('finances.totalIncomes')}}: {{totalIncomes}}</span>
    </div>
    <div
      class="rounded border-2 m-2"
    >
      {{t('finances.revenue')}}: {{revenue}}
    </div>
  </div>
</template>
