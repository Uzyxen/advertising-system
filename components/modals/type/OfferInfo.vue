<template>
    <ModalHeader>Zarządzaj ofertą</ModalHeader>

    <div>
        <ColorButton @button-clicked="offerDetails" :background-color="'var(--asc-bg)'">Szczegóły</ColorButton>
        <ColorButton @button-clicked="deleteOffer" :background-color="'#ff3333'">Usuń</ColorButton>
    </div>
</template>

<script setup>
    const props = defineProps(['id']);

    async function deleteOffer() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/offer/DeleteOffer.php', { method: 'post', credentials: 'include', responseType: 'json', body: { 'id': props.id } });
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