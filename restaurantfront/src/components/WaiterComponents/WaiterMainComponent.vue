<script setup>

import { ref } from 'vue';
import  axios  from 'axios';

const products = ref([]);

const getProducts = async () => {
    await axios.get('http://127.0.0.1:8000/api/products')
    .then((res)=> {
        products.value = res.data;
        })
    .catch((err)=>{
        console.log("respuesta srve",err);
    });
}

//Switch case de descion de que prodcuto solicitar, funciona de filtro
const callProducts = (type) => {
    switch (type) {
        case 'entrada':
            console.log("entro a entrada");
            break;
        case 'ppicar':
            console.log("entro a ppicar");
            break;
        case 'asados':
            console.log("entro a asados");
            break;
        case 'dominyfest':
            console.log("entro a dominyfest");
            break;
        case 'pescados':
            console.log("entro a pescados");
            break;
        case 'comidarap':
            console.log("entro a comidarap");
            break;
        case 'postres':
            console.log("entro a postres");
            break;
        case 'bebicali':
            console.log("entro a bebicali");
            break;
        case 'addic':
            console.log("entro a addic");
            break;
        case 'patacones':
            console.log("entro a patacones");
            break;
        case 'bebidas':
            console.log("entro a bebidas");
            break;
        case 'cervezas':
            console.log("entro a cervezas");
            break;
        case 'licores':
            console.log("entro a licores");
            break;
        case 'vinos':
            console.log("entro a vino");
            break;
        case 'cocteles':
            console.log("entro a cocteles");
            break;
    }
}
getProducts();


</script>

<template>

    <div class="gp-5 lg:px-20 lg:py-10 bg-gray-200">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-lg gap-3 sm:gap-8 text-center font-semibold">
            
            <a href="" @click="callProducts('entrada')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Entradas</p>
            </a>
            <a href="" @click="callProducts('ppicar')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Pá picar</p>
            </a>
            <a href="" @click="callProducts('asados')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Asados</p>
            </a>
            <a href="" @click="callProducts('dominyfest')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Domingos y Festivos</p>
            </a>
            <a href="" @click="callProducts('pescados')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Pescados</p>
            </a>
            <a href="" @click="callProducts('comidarap')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Comida rápida</p>
            </a>
            <a href="" @click="callProducts('postres')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Postres</p>
            </a>
            <a href="" @click="callProducts('bebicali')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Bebidas calientes</p>
            </a>
            <a href="" @click="callProducts('addic')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Adicionales</p>
            </a>
            <a href="" @click="callProducts('patacones')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Patacones</p>
            </a>
            <a href="" @click="callProducts('bebidas')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Bebidas</p>
            </a>
            <a href="" @click="callProducts('cervezas')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Cervezas</p>
            </a>
            <a href="" @click="callProducts('licores')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Licores</p>
            </a>
            <a href=""  @click="callProducts('vinos')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Vinos</p>
            </a>
            <a href="" @click="callProducts('cocteles')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Cocteles</p>
            </a>
        </div>
    </div>
    <div class="p-5 lg:px-20 lg:py-10 bg-gray-200">
        
        <article class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-3xl gap-5 sm:gap-10 text-center font-bold">
            <div v-for="product in products" :key="product.name">    
                <a href="">
                    <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-red-200 hover:to-red-500 hover:border border-black">
                        <h1>{{ product.name}}</h1>
                        <div class="flex justify-center items-center h-full">
                            <img src="https://cdn-icons-png.flaticon.com/512/2103/2103848.png" alt="imagen del producto" class="h-36">
                        </div>
                    </div>
                </a>
            </div>
        </article>
    </div>
</template>