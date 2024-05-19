<template>
    <div id="root">
        <AbstractBlock />
        <div id="root-inner">
            <nav id="top-nav">
                <ul>
                    <li v-for="section in sections" @click="changeView(section.component)">{{ section.title }}</li>
                </ul>
            </nav>

            <main>
                <KeepAlive>
                    <component :is="view"/>
                </KeepAlive>
            </main>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        middleware: 'auth-user'
    });

    // nav
    const sections = ref([
        { title: 'Profil', component: ProfileMainView },
        { title: 'CV', component: ProfileCVView },
        { title: 'Aplikacje', component: ProfileApplicationsView }
    ]); 

    // views

    import { ProfileMainView } from '#components';
    import { ProfileCVView } from '#components';
    import { ProfileApplicationsView } from '#components';
    
    const view = ref(ProfileMainView);

    // functions

    function changeView(component) {
        view.value = component;
    }
</script>

<style scoped>
    #root{  
        min-height: 100vh;
    }

    #root-inner {
        margin: 40px 150px 50px;
        display: flex;
        flex-direction: column;
        gap: 22px;
        -webkit-box-shadow: 0px 5px 100px -68px rgba(35, 29, 43, 1);
        -moz-box-shadow: 0px 5px 100px -68px rgba(35, 29, 43, 1);
        box-shadow: 0px 5px 100px -68px rgba(35, 29, 43, 1);
    }

    nav#top-nav {
        width: 100%;
        height: 50px;
        background-color: #FFF;
        box-shadow: 0 0 5px rgba(0,0,0,.12);
    }

    #top-nav ul {
        margin: 0;
        padding: 0;
        list-style-type: none;
        display: flex;
        height: 100%;
        width: 30%;
    }

    #top-nav ul li{
        color: #676071;
        height: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        font-weight: 600;
        flex: 1;
        cursor: pointer;
    }

    #top-nav ul li.current{
        color: #6244DB;
    }

    main {
        display: flex;
        gap: 22px;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }
    
    .v-enter-active,
    .v-leave-active {
        transition: all .3s cubic-bezier(0.24,0.07,0.09,0.99);
    }

    .v-enter-from,
    .v-leave-to {
        transform: scale(.8);
        opacity: 0;
        transform-origin: center;
    }

</style>