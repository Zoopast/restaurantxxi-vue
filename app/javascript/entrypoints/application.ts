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
import AboutView from "../views/about-view.vue";
import NavBar from "../components/nav-bar.vue";

import HomeView from "../views/home-view.vue";
import ExpensesView from "../views/expenses-view.vue";
import FinancesView from "../views/finances-view.vue";
import InventoryView from "../views/inventory-view.vue";
import ItemsView from "../views/items-view.vue";
import KitchensView from "../views/kitchens-view.vue";
import OrdersView from "../views/orders-view.vue";
import ProductsView from "../views/products-view.vue";
import RecipesView from "../views/recipes-view.vue";
import ReservationsView from "../views/reservations-view.vue";
import TablesView from "../views/tables-view.vue";
import TransactionsView from "../views/transactions-view.vue";
import UserView from "../views/user-view.vue";

import SessionManager from "../views/SessionManager.vue";
import { createPinia } from 'pinia';
import 'virtual:windi.css';
import Locales from '../locales/locales';
import { createI18n } from 'vue-i18n';
import { plugin, defaultConfig } from '@formkit/vue';

document.addEventListener('DOMContentLoaded', () => {
  let localAuthToken = localStorage.auth_token;
  let cookiesExists = localAuthToken !== 'undefined' && localAuthToken !== null;
  if(cookiesExists)
  {
    const auth_token = localStorage.getItem('auth_token');
    const authTokenExists = auth_token !== 'undefined' && auth_token !== null;
    if(authTokenExists){
      auth.loginUserWithToken({auth_token});
    }
  }
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
    },
  });
  app.use(pinia);
  app.use(i18n);
  app.use(plugin, defaultConfig);
  app.mount("#app");

  return app;
});