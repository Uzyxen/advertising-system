<template>
     <button @click="execute">{{ witam }}</button>
     <br><br>
     <button @click="login">login</button>
     <br><br>
     <button @click="logout">logout</button>

     <HomeSection />
     <SearchForOffersSection />
     <RandomCompaniesSection />
</template>

<script setup>
     const headers = useRequestHeaders(['cookie']);

     const { data: witam, execute } = await useFetch('http://localhost/advertising-system/api/witam.php', { headers, credentials: 'include' });

     async function login() {
          await useFetch('http://localhost/advertising-system/api/login.php', { headers, credentials: 'include' });
     }

     async function logout() {
          await useFetch('http://localhost/advertising-system/api/logout.php', { headers, credentials: 'include' });
     }     

</script>

<style scoped>

</style>