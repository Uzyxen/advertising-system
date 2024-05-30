<template>
    <ModalHeader>Zarządzaj ofertą</ModalHeader>

    <div>
        <ColorButton @button-clicked="offerDetails" style="width: calc(50% - 10px);" :background-color="'var(--asc-bg)'">Szczegóły</ColorButton>
        <ColorButton @button-clicked="editOffer" style="width: 50%;" :background-color="'#ffcc00'">Edytuj</ColorButton>
        <ColorButton @button-clicked="deleteOffer" :background-color="'#ff3333'">Usuń</ColorButton>
    </div>
</template>

<script setup>

    // props
    const props = defineProps(['id']);

    // emits
    const emit = defineEmits(['deleted', 'edit']); 

    async function deleteOffer() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/offer/DeleteOffer.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'id': props.id } });

        if(response) {
            emit('deleted', props.id);
        }
    }

    function editOffer() {
        emit('edit');
    }

    async function offerDetails() {
        await navigateTo('/firma/oferty/' + props.id);
    }
</script>

<style scoped>
    div {
        width: 100%;
        display: flex;
        gap: 10px;
        flex-wrap: wrap;
    }

    div > button{
        width: 100%;
    }
</style>