<template>
    <div class="skill" :class="{ edit: isEditMode }">
        {{ skill }}

        <svg v-if="isEditMode" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
            <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
            <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
        </svg>
    </div>
</template>

<script setup>
    defineProps(['skill', 'isEditMode']);
</script>

<style scoped>
    .skill {
        background-color: #DDD;
        padding: 10px 15px;
        font-size: 15px;
        color: #231D2B;
        position: relative;
        display: flex;
        align-items: center;
    }

    .skill svg {
        position: absolute;
        right: 10px;
        width: 25px;
        height: 25px;
        fill: #6244DB;
        cursor: pointer;
        transition: fill .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .skill svg:hover {
        fill: #F44534;
    }
</style>