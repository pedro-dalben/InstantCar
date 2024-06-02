import axios from '../utils/axios'

export default {
  createVehicle(vehicleData) {
    return axios.post('api/vehicles', vehicleData)
  },
  updateVehicle(id, vehicleData) {
    return axios.put(`/api/vehicles/${id}`, vehicleData)
  },
  getVehicle(id) {
    return axios.get(`/api/vehicles/${id}`)
  },
  getVehicles() {
    return axios.get('/api/vehicles')
  },
  deleteVehicle(id) {
    return axios.delete(`/api/vehicles/${id}`)
  },
}
