<template>
    <ModalBlock @close="isModalVisible = false" :isVisible="isModalVisible">
        <OfferInfo :id="selectedOfferId" v-if="type === 0" @deleted="offerDeleted" @edit="isModalVisible = true; type = 2"/>
        <AddOffer v-if="type === 1" @created="offerCreated" >
            Dodaj ofertę
        </AddOffer>
        <AddOffer v-if="type === 2" @created="offerCreated" :offer-id="selectedOfferId">
            Edytuj ofertę
        </AddOffer>
    </ModalBlock>

    <div id="container">
        <PrevPageButton />

        <SectionTitle>Oferty firmy</SectionTitle>

        <div id="offers">
            <div id="add-new" @click="type = 1; isModalVisible = true">
                <div>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                        <path d="M256 80c0-17.7-14.3-32-32-32s-32 14.3-32 32V224H48c-17.7 0-32 14.3-32 32s14.3 32 32 32H192V432c0 17.7 14.3 32 32 32s32-14.3 32-32V288H400c17.7 0 32-14.3 32-32s-14.3-32-32-32H256V80z"/>
                    </svg>

                    <h3>Dodaj nową ofertę</h3>
                </div>
            </div>

            <h4>
                <span>Aktualne oferty</span>
            </h4>

            <div id="offers-flex">
                <OffersList @offer-clicked="offerClicked" :offers="offers" :edit-mode="true" />
            </div>
        </div>
    </div>
</template>

<script setup>
    const isModalVisible = ref(false);
    const type = ref(0);
    const selectedOfferId = ref();
    const selectefOffer = ref();

    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetCompanyOffers.php', { credentials: 'include', responseType: 'json', method: 'post' });

    function offerClicked(id) {
        isModalVisible.value = true;
        type.value = 0;
        selectedOfferId.value = id;
    }

    function offerDeleted(id) {
        offers.value = offers.value.filter(offer => offer.ogloszenie_id !== id);
    }

    async function offerCreated(data) {
        offers.value = await $fetch('http://localhost/advertising-system/backend/api/offer/GetCompanyOffers.php', { credentials: 'include', responseType: 'json', method: 'post' });
    }
</script>

<style scoped>
    #container {
        padding: 20px 150px 0;
        min-height: 100vh;

    }

    #offers {
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        background-color: var(--asc-bg-alt);
        margin-top: 10px;
        padding: 15px;
    }

    #add-new {
        border: 1px solid var(--asc-bg-border);
        display: flex;
        justify-content: center;
        cursor: pointer;
        margin-bottom: 15px;
    }

    #add-new:hover {
        background-color: #eee;
    }

    #add-new > div {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding: 20px;
    }

    #add-new svg {
        width: 80px;
        fill: var(--asc-txt-ui-sec);
    }

    #add-new h3 {
        color: var(--asc-txt-sec);
    }

    #offers-flex {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    h4 {
        font-size: 20px;
        width: 100%; 
        text-align: center; 
        border-bottom: 2px solid var(--asc-txt-ui-sec); 
        line-height: 0.1em;
        margin: 50px 0 30px; 
    } 

    h4 span { 
        background: #fff; 
        padding: 0 10px; 
        color: var(--asc-txt-ui-sec)
    }
</style>