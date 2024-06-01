<template>
  <div v-if="!isLoggedIn" class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">Login</div>
          <div class="card-body">
            <form @submit.prevent="login">
              <div class="form-group">
                <label for="email">Email</label>
                <input v-model="email" type="email" class="form-control" id="email" required />
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input v-model="password" type="password" class="form-control" id="password" required />
              </div>
              <button type="submit" class="btn btn-primary mt-3">Login</button>
              <div v-if="errorMessage" class="alert alert-danger mt-3">{{ errorMessage }}</div>
            </form>
            <div class="text-center mt-3">
              <router-link to="/register">Don't have an account? Register</router-link>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import authService from '../services/auth'

export default {
  data() {
    return {
      email: '',
      password: '',
      errorMessage: '',
      isLoggedIn: false,
    }
  },
  methods: {
    async login() {
      try {
        await authService.login(this.email, this.password)
        this.$router.push('/')
      } catch (error) {
        if (error.response && error.response.data && error.response.data.error) {
          this.errorMessage = error.response.data.error
        } else {
          this.errorMessage = 'An error occurred. Please try again.'
        }
      }
    },
    async checkAuthStatus() {
      try {
        const response = await authService.currentUser()
        this.isLoggedIn = !!response.data
        if (this.isLoggedIn) {
          this.$router.push('/')
        }
      } catch (error) {
        this.isLoggedIn = false
      }
    },
  },
  mounted() {
    this.checkAuthStatus()
  },
}
</script>

<style scoped>
.container {
  margin-top: 100px;
}
</style>
