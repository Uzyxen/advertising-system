<template>
    <div class="experience-block" :class="{ edit: isEditMode }">
        <div class="header">
            <span v-if="!isEditMode">
                {{ experience.data_poczatek }}
            </span>

            <input type="date" placeholder="Początek: " v-else>
            - 
            <span v-if="!isEditMode">
                {{ experience.data_koniec }}
            </span>

            <input type="date" placeholder="Koniec: " v-else>
        </div>
        <div class="info">
            <h3 v-if="!isEditMode">
                {{ experience.stanowisko }}
            </h3>

            <input type="text" placeholder="Stanowisko: " v-else>

            <p v-if="!isEditMode">
                {{ experience.opis }}
            </p>

            <input type="text" placeholder="Opis: " v-else>
        </div>

        <hr>

        <div class="company-location" v-if="experience">
            {{ experience.firma }}
            <div class="dot"></div>
            {{ experience.lokalizacja }}
        </div>
    </div>
</template>

<script setup>
    defineProps(['experience', 'isEditMode']);
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

    .experience-block.edit {
        width: 100%;
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
        gap: 5px;
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