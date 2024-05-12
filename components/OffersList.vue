<template>
    <div id="offer-list">
        <Offer v-for="offer in offers" :key="offer.ogloszenie_id" :offer="offer" />
    </div>
</template>

<script setup>
    // fetch
    const { data: offers } = await useFetch('http://localhost/advertising-system/backend/api/offer/GetOffers.php', { responseType: 'json', method: 'post' });
</script>

<style scoped>
    #offer-list {
        width: 100%;
        display: flex;
        flex-direction: column;
        row-gap: 15px;
    }
</style>