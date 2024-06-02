<template>
  <div>
    <h1>Create Vehicle</h1>
    <VehicleForm @submit="createVehicle" />
  </div>
</template>

<script>
import VehicleForm from '../components/VehicleForm.vue'
import vehicleService from '../services/vehicle'

export default {
  components: {
    VehicleForm
  },
  methods: {
    async createVehicle(vehicle) {
      try {
        await vehicleService.createVehicle(vehicle)
        this.$router.push('/vehicles')
      } catch (error) {
        console.error('Failed to create vehicle', error)
      }
    }
  }
}
</script>
