<template>
    <div id="root">
        <div id="root-inner">
            <PrevPageButton />
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
    }

    main {
        box-shadow: rgba(87, 32, 58, 0.08) 0px 0px 1.2rem;
        display: flex;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }

</style>