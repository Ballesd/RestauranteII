<script setup>
  import {ref} from 'vue';

  const numero = ref(0);

  const aumentarNumero = () =>{
    numero.value++; 
  }

</script>

<template>
  <h1>Hola</h1>
  <p>{{numero}}</p>
  <button @click="aumentarNumero">Aumentar</button>
</template>

<style scoped>

</style>

