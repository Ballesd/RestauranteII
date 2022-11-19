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
        //console.log(orders.value);
    })
    .catch((error) => {
        console.log(error);
    });
}

//Edita el estado del pedido a preparado
const editOrder = async (id) => {
    await axios.put('http://127.0.0.1:8000/api/orders/' + id)
    .then((response) => {
        //console.log(response.data);
        location.reload();
    })
    .catch((error) => {
        console.log(error);
    });
}

getOrders();
</script>

<template>
    <div class="bg-gray-200">
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
                        <div class="flex justify-center items-center mt-8">
                            <button @click="editOrder(orden.id)" class="relative inline-flex items-center justify-center p-4 px-6 py-3 overflow-hidden font-medium text-indigo-600 transition duration-300 ease-out border-2 border-purple-500 rounded-full shadow-md group">
                                <span class="absolute inset-0 flex items-center justify-center w-full h-full text-white duration-300 -translate-x-full bg-purple-500 group-hover:translate-x-0 ease">
                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M14 5l7 7m0 0l-7 7m7-7H3"></path></svg>
                                </span>
                                <span class="absolute flex items-center justify-center w-full h-full text-purple-500 transition-all duration-300 transform group-hover:translate-x-full ease">Enviar Entrega</span>
                                <span class="relative invisible">Button Text</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</template>