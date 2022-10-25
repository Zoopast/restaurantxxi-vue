<template lang="">
<div class="container">
        <h1 class="sm-title">Vue Session Manager</h1>
        <div class="sm-card">
            <div v-if="isLoggedIn">
                <button @click="logoutUser" class="logout-button" >Logout</button>
                <table class="table">
                    <thead class="thead-dark">
                    <tr class="table-headers">
                        <th scope="col">ID</th>
                        <th scope="col">email</th>
                        <th scope="col">Token</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr class="table-rows">
                        <th class="table-row">[{{ this.getUserID }}]</th>
                        <td class="table-row table-row-username">{{ this.getUserEmail }}</td>
                        <td class="table-row">{{ this.getAuthToken }}</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div v-else>
                <h3>Sign Up!</h3>
                    <form @submit="onSignUp" class="sign-up-form">
                        <input class="sign-up-form-email" type="email" v-model="signUpEmail" placeholder="Email" />
                        <br />
                        <input
                            type="password"
                            class="sign-up-form-password"
                            v-model="signUpPassword"
                            placeholder="Password"
                        />
                        <br />
                        <input type="submit" value="Sign up" class="sign-up-form-submit" />
                    </form>
                <hr />
                <br />
                <h3>Login!</h3>
                <form @submit="onLogin" class="login-form">
                    <input class="login-form-email" type="text" v-model="loginEmail" placeholder="Email" />
                    <br />
                    <input class="login-form-password" type="password" v-model="loginPassword" placeholder="Password" />
                    <br />
                    <input type="submit" value="Login" class="login-form-submit" />
                </form>
            </div>
        </div>
    </div>
</template>
<script setup lang="ts">
  import { storeToRefs } from 'pinia'
  import { useAuthStore } from "../stores/AuthStore";
  import { reactive } from "vue";
  const { getAuthToken, getUserEmail, getUserID, isLoggedIn } = useAuthStore();
  const { registerUser, loginUser, logoutUser } = useAuthStore()
  const user = reactive({signUpEmail: "",
                         signUpPassword: "",
                         loginEmail: "",
                         loginPassword: ""})
  function onSignup(event) {
    event.preventDefault();
    let data = {
      user: {
        email: user.signUpEmail,
        password: user.signUpPassword,
      }
    };
    registerUser(data);
    resetData();
  }

  function onLogin(event) {
    event.preventDefault();
    let data = {
      user: {
        email: user.loginEmail,
        password: user.loginPassword,
      }
    };
    loginUser(data);
    resetData();
  }

  function resetData() {
    user.signUpEmail = "";
    user.signUpPassword = "";
    user.loginEmail = "";
    user.loginPassword = "";
  }

</script>
<style lang="">

</style>