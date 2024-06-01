import axios from '../utils/axios'

export default {
  login(email, password) {
    return axios.post('/users/sign_in', {
      user: {
        email: email,
        password: password,
      },
    })
  },
  logout() {
    localStorage.removeItem('auth_token')
    return axios.delete('/users/sign_out')
  },
  register(full_name, cpf, birth_date, email, password, password_confirmation) {
    return axios
      .post('/users', {
        user: {
          full_name: full_name,
          cpf: cpf,
          birth_date: birth_date,
          email: email,
          password: password,
          password_confirmation: password_confirmation,
        },
      })
      .then((response) => {
        const token = response.headers['authorization'].split(' ')[1]
        localStorage.setItem('auth_token', token)
        return response
      })
  },
  currentUser() {
    return axios.get('/users/current')
  },
}
