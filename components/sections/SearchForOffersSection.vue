<template>
    <section id="search-for-offers-section">
        <SectionTitle>Szukanie ofert</SectionTitle>
        <div id="search-box">
            <form @submit.prevent="search">
                <div id="inputs">
                    <input type="text" id="search" placeholder="stanowisko" v-model="searchValue">
                    <SelectBox style="height: 20px;" :source="categories" />

                    <input type="text" id="location" placeholder="Lokalizacja">
                    
                    <SelectBox style="height: 20px;" :source="[{ name: '+10 km' }, { name: '+30 km' }, { name: '+50 km' }]" />
                </div>

                <div id="filters">
                    <div id="filters-inner">
                        <span>
                            Rodzaj umowy

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/>
                            </svg>
                        </span>

                        <span>
                            Wymiar pracy

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/>
                            </svg>
                        </span>

                        <span>
                            Tryb pracy

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M233.4 406.6c12.5 12.5 32.8 12.5 45.3 0l192-192c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L256 338.7 86.6 169.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3l192 192z"/>
                            </svg>
                        </span>
                    </div>

                    <input type="submit" value="Szukaj">
                </div>
            </form>
        </div>
    </section>
</template>

<script setup>
    const { data: categories } = await useFetch('http://localhost/advertising-system/backend/api/job/GetJobCategories.php', { responseType: 'json', method: 'post' });

    const searchValue = ref('');

    async function search() {
        if(searchValue.value) {
            await navigateTo('/oferty/szukaj/' + searchValue.value);
        }
    }
</script>

<style scoped>
    section{
        padding: 50px 150px 0;
        position: relative;
        display: flex;
        flex-direction: column;
        align-items: center;
        z-index: 2;
    }
    
    #search-box{
        margin: 40px auto 0;
        width: 1050px;
        border-radius: 5px;
        background: #FFF;
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        padding: 40px 20px;
        display: flex;
        justify-content: center;
    }

    form{
        display: flex;
        flex-direction: column;
        gap: 25px;
        align-items: end;
        color: var(--asc-txt-ui-sec);
    }

    form input {
        font-size: 14px;
    }

    form #inputs{
        display: flex;
    }

    input[type='text'] {
        border: 1px solid #DDD;
    }

    form input[type='submit']{
        color: #FFF;
        background-color: #6244DB;
        font-size: 20px;
        width: 200px;
        padding: 10px;
        cursor: pointer;
        border-radius: 2px;
    }

    input[type='text']{
        padding: 0 5px;
    }

    input#search{
        width: 350px;
        height: 40px;
        border-right: none;
    }

    #filters{
        width: 100%;
        display: flex;
        justify-content: space-between;
    }

    #filters-inner{
        display: flex;
        gap: 40px;
        align-items: center;
    }

    #filters-inner span{
        font-size: 14px;
        color: #6244DB;
        cursor: pointer;
        font-weight: 600;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    #filters-inner span svg{
        width: 14px;
        height: 14px;
        fill: #6244DB;
    }

    #category{
        font-size: 14px;
        display: flex;
        justify-content: flex-start;
        align-items: center;
        width: 200px;
        height: 40px;
        border-left: none;
        border-top: 1px solid #DDD;
        border-bottom: 1px solid #DDD;
    }

    input#location{
        width: 200px;
        height: 40px;
        border-right: none;
        border-left: none;
    }

</style>