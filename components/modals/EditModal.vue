<template>
    <div id="background" v-show="isVisible">
        <Transition>
            <div id="modal" v-if="isVisible">
                <svg @click="$emit('close')" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512"><!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                </svg>
            </div>
        </Transition>
    </div>
</template>

<script setup>
    defineProps(['isVisible']);
</script>

<style scoped>
    #background {
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: #00000067;
        z-index: 999;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #modal {
        background-color: var(--asc-bg-alt);
        height: 600px;
        width: 550px;
        position: relative;
    }

    svg {
        position: absolute;
        left: 15px;
        top: 15px;
        width: 30px;
        cursor: pointer;
        fill: #231D2B;
        transition: fill .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    svg:hover {
        fill: #F44534;
    }

    .v-enter-active,
    .v-leave-active {
        transition: all .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .v-enter-from,
    .v-leave-to {
        transform: scale(.8);
        opacity: 0;
        transform-origin: center;
    }
</style>