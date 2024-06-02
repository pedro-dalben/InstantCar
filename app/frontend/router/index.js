import { createRouter, createWebHistory } from 'vue-router'
import VehicleList from '../pages/VehicleList.vue'
import VehicleCreate from '../pages/VehicleCreate.vue'
import VehicleEdit from '../pages/VehicleEdit.vue'
import VehicleShow from '../pages/VehicleShow.vue'
import Login from '../pages/Login.vue'
import Register from '../pages/Register.vue'
import Home from '../pages/Home.vue'
import auth from './middleware/auth'

const routes = [
  { path: '/', component: Home, meta: { middleware: auth } },
  { path: '/login', component: Login },
  { path: '/register', component: Register },
  {
    path: '/vehicles',
    component: VehicleList,
    meta: { middleware: auth },
  },
  {
    path: '/vehicles/new',
    component: VehicleCreate,
    meta: { middleware: auth },
  },
  {
    path: '/vehicles/:id/edit',
    component: VehicleEdit,
    meta: { middleware: auth },
  },
  {
    path: '/vehicles/:id',
    component: VehicleShow,
    meta: { middleware: auth },
  },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

router.beforeEach(async (to, from, next) => {
  if (!to.meta.middleware) {
    return next()
  }

  const middleware = to.meta.middleware

  return middleware({
    next,
    router,
  })
})

export default router
