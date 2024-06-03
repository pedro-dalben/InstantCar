<template>
  <div class="container mt-5">
    <h1>Reservations</h1>
    <router-link to="/reservations/new" class="btn btn-primary mb-3"
      >Create New Reservation</router-link
    >
    <table class="table table-striped">
      <thead>
        <tr>
          <th>Client Name</th>
          <th>Vehicle</th>
          <th>Start Date</th>
          <th>End Date</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="reservation in reservations" :key="reservation.id">
          <td>{{ reservation.attributes.client_name }}</td>
          <td>
            {{ reservation.attributes.vehicle_details.brand }}
            {{ reservation.attributes.vehicle_details.model }} ({{
              reservation.attributes.vehicle_details.license_plate
            }})
          </td>
          <td>{{ reservation.attributes.formatted_start_date }}</td>
          <td>{{ reservation.attributes.formatted_end_date }}</td>
          <td>
            <router-link
              :to="`/reservations/${reservation.id}`"
              class="btn btn-info btn-sm"
              >Show</router-link
            >
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import reservationService from '../../services/reservation'

export default {
  data() {
    return {
      reservations: [],
    }
  },

  async created() {
    const response = await reservationService.getReservations()
    this.reservations = response.data.data
  },
}
</script>
