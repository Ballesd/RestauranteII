import { createRouter, createWebHistory } from 'vue-router';  
import TableComponent from '../components/AdminComponents/AdminTableComponent.vue';
import MainComponent from '../components/WaiterComponents/WaiterMainComponent.vue';
//import AdminView from '../views/AdminView'

const routes = [

  //forma #1 de rutas----------------------------------------------------------
  {
    path: '/admin/home',
    name: 'HomeAdmin',
    component: TableComponent
    
  },
  {
    path: '/waiter',
    name: 'HomeWaiter',
    component: MainComponent
    
  },


]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router;
