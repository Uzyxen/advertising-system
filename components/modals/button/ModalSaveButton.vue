<template>
    <button @click="$emit('buttonClicked')">
        <slot />
    </button>
</template>

<script setup>
    defineProps('isDisabled');
</script>

<style scoped>
    button {
        align-self: flex-end;
        background-color: var(--asc-bg);
        color: var(--asc-txt-alt);
        font-size: 18px;
        width: 200px;
        padding: 10px 12px;
        border-radius: 2px;
        cursor: pointer;
    }
</style>