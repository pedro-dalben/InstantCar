<template>
  <div v-if="!isLoggedIn" class="container mt-5">
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card">
          <div class="card-header">Register</div>
          <div class="card-body">
            <form @submit.prevent="register">
              <div class="form-group">
                <label for="full_name">Full Name</label>
                <input v-model="full_name" type="text" class="form-control" id="full_name" required />
              </div>
              <div class="form-group">
                <label for="cpf">CPF</label>
                <input v-model="cpf" type="text" class="form-control" id="cpf" required />
              </div>
              <div class="form-group">
                <label for="birth_date">Birth Date</label>
                <input v-model="birth_date" type="date" class="form-control" id="birth_date" required />
              </div>
              <div class="form-group">
                <label for="email">Email</label>
                <input v-model="email" type="email" class="form-control" id="email" required />
              </div>
              <div class="form-group">
                <label for="password">Password</label>
                <input v-model="password" type="password" class="form-control" id="password" required />
              </div>
              <div class="form-group">
                <label for="password_confirmation">Password Confirmation</label>
                <input v-model="password_confirmation" type="password" class="form-control" id="password_confirmation" required />
              </div>
              <button type="submit" class="btn btn-primary mt-3">Register</button>
              <div v-if="errorMessage" class="alert alert-danger mt-3">{{ errorMessage }}</div>
            </form>
            <div class="text-center mt-3">
              <router-link to="/login">Already have an account? Login</router-link>
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
      full_name: '',
      cpf: '',
      birth_date: '',
      email: '',
      password: '',
      password_confirmation: '',
      errorMessage: '',
      isLoggedIn: false,
    }
  },
  methods: {
    async register() {
      try {
        await authService.register(this.full_name, this.cpf, this.birth_date, this.email, this.password, this.password_confirmation)
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
