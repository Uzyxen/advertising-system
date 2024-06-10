<template>
    <div id="offer-list" v-if="offers">
        <TransitionGroup name="list">
            <Offer style="position: relative;" :edit-mode="editMode" @offer-clicked="$emit('offer-clicked', offer.ogloszenie_id)" v-for="offer in offers" :key="offer.ogloszenie_id" :offer="offer" />
        </TransitionGroup>
    </div>

    <div v-else>
        <h2>Brak ofert</h2>
    </div>
</template>

<script setup>
    const props = defineProps(['offers', 'editMode', 'sortMethod']);

    watch(() => props.sortMethod, (newValue) => {
        if (newValue) {
            if(props.sortMethod == '1'){
                props.offers.sort((a, b) => a.ogloszenie_id - b.ogloszenie_id);
            }
            if(props.sortMethod == '2'){
                props.offers.sort((a, b) => new Date(b.data_sort) - new Date(a.data_sort));
            }
            if(props.sortMethod == '3'){
                props.offers.sort((a, b) => new Date(a.data_sort) - new Date(b.data_sort));
            }
            if(props.sortMethod == '4'){
                props.offers.sort((a, b) => b.wynagrodzenie_max - a.wynagrodzenie_max);
            }
        }
    });
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