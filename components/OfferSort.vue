<template>
    <div id="sort">
        <div id="sort-in">
            Sortowanie:

            <div @click="ShowSortMethods" id="sort-method">
                <p>{{ sortMethods[selected] }}</p>

                <div id="sort-methods" v-if="isSortMethodsVisible">
                    <div class="method" v-for="(value, id) in sortMethods" :key="id" @click="SelectSortMethod(id)" :class="{ 'selected-method' : parseInt(id) == selected }">{{ value }}</div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup>
    function ShowSortMethods() {
        isSortMethodsVisible.value = !isSortMethodsVisible.value;
    }

    function SelectSortMethod(id) {
        selected.value = id;
    }

    const isSortMethodsVisible = ref(false);

    const sortMethods = ref({
        1: 'Domyślne',
        2: 'Najnowsze',
        3: 'Najstarsze',
        4: 'Najwyższe wynagrodzenie'
    });

    const selected = ref(1);
</script>

<style scoped>
    #sort{
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        padding: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        width: calc(60% - 40px);
        background-color: var(--asc-bg-alt);
    }

    #sort-in{
        display: flex;
        align-items: center;
    }

    #sort-method{
        cursor: pointer;
        width: 250px;
        position: relative;
        white-space: nowrap;
    }

    #sort-method > p{
        padding: 5px;
        margin: 0;
    }

    #sort-methods{
        display: flex;
        flex-direction: column;
        position: absolute;
        left: -1px;
        background-color: #FFF;
        width: 100%;
        z-index: 99;
        border: 1px solid #DDD;
        border-top: none;
    }

    .method{
        padding: 5px;
    }

    .method.selected-method{
        background-color: #6244DB;
        color: #FFF;
    }
    .method:not(.selected-method):hover{
        background-color: #eee;
    }
</style>