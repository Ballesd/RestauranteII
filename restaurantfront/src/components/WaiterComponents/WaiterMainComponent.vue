<script setup>

import { ref } from 'vue';
import  axios  from 'axios';

const products = ref([]);
const ide  = ref(0);
const shoppLetter = ref([]);
const shoppLetter2 = ref([]);

const isOpen = ref(false);

//Trae los productos con la API de la base de datos
const getProducts = async (id) => {
    ide.value = String(id)
    await axios.post('http://127.0.0.1:8000/api/products',{
        id:ide.value
    })
    .then((res)=> {
        products.value = res.data;
        })
    .catch((err)=>{
        console.log("respuesta srve",err);
    });
};
//Agrega los productos al carrito y tiene un uso de local storage
const listArticle = () =>{
    let fill = JSON.parse(localStorage.getItem("shoppLetter"));

    if(fill !== null){
        shoppLetter.value = fill;
    }
    else{
        shoppLetter.value = [];
    }
};
//Agrega los productos al carrito y tiene un uso de local storage
const addLetterProduct = (producto) => {
    
    for (let i = 0; i < shoppLetter2.value.length; i++) {
        if(shoppLetter2.value[i] === producto){
        //shoppLetter2.value[i].quantity += 1;
            console.log("esta");
        }
 
    }
    shoppLetter2.value.push(producto);
    localStorage.setItem("shoppLetter",JSON.stringify(producto));
}

//Elimina los productos del carrito y tiene un uso de local storage
const dropLetterProduct = (index) => {
    shoppLetter2.value.splice(index,1);
    localStorage.setItem("shoppLetter",JSON.stringify(shoppLetter));
}

//El mesero abre una nueva orden o pedido hacia la cocina 
const addNewOrder = async () => {
    console.log("shoppLetter2",shoppLetter2.value);
    const cantidad = ref(1);
    const total = ref(0);
    for(let i =  0; i < shoppLetter2.value.length; i++){
        total.value += shoppLetter2.value[i].price;
    }
    console.log("total",total.value);
}


listArticle();
</script>

<template>

    <div class="gp-5 lg:px-20 lg:py-10 bg-gray-200">
        <div class="grid grid-cols-2 sm:grid-cols-2 md:grid-cols-3 text-lg gap-3 sm:gap-8 text-center font-semibold">

            <button @click="getProducts('1')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <span class=""> Entrada </span>
            </button>
            <button @click="getProducts('2')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Pá picar</p>
            </button>
            <button @click="getProducts('3')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Asados</p>
            </button>
            <button @click="getProducts('4')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Domingos y Festivos</p>
            </button>
            <button @click="getProducts('5')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Pescados</p>
            </button>
            <button @click="getProducts('6')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Comida rápida</p>
            </button>
            <button @click="getProducts('7')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Postres</p>
            </button>
            <button @click="getProducts('8')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Bebidas calientes</p>
            </button>
            <button @click="getProducts('9')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Adicionales</p>
            </button>
            <button @click="getProducts('10')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Patacones</p>
            </button>
            <button @click="getProducts('11')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Bebidas</p>
            </button>
            <button @click="getProducts('12')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Cervezas</p>
            </button>
            <button @click="getProducts('13')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Licores</p>
            </button>
            <button @click="getProducts('14')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Vinos</p>
            </button>
            <button @click="getProducts('15')" class = "text-black bg-gradient-to-r from-teal-300 via-teal-400 to-teal-400 hover:bg-gradient-to-br focus:ring-4 focus:outline-none focus:ring-teal-400 dark:focus:ring-teal-600 shadow-lg dark:shadow-lg dark:shadow-teal-800/80 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2">
                <p>Cocteles</p>
            </button>
            <!--MODAL DEL ENVIO DE PEDIDOS-->
            <button
                @click="isOpen = true" class="text-white bg-gradient-to-br from-purple-600 to-blue-500 hover:bg-gradient-to-bl focus:ring-4 focus:outline-none focus:ring-blue-300 dark:focus:ring-blue-800 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2" type="button">
                Pedido
            </button>
            <div v-show="isOpen" class="absolute inset-0 flex items-center justify-center bg-gray-700 bg-opacity-50">
                <div class="max-w-2xl p-6 bg-white rounded-md shadow-xl">
                    <div class="flex items-center justify-between">
                        <h3 class="text-2xl">Platos del pedido</h3>
                        <svg @click="isOpen = false" xmlns="http://www.w3.org/2000/svg" class="w-8 h-8 text-red-900 cursor-pointer"
                            fill="none" viewBox="0 0 24 24" stroke="currentColor" >
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"/>
                        </svg>
                    </div>
                    <div class="mt-4">
                        <div class="md:px-32 py-8 w-full">
                            <div class="shadow overflow-hidden rounded border-b border-gray-200">
                                <table class="min-w-full bg-white">
                                    <thead class="bg-gray-800 text-white">
                                        <tr>
                                            <th class="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">Plato</th>
                                            <th class="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">Precio</th>
                                            <th class="w-1/3 text-left py-3 px-4 uppercase font-semibold text-sm">Edición</th>
                                        </tr>
                                    </thead>
                                    <tbody class="text-gray-700">
                                        <tr v-for="(item,index) in shoppLetter2" :key="index">
                                            <td class="w-1/3 text-left py-3 px-4">{{item.name}}</td>
                                            <td class="text-left py-3 px-4">{{item.price}}</td>
                                            <td>
                                                <button @click="dropLetterProduct(index)" class="bg-red-500 hover:bg-red-700 text-white h-1/3 py-1/3 px-1/3 rounded">
                                                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path></svg>
                                                </button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <button @click="isOpen = false" class="text-amber-300 hover:text-white border border-amber-300 hover:bg-amber-400 focus:ring-4 focus:outline-none focus:ring-amber-200 font-medium rounded-lg text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:border-amber-200 dark:text-amber-200 dark:hover:text-white dark:hover:bg-amber-300 dark:focus:ring-amber-500">Cerrar</button>
                        <button @click="addNewOrder()" class="text-white bg-green-600 hover:bg-green-700 focus:outline-none focus:ring-4 focus:ring-green-200 font-medium rounded-full text-sm px-5 py-2.5 text-center mr-2 mb-2 dark:bg-green-500 dark:hover:bg-green-600 dark:focus:ring-green-700">Enviar pedido</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="p-5 lg:px-20 lg:py-10 bg-gray-200">
        <article class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-3xl gap-5 sm:gap-10 text-center font-bold">
            <div v-for="product in products" :key="product.name">    
                <button @click="addLetterProduct(product)">
                    <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-red-200 hover:to-red-500 hover:border border-black">
                        <h1>{{ product.name}}</h1>
                        <div class="flex justify-center items-center h-full">
                            <img src="https://cdn-icons-png.flaticon.com/512/3183/3183463.png" alt="imagen del producto" class="h-32">
                        </div>
                    </div>
                </button>
            </div>
            <!-- A few examples from Hero Icons -->

        </article>
    </div>
    

</template>