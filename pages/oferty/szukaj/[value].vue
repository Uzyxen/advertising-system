<template>
    <LoadingScreen :is-loading="loading" @loaded="loading = false" />

    <section>
        <Filters />
        <div id="offers-flex">
            <OfferSort @loading="loading = true" @selection-changed="(id) => selected = id" />
            <OffersList :edit-mode="false" :offers="offers" :sort-method="selected" />
        </div>
    </section>
</template>
<script setup>
    const route = useRoute();
    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetSearchedOffers.php', { responseType: 'json', method: 'post', body: { 'value': route.params.value } });

    const loading = ref(false);
</script>

<style scoped>
    section {
        display: flex;
        gap: 15px;
        width: calc(100% - 300px);
        padding: 40px 150px 0;
    }

    #offers-flex {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
</style>