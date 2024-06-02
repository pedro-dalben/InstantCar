<template>
  <div>
    <h1>Vehicle Details</h1>
    <p><strong>Brand:</strong> {{ vehicle.brand }}</p>
    <p><strong>Category:</strong> {{ vehicle.category }}</p>
    <p><strong>Model:</strong> {{ vehicle.model }}</p>
    <p><strong>License Plate:</strong> {{ vehicle.license_plate }}</p>
    <p><strong>Available for Rent:</strong> {{ vehicle.available }}</p>
    <router-link to="/vehicles" class="btn btn-secondary">Back to List</router-link>
  </div>
</template>

<script>
import vehicleService from '../services/vehicle'

export default {
  data() {
    return {
      vehicle: null
    }
  },
  async created() {
    const response = await vehicleService.getVehicle(this.$route.params.id)
    this.vehicle = response.data
  }
}
</script>
