<template>
    <ModalHeader>Wybierz zdjęcie</ModalHeader>

    <label for="file-input">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M288 109.3V352c0 17.7-14.3 32-32 32s-32-14.3-32-32V109.3l-73.4 73.4c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3l128-128c12.5-12.5 32.8-12.5 45.3 0l128 128c12.5 12.5 12.5 32.8 0 45.3s-32.8 12.5-45.3 0L288 109.3zM64 352H192c0 35.3 28.7 64 64 64s64-28.7 64-64H448c35.3 0 64 28.7 64 64v32c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64V416c0-35.3 28.7-64 64-64zM432 456a24 24 0 1 0 0-48 24 24 0 1 0 0 48z"/>
        </svg>
    </label>

    <input type="file" id="file-input">

    <ModalSaveButton>Zapisz zdjęcie</ModalSaveButton>
</template>

<style scoped>
    label {
        width: 100%;
        border: 1px solid #DDD;
        height: 200px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    input {
        display: none;
    }

    svg {
        width: 15%;
        fill: #DDD;
        transition: fill.3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    label:hover svg {
        fill: var(--asc-bg);
    }
</style>