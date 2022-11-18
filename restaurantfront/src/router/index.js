import { createRouter, createWebHistory } from 'vue-router';  
import TableComponent from '../components/AdminComponents/AdminTableComponent.vue';
import MainComponent from '../components/WaiterComponents/WaiterMainComponent.vue';
import CookComponent from '../components/CookComponents/CookMainComponent.vue';
import HelloWorld from '../components/MainIndex.vue';


const routes = createRouter({
  history: createWebHistory(),
  routes: [
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
      path: '/cook',
      name: 'HomeCook',
      component: CookComponent
    },
    {
      path: '/',
      name: 'Home',
      component: HelloWorld
    }
  ]
});
export default routes;
