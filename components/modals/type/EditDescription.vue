<template>
    <ModalHeader>Podsumowanie zawodowe</ModalHeader>

    <textarea spellcheck="false" v-model="description"></textarea>

    <ModalSaveButton @button-clicked="">Zapisz zmiany</ModalSaveButton>
</template>

<script setup>
    const model = defineModel();
    const description = ref(model.value);
</script>

<style scoped>
    textarea {
        resize: none;
        border: 1px solid #DDD;
        outline: none;
        position: relative;
        width: calc(100% - 20px);
        margin: 0 25px;
        height: 400px;
        font-size: 18px;
        overflow-y: auto;
        border-radius: 2px;
        padding: 5px 10px;
    }
</style>