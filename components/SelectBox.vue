<template>
    <div id="selected" @click="isCollapsed = !isCollapsed">
        <p v-if="selected">{{ selected }}</p>
        <p v-else>wybierz</p>

        <div id="list" v-if="isCollapsed">
            <div class="item" v-for="item in source" @click="selectItem(item)">
                {{ item.name }}
            </div>
        </div>
    </div>
</template>

<script setup>
    defineProps(['source']);

    const selected = ref('');
    const isCollapsed = ref(false);

    function selectItem(item) {
        selected.value = item.name;
    }
</script>

<style scoped>
    #selected {
        position: relative;
        min-width: 100px;
        height: 15px;
        padding: 10px;
        border: 1px solid #DDD;
        cursor: pointer;
    }

    #list {
        width: 100%;
        background-color: var(--asc-bg-alt);
        z-index: 9;
        position: absolute;
        left: -1px;
        top: 36px;
        display: flex;
        flex-direction: column;
        gap: 5px;
        border: 1px solid #DDD;
        border-top: none;
    }

    .item {
        padding: 10px;
        cursor: pointer;
        width: calc(100% - 20px);
    }

    .item:hover {
        background-color: #eee;
    }
</style>