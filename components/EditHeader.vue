<template>
    <h2 class="header" @click="$emit('edit')" :class="{ edit: isEditMode }">
        <slot />

        <svg v-if="isEditMode" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M362.7 19.3L314.3 67.7 444.3 197.7l48.4-48.4c25-25 25-65.5 0-90.5L453.3 19.3c-25-25-65.5-25-90.5 0zm-71 71L58.6 323.5c-10.4 10.4-18 23.3-22.2 37.4L1 481.2C-1.5 489.7 .8 498.8 7 505s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L421.7 220.3 291.7 90.3z"/>
        </svg>
    </h2>
</template>

<script setup>
    defineProps(['isEditMode']);
</script>

<style scoped>
    .header{
        display: inline-block;
        color: #231D2B;
        font-size: 25px;
        margin: 22px 0 13px 22px;
    }

    .header.edit {
        cursor: pointer;
    }

    svg {
        height: 20px;
        padding-left: 10px;
        opacity: 0;
        fill: #DDD;
        transition: opacity .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .header:hover svg {
        opacity: 1;
    }
</style>