<template>
    <ModalHeader>Aplikacja</ModalHeader>

    <ModalSaveButton @button-clicked="applyForAJob">Potwierdź</ModalSaveButton>
</template>

<script setup>
    defineProps(['application']);
</script>

<style scoped>

</style>