<template>
  <div class="container mt-5">
    <h1>Reservation Details</h1>
    <div v-if="reservation.data.attributes" class="card">
      <div class="card-body">
        <h5 class="card-title">
          Client: {{ reservation.data.attributes.client_name }}
        </h5>
        <p class="card-text">
          <strong>Start Date:</strong>
          {{ reservation.data.attributes.formatted_start_date }}
        </p>
        <p class="card-text">
          <strong>End Date:</strong>
          {{ reservation.data.attributes.formatted_end_date }}
        </p>
        <p class="card-text">
          <strong>Vehicle Category:</strong>
          {{ reservation.data.attributes.vehicle_details.category }}
        </p>
        <p class="card-text">
          <strong>Vehicle Brand:</strong>
          {{ reservation.data.attributes.vehicle_details.brand }}
        </p>
        <p class="card-text">
          <strong>Vehicle Model:</strong>
          {{ reservation.data.attributes.vehicle_details.model }}
        </p>
        <p class="card-text">
          <strong>License Plate:</strong>
          {{ reservation.data.attributes.vehicle_details.license_plate }}
        </p>
        <router-link :to="`/reservations`" class="btn btn-warning"
          >Back</router-link
        >
      </div>
    </div>
    <div v-else>
      <p>Loading...</p>
    </div>
  </div>
</template>

<script>
import reservationService from '../../services/reservation'

export default {
  data() {
    return {
      reservation: {},
    }
  },
  async created() {
    const response = await reservationService.getReservation(
      this.$route.params.id
    )
    this.reservation = response.data
  },
}
</script>
