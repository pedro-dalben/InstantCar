<template>
  <div>
    <h1>Edit Vehicle</h1>
    <VehicleForm :vehicle="vehicle" :onSubmit="updateVehicle" />
  </div>
</template>

<script>
import VehicleForm from '../components/VehicleForm.vue'
import vehicleService from '../services/vehicle'

export default {
  components: {
    VehicleForm
  },
  data() {
    return {
      vehicle: null
    }
  },
  async created() {
    const response = await vehicleService.getVehicle(this.$route.params.id)
    this.vehicle = response.data
  },
  methods: {
    async updateVehicle(vehicle) {
      await vehicleService.updateVehicle(this.$route.params.id, vehicle)
      this.$router.push('/vehicles')
    }
  }
}
</script>
