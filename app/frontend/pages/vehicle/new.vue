<template>
  <div class="container mt-5">
    <h1>Create Vehicle</h1>
    <VehicleForm @submit="createVehicle" />
  </div>
</template>

<script>
import VehicleForm from '../../components/VehicleForm.vue'
import vehicleService from '../../services/vehicle'

export default {
  components: {
    VehicleForm,
  },
  methods: {
    async createVehicle(vehicle) {
      await vehicleService.createVehicle(vehicle)
      this.$router.push('/vehicles')
    },
  },
}
</script>
