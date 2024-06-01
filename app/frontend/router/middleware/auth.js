import authService from '../../services/auth'

export default async function auth({ next, router }) {
  try {
    const response = await authService.currentUser()
    if (!response.data) {
      return router.push('/login')
    }
    return next()
  } catch (error) {
    return router.push('/login')
  }
}
