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
import HomeView from "../views/home-view.vue";
import AuthStore from '../stores/AuthStore';
import 'virtual:windi.css';

document.addEventListener('DOMContentLoaded', () => {

  let store = AuthStore();
  let localAuthToken = localStorage.auth_token;
  let cookiesExists = localAuthToken !== 'undefined' && localAuthToken !== null;
  if(cookiesExists)
  {
    const auth_token = localStorage.getItem('auth_token');
    const authTokenExists = auth_token !== 'undefined' && auth_token !== null;
    if(authTokenExists){
      store.loginUserWithToken({auth_token});
    }
  }

  const app = createApp({
    components: {
      AboutView,
      HomeView,
    },
  });

  app.use(store);
  app.mount("#app");

  return app;
});