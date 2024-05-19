<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible" >
        <CancelApply :application="selectedApplication"/>
    </ModalBlock>

    <div id="main-grid">
        <div class="user-application" v-for="application in userApplications" v-if="userApplications != false" @click="showApplication(application)">
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
        else if(status === 'zaakceptowana') return '#4BB543';
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
        display: grid;
        grid-template-columns: repeat(2, 1fr);;
        gap: 10px;
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
        border: 1px solid #DDD;
        display: flex;
        gap: 10px;
        padding: 10px;
        position: relative;
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
</style>