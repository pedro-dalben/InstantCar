<template>
  <div class="container mt-5">
    <h1>User Details</h1>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">{{ user.full_name }}</h5>
        <p class="card-text"><strong>Email:</strong> {{ user.email }}</p>
        <p class="card-text"><strong>CPF:</strong> {{ user.cpf }}</p>
        <p class="card-text">
          <strong>Date of Birth:</strong> {{ user.birth_date }}
        </p>
        <p class="card-text">
          <strong>Active:</strong> {{ user.active ? 'Yes' : 'No' }}
        </p>
        <router-link :to="`/users/${user.id}/edit`" class="btn btn-warning"
          >Edit</router-link
        >
      </div>
    </div>
  </div>
</template>

<script>
import userService from '../../services/user'

export default {
  data() {
    return {
      user: null,
    }
  },
  async created() {
    const response = await userService.getUser(this.$route.params.id)
    this.user = response.data
  },
}
</script>
