<template>
    <div id="loading-screen" v-if="isLoading">
        <span id="loader"></span>
    </div>
</template>

<script setup>
    const props = defineProps(['isLoading']);

    // emits
    const emit = defineEmits(['loaded']);

    watch(() => props.isLoading, (newValue) => {
        if (newValue) {
            setTimeout(() => {
                emit('loaded');
            }, 1000);
        }
    });
</script>

<style scoped>
    #loading-screen{
        position: fixed;
        left: 0;
        top: 0;
        width: 100%;
        height: 100vh;
        background-color: #ffffff8a;
        display: flex;
        justify-content: center;
        align-items: center;
        cursor: not-allowed;
        z-index: 999;
    }

    #loader {
        width: 50px;
        height: 50px;
        border-radius: 50%;
        display: inline-block;
        position: relative;
        border: 10px solid;
        border-color: #6244DB #6244dbcb #6244dba8 #6244db70;
        box-sizing: border-box;
        animation: rotation 1s linear infinite;
    }

    @keyframes rotation {
        0% {
            transform: rotate(0deg);
        }
        100% {
            transform: rotate(360deg);
        }
    } 
</style>