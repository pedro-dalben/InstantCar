import axios from '../utils/axios'

export default {
  getUsers() {
    return axios.get('/api/users')
  },
  getUser(id) {
    return axios.get(`/api/users/${id}`)
  },
  createUser(user) {
    return axios.post('/api/users', { user })
  },
  updateUser(id, user) {
    return axios.put(`/api/users/${id}`, { user })
  },
  deleteUser(id) {
    return axios.delete(`/api/users/${id}`)
  },
}
