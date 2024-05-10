<template>
    <ModalHeader>Podsumowanie zawodowe</ModalHeader>

    <textarea></textarea>

    <ModalSaveButton />
</template>

<style scoped>
    textarea {
        resize: none;
        border: 1px solid #DDD;
        outline: none;
        position: relative;
        width: 100%;
        margin: 0 25px;
        height: 400px;
        font-size: 20px;
        overflow-y: auto;
        border-radius: 2px;
    }
</style>