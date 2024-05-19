<template>
    <div id="main-grid">
        <div class="user-application" v-for="application in userApplications" v-if="userApplications != false">
            <div class="status" :style="{ backgroundColor: getColor(application.status) }"></div>

            <div class="image">
                <img src="/company/gizlomar.png" alt="Logo firmy">
            </div>

            <div class="main-info">
                <h2>{{ application.tytul }}</h2>
                <a>{{ application.nazwa_firmy }}</a>
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
    const { data: userApplications } = await useFetch('http://localhost/advertising-system/backend/api/application/GetUserApplications.php', { credentials: 'include', responseType: 'json', method: 'post' });

    function getColor(status) {
        if(status === 'oczekująca') return '#ffcc00';
        else if(status === 'odrzucona') return '#ff3333';
        else if(status === 'zaakceptowana') return '#4BB543';
    }
</script>

<style scoped>
    #main-grid {
        width: 100%;
        padding: 20px;
        background-color: #FFF;
        display: grid;
        grid-template-columns: repeat(1, 1fr);;
        gap: 10px;
        padding-bottom: 200px;
    }

    .status {
        position: absolute;
        bottom: -1px;
        left: -1px;
        width: 11px;
        height: calc(100% + 1px);
    }

    .main-info {
        display: flex;
        flex-direction: column;
        gap: 5px;
    }

    .main-info h2 {
        color: var(--asc-txt-sec);
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
        font-size: 20px;
    }

    .user-application {
        border: 1px solid #DDD;
        display: flex;
        gap: 10px;
        padding: 10px;
        position: relative;
        padding-left: 30px;
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