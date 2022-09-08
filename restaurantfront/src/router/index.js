import { createRouter, createWebHistory } from 'vue-router'
import TableComponent from '../components/AdminComponents/TableComponent.vue'
//import AdminView from '../views/AdminView'

const routes = [

  //forma #1 de rutas----------------------------------------------------------
  {
    path: '/admin/home',
    name: 'HomeAdmin',
    component: TableComponent
    
  },


]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router;
