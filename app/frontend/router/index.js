import { createRouter, createWebHistory } from 'vue-router'
import Home from '../pages/Home.vue'
import Login from '../pages/Login.vue'
import Register from '../pages/Register.vue'
import VehicleIndex from '../pages/vehicle/index.vue'
import VehicleEdit from '../pages/vehicle/edit.vue'
import VehicleNew from '../pages/vehicle/new.vue'
import VehicleShow from '../pages/vehicle/show.vue'
import UserIndex from '../pages/user/index.vue'
import UserEdit from '../pages/user/edit.vue'
import UserNew from '../pages/user/new.vue'
import UserShow from '../pages/user/show.vue'
import auth from './middleware/auth'

const routes = [
  { path: '/', component: Home },
  { path: '/login', component: Login },
  { path: '/register', component: Register },
  { path: '/vehicles', component: VehicleIndex, meta: { middleware: auth } },
  { path: '/vehicles/new', component: VehicleNew, meta: { middleware: auth } },
  { path: '/vehicles/:id', component: VehicleShow, meta: { middleware: auth } },
  {
    path: '/vehicles/:id/edit',
    component: VehicleEdit,
    meta: { middleware: auth },
  },
  { path: '/users', component: UserIndex, meta: { middleware: auth } },
  { path: '/users/new', component: UserNew, meta: { middleware: auth } },
  { path: '/users/:id', component: UserShow, meta: { middleware: auth } },
  { path: '/users/:id/edit', component: UserEdit, meta: { middleware: auth } },
]

const router = createRouter({
  history: createWebHistory(),
  routes,
})

router.beforeEach((to, from, next) => {
  if (to.meta.middleware) {
    const middleware = to.meta.middleware
    middleware({ next, router })
  } else {
    next()
  }
})

export default router
