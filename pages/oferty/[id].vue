<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible" >
        <ConfirmApply :offer="offerData" @applied="applied = true"/>
    </ModalBlock>

    <div id="main" v-if="offerData != false">
        <div id="main-top">
            <div id="offer-detail">
                <div id="image">
                    <img src="/company/gizlomar.png" alt="Logo firmy">
                </div>

                <div id="offer-title">
                    <div>
                        <h2 id="title">{{ offerData.tytul }}</h2>
                        <a id="company" href>{{ offerData.nazwa_firmy }}</a>
                    </div>
                </div>
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
                            {{ duty.title }}
                        </p>
                    </div>
                </div>

                <div id="requirements">
                    <h2 class="header">Wymagania</h2>
                    <hr>

                    <div>
                        <p class="list-element" v-for="requirment in requirements">
                            <span></span>
                            {{ requirment.title }}
                        </p>
                    </div>
                </div>
            </div>

            <div id="offer-action">
                <h2>{{ offerData.wynagrodzenie_min.toLocaleString() }} - {{ offerData.wynagrodzenie_max.toLocaleString() }} zł / mies.</h2>
                <h3>Umowa {{ offerData.umowa }}</h3>

                <PurpleButton @button-clicked="openModal" :class="{ disabled: applied }">Aplikuj</PurpleButton>
                <h3 id="ask-question">Zapytaj o ogłoszenie</h3>
            </div>
        </div>
    </div>

    <div v-else>
        <Page404 />
    </div>
</template>

<script setup>
    const isModalVisible = ref(false);

    const route = useRoute();
    const { data: offerData } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOfferData.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'id': route.params.id } });
    const { data: applied } = await useFetch('http://localhost/advertising-system/backend/api/application/GetApplicationStatus.php', { credentials: 'include', responseType: 'json', method: 'post', body: { 'offer_id': route.params.id } });

    const duties = ref([
        { title: 'Inicjowanie i utrzymywanie współpracy z firmami na podległym terenie' },
        { title: 'Realizacja planów sprzedażowych firmy' },
        { title: 'Budowa wizerunku firmy na powierzonym terenie działania' } 
    ]);

    const requirements = ref([
        { title: 'Bardzo dobra znajomość Vue2/Vue3.' },
        { title: 'Minimum 2-letnie doświadczenie w pracy na podobnym stanowisku.' },
        { title: 'Umiejętność rozwiązywania złożonych problemów projektowych przy użyciu logicznego i kreatywnego podejścia.' } 
    ]);

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