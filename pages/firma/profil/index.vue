<template>
    <div id="root">
        <div id="root-inner">
            <SectionTitle>Profil firmy</SectionTitle>
            <main>
                <CompanyProfileMainView />
            </main>
        </div>
    </div>
</template>

<script setup>

</script>

<style scoped>
    #root{  
        min-height: 100vh;
    }

    #root-inner {
        margin: 20px 150px 50px;
        display: flex;
        flex-direction: column;
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