<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible" >
        <CancelApply :application="selectedApplication" @cancel="isModalVisible = false" @deleted="(id) => userApplications = userApplications.filter(element => element.application_id !== id)"/>
    </ModalBlock>

    <div id="main-grid">
        <TransitionGroup style="position: relative;" name="list" v-if="userApplications != false">
            <div class="user-application" v-for="application in userApplications" :key="application.application_id" @click="showApplication(application)">
                <div class="delete">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                        <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M135.2 17.7C140.6 6.8 151.7 0 163.8 0H284.2c12.1 0 23.2 6.8 28.6 17.7L320 32h96c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 96 0 81.7 0 64S14.3 32 32 32h96l7.2-14.3zM32 128H416V448c0 35.3-28.7 64-64 64H96c-35.3 0-64-28.7-64-64V128zm96 64c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16zm96 0c-8.8 0-16 7.2-16 16V432c0 8.8 7.2 16 16 16s16-7.2 16-16V208c0-8.8-7.2-16-16-16z"/>
                    </svg>
                </div>

                <div class="image">
                    <img src="/company/gizlomar.png" alt="Logo firmy">
                </div>

                <div class="main-info">
                    <NuxtLink :to="'/oferty/' + application.ogloszenie_id" class="title">{{ application.tytul }}</NuxtLink>
                    <NuxtLink :to="'/firmy/' + application.firma_id">{{ application.nazwa_firmy }}</NuxtLink>
                    <h4>{{ application.wynagrodzenie_min.toLocaleString() }} - {{ application.wynagrodzenie_max.toLocaleString() }} zł / {{ application.czestotliwosc_wynagrodzenia }}</h4>
                    <h5 :style="{ color: getColor(application.status) }">{{ application.status }}</h5>
                </div>
            </div>
        </TransitionGroup>

        <div id="no-item"v-else>
            <h2>Brak aplikacji</h2>
        </div>
    </div>
</template>

<script setup>
    // fetch data
    const { data: userApplications } = await useFetch('http://localhost/advertising-system/backend/api/application/GetUserApplications.php', { credentials: 'include', responseType: 'json', method: 'post' });

    // variables
    const isModalVisible = ref(false);
    const selectedApplication = ref();

    function getColor(status) {
        if(status === 'oczekująca') return '#ffcc00';
        else if(status === 'odrzucona') return '#ff3333';
        else if(status === 'zatwierdzona') return '#4BB543';
    }

    function showApplication(application) {
        selectedApplication.value = application;
        isModalVisible.value = true;
    }
</script>

<style scoped>
    #main-grid {
        width: 100%;
        padding: 20px;
        background-color: #FFF;
        padding-bottom: 200px;
    }

    .main-info {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .main-info a.title {
        color: var(--asc-txt-sec);
        font-weight: 700;
        font-size: 20px;
        width: -moz-fit-content;
        width: fit-content;
    }

    .main-info a {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 16px;
        width: -moz-fit-content;
        width: fit-content;
    }

    .main-info a:hover {
        text-decoration: underline;
        cursor: pointer;
    }

    .main-info h4 {
        color: var(--asc-txt);
        flex: 1;
    }

    .main-info h5 {
        font-size: 15px;
    }

    .user-application {
        background-color: var(--asc-bg-alt);
        border: 1px solid #DDD;
        display: flex;
        gap: 10px;
        padding: 10px;
        position: relative;
        margin: 10px 0
    }

    .user-application .delete {
        position: absolute;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        opacity: 0;
        transition: opacity .3s cubic-bezier(0.24,0.07,0.09,0.99), background-color .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .user-application:hover .delete {
        opacity: 1;
        background-color: #dddddd81;
    }

    .delete svg {
        height: 60%;
        fill: var(--asc-txt-sec);
    }

    .user-application:hover {
        cursor: pointer;
        background-color: #eee;
    }

    .image {
        width: 120px;
        height: 120px;
    }

    .image img {
        width: 100%;
        height: 100%;
    }

    #no-item {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 500px;
    }

    #no-item h2 {
        color: var(--asc-txt-ui-sec);
        font-size: 70px;
        opacity: 0.2;
    }

    .list-move,
    .list-enter-active,
    .list-leave-active {
        transition: all 0.5s ease;
    }

    .list-enter-from,
    .list-leave-to {
        opacity: 0;
        transform: translateX(30px);
    }

    .list-leave-active {
        position: absolute;
    }

    @media (max-width: 1015px) {
        #main-grid {
            width: calc(100% - 40px);
        }
    }
</style>