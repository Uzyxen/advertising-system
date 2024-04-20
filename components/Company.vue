<template>
    <div class="company">
        <div class="image">
            <img :src="'/src/assets/company/' + company.photo_url" alt="zdjęcie firmy">
        </div>

        <div class="info">
            <h4>{{ company.company_name }}</h4>
        </div>

        <div class="line"></div>

        <a href="">
            Zobacz profil
        
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/>
            </svg>
        </a>
    </div>
</template>

<script setup>
    const props = defineProps(['company']);
</script>

<style scoped>
    .company{
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        display: flex;
        flex-direction: column;
        align-items: center;
        border-radius: 2px;
        background-color: #fff;
    }

    .company .image{
        margin-top: 10px;
        height: 110px;
        width: 110px;
    }

    .company .image img{
        width: 100%;
        height: auto;
    }

    .company .info{
        padding: 10px 0 0 10px;
    }

    .company .line{
        height: 1px;
        background-color: #DDD;
        width: 100%;
    }

    .company .info h4{
        font-size: 16px;
        padding: 10px 0;
        color: #231d2b;
    }

    .company a{
        text-decoration: none;
        color: #6244DB;
        font-size: 14px;
        padding: 10px 0;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .company a svg{
        width: 12px;
        height: 12px;
        fill: #6244DB;
    }
</style>