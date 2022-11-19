// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails')

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log('Visit the guide for more information: ', 'https://vite-ruby.netlify.app/guide/rails')

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
import { createApp } from "vue/dist/vue.esm-bundler.js";
import SignIn from '../views/SignIn.vue';
import SignUp from '../views/SignUp.vue';
import AboutView from "../views/About.vue";
import NavBar from "../components/nav-bar.vue";
import HomeView from "../views/Home.vue";
import ExpensesView from "../views/Expenses.vue";
import FinancesView from "../views/Finances.vue";
import InventoryView from "../views/Inventory.vue";
import ItemsView from "../views/Items.vue";
import KitchensView from "../views/Kitchens.vue";
import OrdersView from "../views/Orders.vue";
import ProductsView from "../views/Products.vue";
import RecipesView from "../views/Recipes.vue";
import ReservationsView from "../views/Reservations.vue";
import TablesView from "../views/Tables.vue";
import TransactionsView from "../views/Transactions.vue";
import UserView from "../views/Users.vue";
import ExpenseView from '../views/Expense.vue';
import MenusView from '../views/Menus.vue';
import CustomersView from '../views/Customers.vue';

import SessionManager from "../views/SessionManager.vue";
import { createPinia } from 'pinia';
import 'virtual:windi.css';
import Locales from '../locales/locales';
import { createI18n } from 'vue-i18n';

document.addEventListener('DOMContentLoaded', () => {
  const i18n = createI18n({
    legacy: false,
    locale: 'es',
    fallbackLocale: 'es',
    messages: Locales.messages,
  });

  const pinia = createPinia();

  const app = createApp({
    components: {
      NavBar,
      AboutView,
      HomeView,
      ExpensesView,
      FinancesView,
      InventoryView,
      ItemsView,
      KitchensView,
      OrdersView,
      ProductsView,
      RecipesView,
      ReservationsView,
      TablesView,
      TransactionsView,
      UserView,
      SessionManager,
      SignIn,
      SignUp,
      ExpenseView,
      MenusView,
      CustomersView,
    },
  });
  app.use(pinia);
  app.use(i18n);
  app.mount("#app");

  return app;
});