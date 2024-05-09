<template>
    <LoadingScreen :is-loading="loading" />

    <section>
        <SectionTitle>Oferty pracy</SectionTitle>

        <OfferSort @loading="loading = true" />
        <OffersList />
    </section>
</template>

<script setup>
    const loading = ref(false);
</script>

<style scoped>
    section {
        display: flex;
        flex-direction: column;
        align-items: center;
        gap: 15px;
        height: 100vh;
    }
</style>