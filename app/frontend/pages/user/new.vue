<template>
  <div class="container mt-5">
    <h1>Create User</h1>
    <UserForm @submit="createUser" />
  </div>
</template>

<script>
import UserForm from '../../components/UserForm.vue'
import userService from '../../services/user'

export default {
  components: {
    UserForm,
  },
  methods: {
    async createUser(user) {
      await userService.createUser(user)
      this.$router.push('/users')
    },
  },
}
</script>
