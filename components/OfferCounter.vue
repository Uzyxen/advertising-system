<template>
    <h1>{{ counter.toLocaleString() }}</h1>
</template>

<script setup>
    const counter = ref(0);
    const target = ref(92673);

    onMounted(() => {
        setInterval(() => {
            if(counter.value < target.value){
                counter.value += 952;

                if(counter.value > target.value)
                    counter.value = target.value;
            }
        }, 1);
    });
</script>

<style scoped>
    h1{
        font-weight: 900;
        font-size: 60px;
        color: #6244DB;
    }
</style>