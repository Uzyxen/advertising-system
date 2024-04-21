<template>
    <div id="offer-list">
        <Offer v-for="offer in offers" :key="offer.id" :offer="offer" />
    </div>
</template>

<script setup>
    const offers = ref([
        { id: 0, title: 'title 1' },
        { id: 1, title: 'title 2'}
    ]);
</script>

<style scoped>

</style>