<template>
    <LoadingScreen :is-loading="loading" />

    <AbstractBlock />
    <section>
        <Filters />
        <div id="offers-flex">
            <OfferSort @loading="loading = true" />
            <OffersList />
        </div>
    </section>
</template>

<script setup>
    const loading = ref(false);
</script>

<style scoped>
    section {
        display: flex;
        gap: 15px;
        width: calc(100% - 300px);
        padding: 80px 150px 0;
    }

    #offers-flex {
        width: 100%;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }
</style>