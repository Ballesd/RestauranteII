<script setup>
import { ref } from 'vue';
import axios from 'axios';

const cook = ref({});
const orders = ref([]);


//Se trae los datos del pedido que no se han preparado y recien se han pedido
const getOrders = async () => {
    await axios.get('http://127.0.0.1:8000/api/orders')
    .then((response) => {
        orders.value = response.data;
        console.log(orders.value);
    })
    .catch((error) => {
        console.log(error);
    });
}

getOrders();
</script>

<template>
    <div>
        <div>
            <h1 class="text-3xl font-bold text-center">Cocinero</h1>
        </div>
        <div>
            <!--grid md:grid-cols-2-->
            <div 
                class=' flex flex-col space-y-4 sm:space-x-2 flex-row items-center justify-center min-h-screen'>
                <div v-for="orden in orders" :key="orden.id"
                    class='flex flex-wrap flex-row sm:flex-col justify-center items-center w-full sm:w-1/4 p-5 bg-white rounded-md shadow-xl border-l-4 border-purple-300'>
                    <div class="flex justify-between w-full">
                        <div>
                            <div class="p-2">
                                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5"
                                    stroke="currentColor" class="w-6 h-6">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M20.25 7.5l-.625 10.632a2.25 2.25 0 01-2.247 2.118H6.622a2.25 2.25 0 01-2.247-2.118L3.75 7.5M10 11.25h4M3.375 7.5h17.25c.621 0 1.125-.504 1.125-1.125v-1.5c0-.621-.504-1.125-1.125-1.125H3.375c-.621 0-1.125.504-1.125 1.125v1.5c0 .621.504 1.125 1.125 1.125z" />
                                </svg>
                            </div>
                        </div>
                        <div>
                            <div style="padding-top: 0.1em; padding-bottom: 0.1rem"
                                class="flex items-center text-xs px-3 bg-purple-200 text-purple-800 rounded-full">0%</div>
                        </div>
                    </div>
                    <div >
                        <div class="font-serif text-lg text-center">
                            {{ orden.description }}
                        </div>
                        <div class="font-bold text-xs text-center">
                            precio: {{orden.total}}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>