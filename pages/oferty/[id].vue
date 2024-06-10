<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible" >
        <ConfirmApply :offer="offerData" @applied="applied = true"/>
    </ModalBlock>

    <div id="main" v-if="offerData != false">
        <div id="main-top"> 
            <div id="offer-detail">
                <div id="image">
                    <img loading="lazy" :src="'/company/' + offerData.zdjecie_url" alt="Logo firmy">
                </div>

                <div id="offer-title">
                    <div>
                        <h2 id="title">{{ offerData.tytul }}</h2>
                        <NuxtLink id="company" :to="'/firmy/' + offerData.firma_id">{{ offerData.nazwa_firmy }}</NuxtLink>
                    </div>
                </div>
            </div>
        </div>

        <div id="additional-info">
            <div v-if="offerData.job_level">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M160 80c0-26.5 21.5-48 48-48h32c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H208c-26.5 0-48-21.5-48-48V80zM0 272c0-26.5 21.5-48 48-48H80c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V272zM368 96h32c26.5 0 48 21.5 48 48V432c0 26.5-21.5 48-48 48H368c-26.5 0-48-21.5-48-48V144c0-26.5 21.5-48 48-48z"/>
                </svg>

                <h3>{{ offerData.job_level }}</h3>
            </div>

            <div v-if="offerData.job_mode">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M184 48H328c4.4 0 8 3.6 8 8V96H176V56c0-4.4 3.6-8 8-8zm-56 8V96H64C28.7 96 0 124.7 0 160v96H192 320 512V160c0-35.3-28.7-64-64-64H384V56c0-30.9-25.1-56-56-56H184c-30.9 0-56 25.1-56 56zM512 288H320v32c0 17.7-14.3 32-32 32H224c-17.7 0-32-14.3-32-32V288H0V416c0 35.3 28.7 64 64 64H448c35.3 0 64-28.7 64-64V288z"/>
                </svg>

                <h3>{{ offerData.job_mode }}</h3>
            </div>

            <div  v-if="offerData.employment_type">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M448 256c0-106-86-192-192-192V448c106 0 192-86 192-192zM0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256z"/>
                </svg>

                <h3>{{ offerData.employment_type }}</h3>
            </div>
        </div>

        <div id="main-content">
            <div id="content-left">
                <div id="description">
                    <h2 class="header">Opis</h2>
                    <hr>

                    <p>
                        {{ offerData.opis }}
                    </p>
                </div>

                <div id="duties">
                    <h2 class="header">Zakres obowiązków</h2>
                    <hr>

                    <div>
                        <p class="list-element" v-for="duty in duties">
                            <span></span>
                            {{ duty.duty }}
                        </p>
                    </div>
                </div>

                <div id="requirements">
                    <h2 class="header">Wymagania</h2>
                    <hr>

                    <div>
                        <p class="list-element" v-for="requirment in requirements">
                            <span></span>
                            {{ requirment.requirement }}
                        </p>
                    </div>
                </div>
            </div>

            <div id="offer-action">
                <h2>{{ offerData.wynagrodzenie_min.toLocaleString() }} - {{ offerData.wynagrodzenie_max.toLocaleString() }} zł / mies.</h2>
                <h3>{{ offerData.umowa }}</h3>

                <PurpleButton @button-clicked="openModal" :class="{ disabled: applied }">{{ applied ? 'zaaplikowano' : 'aplikuj' }}</PurpleButton>
                <h3 id="ask-question">Zapytaj o ogłoszenie</h3>
            </div>
        </div>
    </div>

    <div v-else>
        <Page404 />
    </div>
</template>

<script setup>
import OffersList from '~/components/OffersList.vue';

    const isModalVisible = ref(false);

    const route = useRoute();
    const { data: offerData } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOfferData.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
    const { data: applied } = await useFetch('http://localhost/advertising-system/backend/api/application/GetApplicationStatus.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });
    const { data: requirements } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOfferRequirements.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });
    const { data: duties } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOfferDuties.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });

    function openModal() {
        if(applied.value === false) {
            isModalVisible.value = true
        }
    }
</script>

<style scoped>
    #main {
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .disabled {
        cursor: not-allowed;
        background-color: var(--asc-txt);
        opacity: 0.3;
    }

    hr {
        background-color: #DDD;
        height: 1px;
        border: none;
        margin: 0;
    }

    .list-element {
        position: relative;
        display: flex;
        align-items: center;
        gap: 15px;
    }

    .list-element span {
        background-color: var(--asc-bg);
        opacity: 0.5;
        width: 10px;
        height: 10px;
        border-radius: 50%;
        left: 0;
    }

    #main-top {
        display: flex;
        gap: 22px;
        height: 200px;
        justify-content: center;
        padding: 0 300px;
        background-color: #f1f5f9;
    }

    #additional-info {
        display: flex;
        background-color: #6244dbab;
        padding: 20px 300px;
        justify-content: space-between;
    }

    #additional-info > div {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    #additional-info h3 {
        color: var(--asc-txt-alt);
        font-weight: 500;
        font-size: 16px;
    }

    #additional-info svg {
        width: 20px;
        fill: var(--asc-bg-alt);
    }

    #offer-detail {
        width: 100%;
        display: flex;
        align-items: center;
    }

    #image {
        width: 200px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #image img {
        border-radius: 2px;
        width: 140px;
        height: 140px;
    }

    #offer-title {
        width: 100%;
        display: flex;
        height: 100px;
    }

    #offer-title > div {
        display: flex;
        flex-direction: column;
        gap: 5px;
        padding: 0 22px;
    }

    h2#title {
        color: var(--asc-txt-sec);
        font-size: 38px;
        font-weight: 600;
    }

    a#company {
        color: var(--asc-txt-ui-sec);
        font-weight: 600;
        font-size: 18px;
        width: fit-content;
    }

    a#company:hover {
        text-decoration: underline;
    }

    h3#ask-question {
        color: var(--asc-txt-ui-sec);
        font-weight: 500;
        font-size: 15px;
    }

    #main-content {
        min-height: 500px;
        background-color: var(--asc-bg-alt);
        display: flex;
        width: calc(100% - 600px);
        padding: 40px 300px;
        gap: 22px;
    }

    #main-content h2.header {
        display: inline-block;
        color: var(--asc-txt-sec);
        font-size: 25px;
        margin: 22px 0 13px;
    }

    #content-left {
        flex: 1;
    }

    #offer-action {
        display: flex;
        flex-direction: column;
        gap: 10px;
        height: 200px;
        padding: 20px;
    }

    #offer-action h2, #offer-action h3 {
        color: var(--asc-txt-sec)
    }

    p {
        margin: 22px 13px;
        line-height: 150%;
        color: var(--asc-txt-sec);
    }
</style>