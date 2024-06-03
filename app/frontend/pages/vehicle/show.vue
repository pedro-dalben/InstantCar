<template>
  <div class="container mt-5">
    <h1>Vehicle Details</h1>
    <div class="card">
      <div class="card-body">
        <h5 class="card-title">{{ vehicle.brand }} {{ vehicle.model }}</h5>
        <p class="card-text">
          <strong>Category:</strong> {{ vehicle.category }}
        </p>
        <p class="card-text">
          <strong>Plate:</strong> {{ vehicle.license_plate }}
        </p>
        <router-link
          :to="`/vehicles/${vehicle.id}/edit`"
          class="btn btn-warning"
          >Edit</router-link
        >
      </div>
    </div>
  </div>
</template>

<script>
import vehicleService from '../../services/vehicle'

export default {
  data() {
    return {
      vehicle: null,
    }
  },
  async created() {
    const response = await vehicleService.getVehicle(this.$route.params.id)
    this.vehicle = response.data
  },
}
</script>
