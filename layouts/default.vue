<template>
    <div id="background">
        <picture>
            <img src="/img/background/background.png">
        </picture>
    </div>

    <Header />

    <main>
        <slot />
    </main>

    <Footer />
</template>

<script setup>
    
</script>

<style>
    @import url('/assets/styles/style.css');

    body {
        overflow-x: hidden;
    }

    #background{
        position: fixed;
        width: 100%;
        height: 100%;
        z-index: -5;
    }

    #background picture, #background img {
        width: 100%;
        height: 100%;
    }
</style>