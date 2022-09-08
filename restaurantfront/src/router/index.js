import { createRouter, createWebHistory } from 'vue-router'
//import AdminView from '../views/AdminView'

const routes = [

  //forma #1 de rutas----------------------------------------------------------
  {
    path: '/admin/homead',
    name: 'HomeAdmin',
    component: () => import( '../views/AdminView/HomeAdminView.vue')
    
  },

  //forma #2 de rutas-----------------RUTAS DE LAS NUEVAS VISTAS DE AUTH-------------------------
 /* {
    path: '/Login',
    name: 'Ingresar',
    component: () => import(/* webpackChunkName: "about" */ /*'../views/LoginView.vue')
  },*/

]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router;
