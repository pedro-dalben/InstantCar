<template>
  <div class="container mt-5">
    <h1>Edit User</h1>
    <UserForm :user="user" @submit="updateUser" />
  </div>
</template>

<script>
import UserForm from '../../components/UserForm.vue'
import userService from '../../services/user'

export default {
  components: {
    UserForm,
  },
  data() {
    return {
      user: null,
    }
  },
  async created() {
    const response = await userService.getUser(this.$route.params.id)
    this.user = response.data
  },
  methods: {
    async updateUser(user) {
      await userService.updateUser(this.$route.params.id, user)
      this.$router.push('/users')
    },
  },
}
</script>
