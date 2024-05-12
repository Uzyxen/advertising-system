<template>
    <h2>
        <slot />
    </h2>
</template>

<style scoped>
    h2{
        text-align: center;
        color: #231d2b;
        font-size: 42px;
        font-weight: 800;
        position: relative;
        margin-bottom: 15px;
        height: fit-content;
    }

    h2::before{
        content: '';
        position: absolute;
        background-color: var(--asc-bg);
        left: 0;
        bottom: 0;
        height: 50%;
        width: 100%;
        opacity: 0.2;
        z-index: -1;
    }

</style>