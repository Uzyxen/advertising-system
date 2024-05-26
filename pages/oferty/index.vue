<template>
    <LoadingScreen :is-loading="loading" />

    <section>
        <Filters />
        <div id="offers-flex">
            <OfferSort @loading="loading = true" />
            <OffersList :edit-mode="false" :offers="offers" />
        </div>
    </section>
</template>

<script setup>
    const loading = ref(false);

    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOffers.php', { responseType: 'json', method: 'post' });
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