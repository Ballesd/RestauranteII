<script setup>
import { ref } from 'vue';
import  axios  from 'axios';

const products = ref([]);
const editar = ref(true);
const Error = ref('');

const inputs = {
    id: ref(''),
    name: ref(''),
    description: ref(''),
    price: ref(''),
    image: ref(''),
    type: ref(''),
}

//Trae los productos totales del sistema
const getProducts = async () => {
    await axios.get('http://127.0.0.1:8000/api/products')
    .then((res)=> {
        products.value = res.data;
    })
    .catch((err)=>{
        Error.value = err.response.data;
        console.log(Error.value);
        console.log("respuesta srve",err);
    });
}
//Crea un nuevo producto
const createProduct = async () => {
    consolo.log("entro a crear ---------------- ----------");
    let producto = {
        name: inputs.name.value,
        description: inputs.description.value,
        price: inputs.price.value,
        image: inputs.image.value,
        type: inputs.type.value
    }
    inputs.name.value = '';
    inputs.description.value = '';
    inputs.price.value = '';
    inputs.image.value = '';
    inputs.type.value = '';
    axios.post('http://127.0.0.1:8000/api/products', producto)
    .then((res)=> {
        console.log(res);
        getProducts();
    })
    .catch((err)=>{
        Error.value = err.response.data;
        console.log(Error.value);
        console.log("respuesta srve",err);
    });
}
//Edita un producto existente
const editProduct = async () => {
    const ide = String(inputs.id.value);
    const producto = {
        name: inputs.name.value,
        description: inputs.description.value,
        price: parseInt(inputs.price.value,10),
        image: inputs.image.value,
        type: inputs.type.value
    }
    inputs.id.value = '';
    inputs.name.value = '';
    inputs.description.value = '';
    inputs.price.value = '';
    inputs.image.value = '';
    inputs.type.value = '';

    await axios.put('http://127.0.0.1:8000/api/products/'+ide, producto)
    .then((res)=> {
        console.log(res);
        getProducts();
    })
    .catch((err)=>{
        Error.value = err.response.data;
        console.log(Error.value);
        console.log("respuesta srve",err);
    });
}

//Borra un producto
const deleteProduct = async (id) => {
    const ide = String(id);
    const res = await axios.delete('http://127.0.0.1:8000/api/products/'+ide);
    location.reload();
}

const editarProducto = (id) => { //Pone los valores en el input para editar
    editar.value = false
    const producto = products.value.find(producto => producto.id === id)
    inputs.id.value = producto.id;
    inputs.name.value = producto.name
    inputs.description.value = producto.description
    inputs.price.value = producto.price
    inputs.image.value = producto.image
    inputs.type.value = producto.type
}


getProducts();
</script>

<template>
    <div class="container">
        <div class="row">
            <div class="col">
                <table class="w-full border">
                    <thead>
                        <tr>
                            <th class="border">ID</th>
                            <th class="border">Nombre</th>
                            <th class="border">Descripción</th>
                            <th class="border">Precio</th>
                            <th class="border">Imagen</th>
                            <th class="border">Tipo</th>
                            <th class="border">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="product in products" :key="product.name">
                            <td class="border">{{ product.id }}</td>
                            <td class="border">{{ product.name }}</td>
                            <td class="border">{{ product.description }}</td>
                            <td class="border">{{ product.price }}</td>
                            <td class="border">{{ product.image }}</td>
                            <!--<td class="border"><img :src="product.image" alt="Imagen" class="w-20"></td>-->
                            <td class="border">{{ product.type }}</td>
                            <td class="border">
                                <button class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" @click="editarProducto(product.id)">Editar</button>
                                <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded" @click="deleteProduct(product.id)">Eliminar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <form class="w-full max-w-lg">
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                                Nombre
                            </label>
                            <input v-model="inputs.name.value" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-first-name" type="text" placeholder="Nombre">
                        </div>
                        <div class="w-full md:w-1/2 px-3">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                                Descripción
                            </label>
                            <input v-model="inputs.description.value" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-last-name" type="text" placeholder="Descripción">
                        </div>
                    </div>
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                                Precio
                            </label>
                            <input v-model="inputs.price.value" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-first-name" type="number" placeholder="Precio">
                        </div>
                        <div class="w-full md:w-1/2 px-3">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-last-name">
                                Imagen
                            </label>
                            <input v-model="inputs.image.value" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-last-name" type="text" placeholder="Imagen">
                        </div>
                    </div>
                    <div class="flex flex-wrap -mx-3 mb-6">
                        <div class="w-full md:w-1/2 px-3 mb-6 md:mb-0">
                            <label class="block uppercase tracking-wide text-gray-700 text-xs font-bold mb-2" for="grid-first-name">
                                Tipo
                            </label>
                            <input v-model="inputs.type.value" class="appearance-none block w-full bg-gray-200 text-gray-700 border border-gray-200 rounded py-3 px-4 mb-3 leading-tight focus:outline-none focus:bg-white focus:border-gray-500" id="grid-first-name" type="text" placeholder="Tipo del producto">
                        </div>
                    </div>
                    <div v-if="editar">
                        <button class="btn btn-primary" @click="createProduct()">Agregar</button>
                    </div>
                    <div v-else>
                        <button class = "btn btn-primary" @click="editProduct()">Editar</button>
                        <button class="btn btn-primary" @click="editar = false">Cancelar</button>
                    </div>
                </form> 
            </div>
        </div>
    </div>
</template>

