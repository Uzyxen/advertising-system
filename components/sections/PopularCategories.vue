<template>
    <section id="popular-categories-section">
        <h2>Zobacz popularne kategorie</h2>

        <div id="categories">
            <div class="category" v-for="(value, id) in categories" :key="id">{{ value }}</div>
        </div>
    </section>
</template>

<script setup>
    const categories = ref({
        1: 'Praca IT', 
        2: 'Praca Zdalna',
        3: 'Energetyka',
        4: 'Prawo',
        5: 'Nieruchomości',
        6: 'Marketing',
        7: 'Bankowość',
        8: 'Budownictwo'
    });
</script>

<style scoped>
    section#popular-categories-section{
        padding: 150px 500px 100px;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        z-index: 2;
    }

    h2{
        text-align: center;
        color: #231d2b;
        font-size: 42px;
        font-weight: 800;
        position: relative;
    }

    h2::before{
        content: '';
        position: absolute;
        background-color: #6244DB;
        left: 0;
        bottom: 0;
        height: 50%;
        width: 100%;
        opacity: 0.2;
        z-index: -1;
    }

    #categories{
        margin-top: 50px;
        display: flex;
        gap: 25px;
        flex-wrap: wrap;
        justify-content: center;
        width: 100%;
    }

    .category{
        cursor: pointer;
        text-align: center;
        background-color: #eeeeee6e;
        padding: 15px 25px;
        border-radius: 2px;
    }

    .category:hover {
        background-color: #eee;
    }
</style>