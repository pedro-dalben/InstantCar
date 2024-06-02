<template>
  <div class="container mt-5">
    <h1>Vehicles</h1>
    <router-link to="/vehicles/new" class="btn btn-primary mb-3"
      >Create New Vehicle</router-link
    >
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Brand</th>
          <th>Category</th>
          <th>Model</th>
          <th>Plate</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="vehicle in vehicles" :key="vehicle.id">
          <td>{{ vehicle.brand }}</td>
          <td>{{ vehicle.category }}</td>
          <td>{{ vehicle.model }}</td>
          <td>{{ vehicle.license_plate }}</td>
          <td>
            <router-link
              :to="`/vehicles/${vehicle.id}`"
              class="btn btn-info btn-sm"
              >Show</router-link
            >
            <router-link
              :to="`/vehicles/${vehicle.id}/edit`"
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
import vehicleService from '../../services/vehicle'

export default {
  data() {
    return {
      vehicles: [],
    }
  },
  async created() {
    const response = await vehicleService.getVehicles()
    this.vehicles = response.data
  },
}
</script>
