<script setup>
import { ref } from 'vue';


</script>

<template>
  <div class="p-5 lg:px-20 lg:py-10 bg-gray-200">
    <article class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 text-3xl gap-5 sm:gap-10 text-center font-bold">
        <div>    
            <a href="../waiter">
                <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-emerald-200 hover:to-emerald-500 hover:border border-black">
                    <h6>Mesero</h6>
                    <div class="flex justify-center items-center h-full">
                        <img src="../assets/camarero.png" alt="imagen del mesero" class="h-32">
                    </div>
                </div>
            </a>
        </div>
        <div>    
            <a href="">
                <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-purple-200 hover:to-purple-500 hover:border border-black">
                    <h6>Cocinero</h6>
                    <div class="flex justify-center items-center h-full">
                        <img src="../assets/cocinero.png" alt="imagen del cocinero" class="h-32">
                    </div>
                </div>
            </a>
        </div>
        <div>    
            <a href="../admin/home">
                <div class="h-72 rounded-2xl p-5 bg-white shadow-2xl flex flex-col hover:bg-gradient-to-r hover:from-indigo-200 hover:to-indigo-500 hover:border border-black">
                    <h6>Gestor</h6>
                    <div class="flex justify-center items-center h-full">
                        <img src="../assets/administrador.png" alt="imagen del gestor" class="h-32">
                    </div>
                </div>
            </a>
        </div>
    </article>
  </div>
</template>

<style scoped>

</style>
