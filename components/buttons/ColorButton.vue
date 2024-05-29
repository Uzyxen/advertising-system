<template>
    <button @click="$emit('buttonClicked')" :style="{ 'background-color': backgroundColor }">
        <slot />
    </button>
</template>

<script setup>
    defineProps(['backgroundColor']);
</script>

<style scoped>
    button {
        color: var(--asc-txt-alt);
        font-size: 18px;
        padding: 10px 25px;
        width: 200px;
        cursor: pointer;
        border-radius: 2px;
    }
</style>