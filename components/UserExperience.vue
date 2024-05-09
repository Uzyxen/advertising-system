<template>
    <div class="experience-block">
        <div class="header">{{ experience.data_poczatek }} - {{ experience.data_koniec }}</div>
        <div class="info">
            <h3>{{ experience.stanowisko }}</h3>

            <p>{{ experience.opis }}</p>
        </div>

        <hr>

        <div class="company-location">
            {{ experience.firma }}
            <div class="dot"></div>
            {{ experience.lokalizacja }}
        </div>
    </div>
</template>

<script setup>
    defineProps(['experience']);
</script>

<style scoped>
    .experience-block {
        display: flex;
        width: 370px;
        height: 150px;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
        background-color: #FFF;
        flex-direction: column;
    }

    .header {
        background-color: #6244DB;
        display: flex;
        color: #FFF;
        width: 100%;
        justify-content: center;
        align-items: center;
        height: 35px;
        font-size: 15px;
    }

    .info {
        display: flex;
        flex-direction: column;
    }

    .info h3 {
        font-size: 15px;
        padding: 4px 8px 0 10px;
        color: #231D2B;
    }

    .info p {
        font-size: 13px;
        padding: 8px 10px 12px;
        margin: 0;
        color: #676071;
    }

    hr {
        background-color: #DDD;
        border: none;
        margin: 0;
        height: 1px;
        margin: 5px 0 3px;
    }

    .company-location {
        display: flex;
        align-items: center;
        font-size: 13px;
        color: #676071;
        padding: 0 10px;
        flex: 1;
    }

    .dot {
        background-color: #DDD;
        width: 7px;
        height: 7px;
        border-radius: 50%;
        margin: 0 20px;
    }
</style>