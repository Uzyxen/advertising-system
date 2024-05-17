<template>
    <div class="dropdown">
        <slot />
    </div>
</template>

<style scoped>
    .dropdown {
        display: flex;
        flex-direction: column;
        gap: 10px;
        padding: 20px 30px;
    }
</style>