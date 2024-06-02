<template>
  <div class="container mt-5">
    <h1>Users</h1>
    <router-link to="/users/new" class="btn btn-primary mb-3"
      >Create New User</router-link
    >
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Name</th>
          <th>Email</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="user in users" :key="user.id">
          <td>{{ user.full_name }}</td>
          <td>{{ user.email }}</td>
          <td>
            <router-link :to="`/users/${user.id}`" class="btn btn-info btn-sm"
              >Show</router-link
            >
            <router-link
              :to="`/users/${user.id}/edit`"
              class="btn btn-warning btn-sm"
              >Edit</router-link
            >
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import userService from '../../services/user'

export default {
  data() {
    return {
      users: [],
    }
  },
  async created() {
    const response = await userService.getUsers()
    this.users = response.data
  },
}
</script>
