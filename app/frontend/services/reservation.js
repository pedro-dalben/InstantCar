import axios from '../utils/axios'

export default {
  createReservation(reservation) {
    return axios.post('/api/reservations', { reservation })
  },
  updateReservation(id, reservation) {
    return axios.put(`/api/reservations/${id}`, { reservation })
  },
  getReservation(id) {
    return axios.get(`/api/reservations/${id}`)
  },
  getReservations() {
    return axios.get('/api/reservations')
  },
}
