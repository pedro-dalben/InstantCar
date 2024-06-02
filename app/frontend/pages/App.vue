<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="#">InstantCar</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item">
            <router-link class="nav-link" to="/">Home</router-link>
          </li>
          <li class="nav-item" v-if="isLoggedIn">
            <router-link class="nav-link" to="/vehicles">Vehicles</router-link>
          </li>

          <li class="nav-item" v-if="isLoggedIn">
            <router-link class="nav-link" to="/users">Users</router-link>
          </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item" v-if="!isLoggedIn">
            <router-link class="nav-link" to="/login">Login</router-link>
          </li>
          <li class="nav-item" v-if="!isLoggedIn">
            <router-link class="nav-link" to="/register">Register</router-link>
          </li>
          <li class="nav-item" v-if="isLoggedIn">
            <button class="btn btn-link nav-link" @click="logout">Logout</button>
          </li>
        </ul>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
import { reactive, onMounted } from 'vue'
import authService from '../services/auth'

export default {
  data() {
    return {
      isLoggedIn: false
    }
  },
  methods: {
    async checkAuthStatus() {
      try {
        const response = await authService.currentUser()
        this.isLoggedIn = !!response.data
      } catch (error) {
        this.isLoggedIn = false
      }
    },
    async logout() {
      try {
        await authService.logout()
        this.isLoggedIn = false
        this.$router.push('/login')
      } catch (error) {
        console.error('Failed to logout', error)
      }
    }
  },
  mounted() {
    this.checkAuthStatus()
  },
  watch: {
    $route(to, from) {
      this.checkAuthStatus()
    }
  }
}
</script>

<style scoped>
.navbar {
  margin-bottom: 20px;
}
</style>
