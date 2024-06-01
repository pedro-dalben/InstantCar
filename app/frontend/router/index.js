import { createRouter, createWebHistory } from 'vue-router';
import Home from '../components/Home.vue';
import About from '../components/About.vue';
import VehicleForm from '../components/VehicleForm.vue';
import Login from '../components/Login.vue';
import Register from '../components/Register.vue';
import auth from './middleware/auth';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    meta: { middleware: auth }
  },
  {
    path: '/about',
    name: 'About',
    component: About,
    meta: { middleware: auth }
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/vehicles/new',
    name: 'VehicleForm',
    component: VehicleForm,
    meta: { middleware: auth }
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

router.beforeEach(async (to, from, next) => {
  if (!to.meta.middleware) {
    return next();
  }

  const middleware = to.meta.middleware;

  return middleware({
    next,
    router
  });
});

export default router;
