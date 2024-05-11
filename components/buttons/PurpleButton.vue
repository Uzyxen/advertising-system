<template>
    <button>
        <slot />
    </button>
</template>

<style scoped>
    button {
        color: var(--asc-txt-alt);
        background-color: var(--asc-bg);
        font-size: 18px;
        padding: 10px 25px;
        width: 200px;
        cursor: pointer;
        border-radius: 2px;
    }
</style>