<template>
    <div id="root">
        <div id="root-inner">
            <SectionTitle style="margin-bottom: 30px">Profil użytkownika</SectionTitle>

            <main>
                <ProfileMainView />
            </main>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        middleware: 'auth-user'
    });
</script>

<style scoped>
    #root{  
        min-height: 100vh;
    }

    #root-inner {
        padding: 20px 150px 0;
        display: flex;
        flex-direction: column;
        -webkit-box-shadow: 0px 5px 100px -68px rgba(35, 29, 43, 1);
        -moz-box-shadow: 0px 5px 100px -68px rgba(35, 29, 43, 1);
        box-shadow: 0px 5px 90px -78px rgba(35, 29, 43, 1);
    }

    main {
        display: flex;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }

</style>