<template>
    <div id="offer-list">
        <Offer v-for="offer in offers" :key="offer.id" :offer="offer" />
    </div>
</template>

<script setup>
    const offers = ref([
        { id: 1, title: 'title 1', salary_min: 4300, salary_max: 20000, frequency: 'mies.', company: 'Makolab Sp. z.o.o', location: 'Kraków', date: '4 maja 2024'},
        { id: 2, title: 'title 2', salary_min: 5700, salary_max: 19000, frequency: 'mies.', company: 'Gizlomar Sp. z.o.o', location: 'Kraków', date: '5 maja 2024'},
    ]);
</script>

<style scoped>
    #offer-list {
        width: 60%;
        display: flex;
        flex-direction: column;
        row-gap: 15px;
    }
</style>