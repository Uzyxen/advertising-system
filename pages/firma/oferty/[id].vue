<template>
    <ModalBlock :is-visible="isModalVisible" @close="isModalVisible = false">
        <ManageApplication :user="selectedUser" />
    </ModalBlock>

    <div id="container">
        <PrevPageButton />

        <SectionTitle>Oferta {{ $route.params.id }}</SectionTitle>

        <div id="content">
            <h2>Aplikujący</h2>

            <hr>

            <div id="applications">
                <div class="applying-user" v-for="user in applyingUsers">
                    <div class="image">
                        <img src="/user/pexels-photo-771742.webp">
                    </div>

                    <div class="info">
                        <h2>{{ user.imie }} {{ user.nazwisko }}</h2>
                        <p>{{ user.stanowisko }}</p>

                        <div style="display: flex; gap: 10px;">
                            <PurpleButton @button-clicked="isModalVisible = true; selectedUser = user">Rozpatrz</PurpleButton>
                            <ColorButton @button-clicked="navigateTo('/uzytkownicy/' + user.uzytkownik_id)" :background-color="'#aaa'">Zobacz profil</ColorButton>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    const route = useRoute();
    const { data: applyingUsers } = await useFetch('http://localhost/advertising-system/backend/api/application/GetApplyingUsers.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });

    // data
    const isModalVisible = ref(false);
    const selectedUser = ref();
</script>

<style scoped>
    #container {
        padding: 20px 150px;
        min-height: 100vh;
    }

    #applications {
        display: flex;
        flex-direction: column;
        gap: 20px;
    }
    
    .applying-user {
        background-color: var(--asc-bg-alt);
        padding: 20px;
        display: flex;
        gap: 20px;
        border-left: 10px solid var(--asc-bg);
        border-bottom: 1px solid #DDD;
    }

    .image {
        width: 150px;
        height: 150px;
    }

    .image img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        object-fit: cover;
    }

    .info {
        display: flex;
        flex-direction: column;
        margin-top: 20px;
        gap: 5px;
    }

    p {
        color: var(--asc-txt);
        flex: 1;
    }
</style>