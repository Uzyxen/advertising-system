<template>
    <ModalHeader>Podsumowanie zawodowe</ModalHeader>

    <textarea spellcheck="false" v-model="newDescription"></textarea>

    <ModalSaveButton @button-clicked="">Zapisz</ModalSaveButton>
</template>

<script setup>
    const props = defineProps(['description']);
    const newDescription = ref(props.description);
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
        font-size: 16px;
        overflow-y: auto;
        border-radius: 2px;
        padding: 5px 10px;
        color: #676071;
    }
</style>