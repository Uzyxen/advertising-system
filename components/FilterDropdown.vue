<template>
    <div class="dropdown">
        <slot />
    </div>
</template>

<style scoped>
    .dropdown {
        display: flex;
        flex-direction: column;
        padding: 5px 20px;
        user-select: none;
    }
</style>