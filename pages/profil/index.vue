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
        display: flex;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }

</style>