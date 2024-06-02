<template>
  <div>
    <h1>Vehicles</h1>
    <router-link to="/vehicles/new" class="btn btn-primary mb-3">Add Vehicle</router-link>
    <table class="table">
      <thead>
        <tr>
          <th>Brand</th>
          <th>Category</th>
          <th>Model</th>
          <th>License Plate</th>
          <th>Available</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="vehicle in vehicles" :key="vehicle.id">
          <td>{{ vehicle.brand }}</td>
          <td>{{ vehicle.category }}</td>
          <td>{{ vehicle.model }}</td>
          <td>{{ vehicle.license_plate }}</td>
          <td>{{ vehicle.available }}</td>
          <td>
            <router-link :to="`/vehicles/${vehicle.id}`" class="btn btn-info btn-sm">View</router-link>
            <router-link :to="`/vehicles/${vehicle.id}/edit`" class="btn btn-warning btn-sm">Edit</router-link>
            <button @click="deleteVehicle(vehicle.id)" class="btn btn-danger btn-sm">Delete</button>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import vehicleService from '../services/vehicle'

export default {
  data() {
    return {
      vehicles: []
    }
  },
  methods: {
    async fetchVehicles() {
      const response = await vehicleService.getVehicles()
      this.vehicles = response.data
    },
    async deleteVehicle(id) {
      await vehicleService.deleteVehicle(id)
      this.fetchVehicles()
    }
  },
  mounted() {
    this.fetchVehicles()
  }
}
</script>
