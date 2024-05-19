<template>
    <div class="wrapper" v-if="response === false">
        <section id="user-data">
            <div class="image">
                <img src="/user/pexels-photo-771742.webp" alt="Zdjęcie profilowe użytkownika">
            </div>

            <div class="main-data">
                <h2>{{ userData.imie }} {{ userData.nazwisko }}</h2>
                <h3>{{ userData.stanowisko }}</h3>
            </div>
        </section>

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. --><path d="M169.4 470.6c12.5 12.5 32.8 12.5 45.3 0l160-160c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L224 370.8 224 64c0-17.7-14.3-32-32-32s-32 14.3-32 32l0 306.7L54.6 265.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l160 160z"/></svg>
        <section id="offer-data">
            <div class="image">
                <img src="/company/gizlomar.png" alt="Logo firmy">
            </div>

            <div class="main-data">
                <h2>{{ offer.tytul }}</h2>
                <h4>{{ offer.nazwa_firmy }}</h4>
                <h3>{{ offer.wynagrodzenie_min.toLocaleString() }} - {{ offer.wynagrodzenie_max.toLocaleString() }} zł / {{ offer.czestotliwosc_wynagrodzenia }}</h3>
            </div>
        </section>
    </div>

    <div class="wrapper" v-else>
        <SuccessAnimatedMark style="margin-top: 80px;" />

        <h2 id="success-header">Pomyślnie zaaplikowano!</h2>
    </div>

    <ModalSaveButton @button-clicked="applyForAJob" v-if="response === false">Potwierdź</ModalSaveButton>
</template>

<script setup>
    const { data: userData } = await useFetch('http://localhost/advertising-system/backend/api/user/GetUserData.php', { credentials: 'include', responseType: 'json', method: 'post' });

    // props
    const props = defineProps(['offer']);
    const { data: response } = await useFetch('http://localhost/advertising-system/backend/api/application/GetApplicationStatus.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': props.offer.ogloszenie_id } });

    // emits

    const emit = defineEmits(['applied']);

    // functions

    async function applyForAJob() {
        if(response.value === false) {
            response.value = await $fetch('http://localhost/advertising-system/backend/api/application/CreateApplication.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'offer_id': props.offer.ogloszenie_id } });

            emit('applied');
        }
    }
</script>

<style scoped>
    .wrapper {
        display: flex;
        flex-direction: column;
        width: 100%;
        gap: 20px;
    }

    #success-header {
        text-align: center;
        padding-bottom: 20px;
        font-size: 25px;
    }

    #success-svg {
        margin-top: 80px;
    }

    #user-data {
        margin-top: 80px;
        color: var(--asc-txt-sec);
    }

    section {
        width: calc(100% - 40px);
        display: flex;
        gap: 10px 20px;
        min-height: 150px;
        border: 1px solid var(--asc-bg-border);
        padding: 15px;
        border-radius: 2px;
    }

    .image {
        width: 150px;
        height: 150px;
    }

    .image img {
        width: 100%;
        height: 100%;
        border-radius: 50%;
        border: 1px solid var(--asc-bg-border);
        object-fit: cover;
    }

    .main-data {
        display: flex;
        flex-direction: column;
        margin-top: 20px;
        gap: 5px;
    }

    div > h2 {
        color: var(--asc-txt-sec);
        font-size: 20px;
    }

    div > h3 {
        color: var(--asc-txt);
        font-size: 15px;
    }

    div > h4 {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 14px;
    }

    svg {
        width: 10%;
        align-self: center;
        fill: var(--asc-txt-sec);
    }
</style>