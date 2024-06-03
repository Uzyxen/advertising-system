<template>
    <section id="companies">
        <SectionTitle>Przeglądaj profile pracodawców</SectionTitle>

        <div id="companies-box">
            <Company v-for="company in companies" :key="company.id" :company="company"/>
        </div>

        <button>
            Pokaż pracodawców

            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                <path d="M438.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-160-160c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L338.8 224 32 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l306.7 0L233.4 393.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l160-160z"/>
            </svg>
        </button>
    </section>
</template>

<script setup>
    const { data: companies } = await useFetch('http://localhost/advertising-system/backend/api/companies/GetRecomendedCompanies.php', { responseType: 'json', method: 'post' });
</script>

<style scoped>
    section#companies{
        padding: 200px 250px 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        z-index: 2;
    }

    #companies-box{
        padding-top: 100px;
        display: grid;
        grid-template-columns: repeat(4, minmax(280px, 1fr));
        gap: 30px;
    }

    button{
        cursor: pointer;
        color: #6244DB;
        border: 2px solid #6244DB;
        background-color: #fff;
        display: flex;
        align-items: center;
        gap: 10px;
        margin-top: 80px;
        padding: 15px 25px;
        border-radius: 2px;
        font-size: 17px;
    }

    button svg{
        width: 14px;
        height: 14px;
        fill: #6244DB;
    }

</style>