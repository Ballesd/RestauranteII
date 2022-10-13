<script setup>

import { ref } from 'vue';
import  axios  from 'axios';

const products = ref([]);
const ide  = ref(0);
const shoppLetter = ref([]);

const isOpen = ref(false);

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

const listArticle = () =>{
    let fill = JSON.parse(localStorage.getItem("shoppLetter"));
    
    if(fill !== null){
        shoppLetter.value = fill;
        console.log("shoppLetter",shoppLetter.value);
    }
    else{
        shoppLetter.value = [];
        console.log("shoppLetter else",shoppLetter.value);
    }
};

const addLetterProduct = (producto) => {
    console.log("producto",producto);
    localStorage.setItem("shoppLetter",JSON.stringify(producto));
}

listArticle();
</script>

<template>

    <div class="gp-5 lg:px-20 lg:py-10 bg-gray-200">
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-lg gap-3 sm:gap-8 text-center font-semibold">

            <button @click="getProducts('1')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Entradas</p>
            </button>
            <button @click="getProducts('2')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Pá picar</p>
            </button>
            <button @click="getProducts('3')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Asados</p>
            </button>
            <button @click="getProducts('4')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Domingos y Festivos</p>
            </button>
            <button @click="getProducts('5')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Pescados</p>
            </button>
            <button @click="getProducts('6')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Comida rápida</p>
            </button>
            <button @click="getProducts('7')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Postres</p>
            </button>
            <button @click="getProducts('8')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Bebidas calientes</p>
            </button>
            <button @click="getProducts('9')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Adicionales</p>
            </button>
            <button @click="getProducts('10')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Patacones</p>
            </button>
            <button @click="getProducts('11')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Bebidas</p>
            </button>
            <button @click="getProducts('12')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Cervezas</p>
            </button>
            <button @click="getProducts('13')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Licores</p>
            </button>
            <button @click="getProducts('14')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Vinos</p>
            </button>
            <button @click="getProducts('15')" class = "rounded-lg p-2 bg-white shadow-lg flex flex-col hover:bg-gradient-to-r hover:from-orange-200 hover:to-orange-500 hover:border border-black">
                <p>Cocteles</p>
            </button>
        </div>
    </div>
    <div class="p-5 lg:px-20 lg:py-10 bg-gray-200">
        
        <article class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-3xl gap-5 sm:gap-10 text-center font-bold">
            <div v-for="product in products" :key="product.name">    
                <a>
                    <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-red-200 hover:to-red-500 hover:border border-black">
                        <h1>{{ product.name}}</h1>
                        <div class="flex justify-center items-center h-full">
                            <img src="https://cdn-icons-png.flaticon.com/512/2103/2103848.png" alt="imagen del producto" class="h-32">
                        </div>
                        <button @click="addLetterProduct(product)">AGgregar al carrito</button>
                    </div>
                </a>
            </div>
        </article>
    </div>
    
<div class="container mx-auto">
    <div class="flex justify-center">
      <button
        @click="isOpen = true"
        class="px-6 py-2 text-white bg-blue-600 rounded shadow"
        type="button"
      >
        Open Model
      </button>

      <div
        v-show="isOpen"
        class="
          absolute
          inset-0
          flex
          items-center
          justify-center
          bg-gray-700 bg-opacity-50
        "
      >
        <div class="max-w-2xl p-6 bg-white rounded-md shadow-xl">
          <div class="flex items-center justify-between">
            <h3 class="text-2xl">Model Title</h3>
            <svg
              @click="isOpen = false"
              xmlns="http://www.w3.org/2000/svg"
              class="w-8 h-8 text-red-900 cursor-pointer"
              fill="none"
              viewBox="0 0 24 24"
              stroke="currentColor"
            >
              <path
                stroke-linecap="round"
                stroke-linejoin="round"
                stroke-width="2"
                d="M10 14l2-2m0 0l2-2m-2 2l-2-2m2 2l2 2m7-2a9 9 0 11-18 0 9 9 0 0118 0z"
              />
            </svg>
          </div>
          <div class="mt-4">
            <p class="mb-4 text-sm">
              Lorem ipsum dolor sit, amet consectetur adipisicing elit.
              Voluptatibus qui nihil laborum quaerat blanditiis nemo explicabo
              voluptatum ea architecto corporis quo vitae, velit temporibus
              eaque quisquam in quis provident necessitatibus.
            </p>
            <button
              @click="isOpen = false"
              class="px-6 py-2 text-blue-800 border border-blue-600 rounded"
            >
              Cancel
            </button>
            <button class="px-6 py-2 ml-2 text-blue-100 bg-blue-600 rounded">
              Save
            </button>
          </div>
        </div>
      </div>
    </div>
    </div>

</template>