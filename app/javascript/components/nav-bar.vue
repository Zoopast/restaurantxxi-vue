<script setup lang="ts">
  import { useI18n } from 'vue-i18n';
  import axios from 'axios';
  import { csrfToken } from '@rails/ujs';
  const { t } = useI18n({});

  const props = defineProps({
    currentUser: {
      type: Object,
      required: true
    },
    userRoles: {
      type: Array,
      default: () => []
    },
  });

  function logout() {
    fetch('/users/sign_out', {
      method: 'DELETE',
      headers: {
        'X-CSRF-Token': csrfToken(),
      }
    }).then(() => {
      window.location.replace('/');
    }).catch((error) => {
      console.log(error);
    });
  }

  function userHasRole(roles) {
    let user_belong_to_role = false;
    roles.forEach((role) => {
      let currentRole = role
      props.userRoles.forEach((userRole) => {
        console.log(userRole['name'], currentRole);
        if (userRole['name'] === currentRole) {
          console.log(true);
          user_belong_to_role = true;
        }

      })
    });
    return user_belong_to_role;
  }

</script>
<template>
  <div class="p-2 h-12 flex flex-row items-center justify-between text-gray-500 bg-gray-100 hover:text-gray-700 focus:text-gray-700">
    <div>
      <a href="/">RestaurantXXI</a>
      {{userRoles}}
    </div>
    <div class="">
      <a
        v-if="userHasRole(['admin', 'storage'])"
        href="/items" class="p-2 nav-item"
      >
        {{t('inventory.title')}}
      </a>
      <a
        v-if="userHasRole(['admin', 'kitchen'])"
        href="/menus" class="p-2 nav-item"
      >
        {{t('menus.title')}}
      </a>
      <a
        v-if="userHasRole(['admin', 'kitchen'])"
        href="/recipes" class="p-2 nav-item"
      >
        {{t('recipes.title')}}
      </a>
      <a
        v-if="userHasRole(['admin'])"
        href="/tables" class="p-2 nav-item"
      >
        {{t('tables.title')}}
      </a>
      <a
        v-if="userHasRole(['admin'])"
        href="/customers" class="p-2 nav-item"
      >
        {{t('clients.title')}}
      </a>
      <a
        v-if="userHasRole(['admin', 'waiter'])"
        href="/reservations" class="p-2 nav-item"
      >
        {{t('reservations.title')}}
      </a>
      <a
        v-if="userHasRole(['admin', 'finance'])"
        href="/finances" class="p-2 nav-item"
      >
        {{t('finances.title')}}
      </a>
    </div>
    <div class="flex flex-row">
      <div
        v-if="currentUser"
        class="flex gap-2"
      >
        <a
          class="p-2 nav-item"
          href="#"
        >
          {{t('user.title')}}
        </a>
        <a
          class="p-2 nav-item"
          href="#"
          @click.prevent="logout"
        >
          {{t('session.signout')}}
        </a>
      </div>
      <div
        v-if="!currentUser"
        class="flex gap-2"
      >
        <a
          class="p-2 nav-item"
          href="/users/sign_in"
        >
          {{t('session.signin')}}
        </a>
        <a
          class="p-2 nav-item"
          href="/users/sign_up"
        >
          {{t('session.signup')}}
        </a>
      </div>
    </div>
  </div>
</template>