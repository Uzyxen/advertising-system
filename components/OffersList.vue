<template>
    <div id="offer-list" v-if="offers">
        <TransitionGroup name="list">
            <Offer :edit-mode="editMode" @offer-clicked="$emit('offer-clicked', offer.ogloszenie_id)" v-for="offer in offers" :key="offer.ogloszenie_id" :offer="offer" />
        </TransitionGroup>
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

    .list-enter-active,
    .list-leave-active {
        transition: all 0.5s ease;
    }
    .list-enter-from,
    .list-leave-to {
        opacity: 0;
        transform: translateX(30px);
    }
</style>