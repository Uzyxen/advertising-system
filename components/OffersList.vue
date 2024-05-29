<template>
    <div id="offer-list" v-if="offers">
        <Offer :edit-mode="editMode" @offer-clicked="$emit('offer-clicked', offer.ogloszenie_id)" v-for="offer in offers" :key="offer.ogloszenie_id" :offer="offer" />
    </div>

    <div v-else>
        <h2>Brak ofert</h2>
    </div>
</template>

<script setup>
    defineProps(['offers', 'editMode']);
</script>

<style scoped>
    #offer-list {
        width: 100%;
        display: flex;
        flex-direction: column;
        row-gap: 15px;
    }
</style>