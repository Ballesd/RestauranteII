import { createRouter, createWebHistory } from 'vue-router';  
import TableComponent from '../components/AdminComponents/AdminTableComponent.vue';
import MainComponent from '../components/WaiterComponents/WaiterMainComponent.vue';
import HelloWorld from '../components/MainIndex.vue';

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
  {
    path: '/',
    name: 'Home',
    component: HelloWorld
  }


]

const router = createRouter({
  history: createWebHistory(),
  routes
})

export default router;
