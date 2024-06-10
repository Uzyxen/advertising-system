<template>
    <LoadingScreen :is-loading="loading" @loaded="loading = false" />

    <SectionTitle id="title">Oferty</SectionTitle>
    <section>
        <Filters @selected="addFilter" @unselected="removeFilter" />
        <div id="offers-flex">
            <OfferSort @loading="loading = true" @selection-changed="(id) => selected = id" />
            <OffersList :edit-mode="false" :offers="filtered_offers" :sort-method="selected" />
        </div>
    </section>

    {{ filters.length }}
</template>

<script setup>
    const loading = ref(false);
    const selected = ref();
    const filters = ref([]);
    
    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOffers.php', { responseType: 'json', method: 'post' });

    const filtered_offers = ref();
    filtered_offers.value = offers.value;

    function addFilter(name) {
        filters.value.push(name);
        filtered_offers.value = offers.value.filter(offer => filters.value.includes(offer.job_level));
    }

    function removeFilter(name) {
        const index = filters.value.indexOf(name);

        if(index !== -1) {
            filters.value.splice(index, 1);
            filtered_offers.value = offers.value.filter(offer => filters.value.includes(offer.job_level));

            if(filters.value.length <= 0) {
                filtered_offers.value = offers.value;
            }
        }
    }
</script>

<style scoped>
    section {
        display: flex;
        gap: 15px;
        width: calc(100% - 300px);
        padding: 20px 150px 0;
    }

    #title {
        margin: 20px 150px;
    }

    #offers-flex {
        display: flex;
        flex: 1;
        flex-direction: column;
        gap: 15px;
    }

    @media (max-width: 1300px) {
        section {
            width: calc(100% - 120px);
            padding: 20px 60px 0;
        }

        #title {
            margin: 20px 60px;
        }
    }

    @media (max-width: 1015px) {
        section {
            width: calc(100% - 40px);
            padding: 20px 20px 0;
        }

        #title {
            margin: 20px 20px;
        }
    }

    @media (max-width: 896px) {
        section {
            flex-direction: column;
        }
    }
</style>