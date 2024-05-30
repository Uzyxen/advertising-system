<template>
    <div id="container">
        <SectionTitle>Oferta {{ $route.params.id }}</SectionTitle>

        <div id="content">
            <h2>Aplikujący</h2>

            <hr>

            <div id="applications">
                <NuxtLink v-for="user in applyingUsers" :to="'/uzytkownicy/' + user.uzytkownik_id">
                    <div class="applying-user">
                        {{ user.imie }} {{ user.nazwisko }}
                    </div>
                </NuxtLink>
            </div>
        </div>
    </div>
</template>

<script setup>
    const route = useRoute();
    const { data: applyingUsers } = await useFetch('http://localhost/advertising-system/backend/api/application/GetApplyingUsers.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });
</script>

<style scoped>
    #container {
        padding: 20px 150px;
    }

    #applications {
        display: flex;
        flex-direction: column;
    }
    
    .applying-user {
        background-color: var(--asc-bg-alt);
        padding: 20px;
    }
</style>