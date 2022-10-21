import { defineStore } from "pinia";
import axios from "axios";

const BASE_URL = "http://localhost:3000/";

export default defineStore({
  id: "AuthStore",
  state: () => {
    return {
      auth_token: null,
      user: {
        id: null,
        username: null,
        email: null,
      },
    }
  },
  getters: {
    getAuthToken() {
      return this.auth_token;
    },
    getUserEmail() {
      return this.user?.email;
    },
    getUserID() {
      return this.user?.id;
    },
    isLoggedIn() {
      const loggedOut =
        this.auth_token == null || this.auth_token == JSON.stringify(null);
      return !loggedOut;
    },
  },
  actions: {
    registerUser(payload) {
      return new Promise((resolve, reject) => {
        axios
          .post(`${BASE_URL}users`, payload)
          .then((response) => {
            this.user = response.data.user;
            this.auth_token = response.data.headers.authorization;
            axios.defaults.headers.common["Authorization"] = response.data.headers.authorization;
            localStorage.setItem("auth_token", response.data.headers.authorization);
            resolve(response);
          })
          .catch((error) => {
            reject(error);
          });
      });
    },

    loginUser(payload) {
      new Promise((resolve, reject) => {
        axios
          .post(`${BASE_URL}users/sign_in`, payload)
          .then((response) => {
            this.user = response.data.user;
            this.auth_token = response.data.headers.authorization;
            axios.defaults.headers.common["Authorization"] = response.data.headers.authorization;
            localStorage.setItem("auth_token", response.data.headers.authorization);
            resolve(response);
          })
          .catch((error) => {
            reject(error);
          });
      });
    },

    logoutUser() {
      const config = {
        headers: {
          authorization: this.auth_token,
        },
      };
      new Promise((resolve, reject) => {
        axios
          .delete(`${BASE_URL}users/sign_out`, config)
          .then(() => {
            this.user = {
              id: null,
              username: null,
              email: null,
            };
            this.auth_token = null;
            localStorage.removeItem("auth_token");
            axios.defaults.headers.common["Authorization"] = null;
          })
          .catch((error) => {
            reject(error);
          });
      });
    },

    loginUserWithToken(payload) {
      const config = {
        headers: {
          Authorization: payload.auth_token,
        },
      };
      new Promise((resolve, reject) => {
        axios
          .get(`${BASE_URL}member-data`, config)
          .then((response) => {
            this.user = response.data.user;
            this.auth_token = localStorage.getItem("auth_token");
            resolve(response);
          })
          .catch((error) => {
            reject(error);
          });
      });
    },
  },
});