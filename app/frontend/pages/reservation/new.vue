<template>
  <div class="container mt-4">
    <h1>Create Reservation</h1>
    <ReservationForm @submit="createReservation" />
  </div>
</template>

<script>
import ReservationForm from '../../components/ReservationForm.vue'
import reservationService from '../../services/reservation'

export default {
  components: { ReservationForm },
  methods: {
    async createReservation(reservation) {
      await reservationService.createReservation(reservation)
      this.$router.push('/reservations')
    },
  },
}
</script>
