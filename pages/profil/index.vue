<template>
    <div id="root">
        <div id="root-inner">
            <PrevPageButton />
            <SectionTitle style="margin-bottom: 30px">Profil użytkownika</SectionTitle>

            <nav>
                <ul>
                    <li v-for="link in links" :class="{ active: link.active }"  @click="changeView(link)">
                        {{ link.header }}
                    </li>
                </ul>
            </nav>

            <main>
                <KeepAlive>
                    <component :is="view" />
                </KeepAlive>
            </main>
        </div>
    </div>
</template>

<script setup>
    definePageMeta({
        middleware: 'auth-user'
    });

    // views

    import { ProfileMainView } from '#components';
    import { ProfileApplicationsView } from '#components';

    const view = ref(ProfileMainView);

    const links = ref([
        { id: 0, header: 'Profil', active: true, component: ProfileMainView },
        { id: 1, header: 'Aplikacje', active: false, component: ProfileApplicationsView }
    ]);

    // functions

    function changeView(link) {
        links.value.forEach(item => {
            item.active = false;
        });
            
        link.active = true;
        view.value = link.component;
    }
</script>

<style scoped>
    #root{  
        min-height: 100vh;
    }

    nav {
        background-color: var(--asc-bg-alt);
        width: fit-content;
    }

    ul {
        list-style-type: none;
        display: flex;
        margin: 0;
        padding: 0;
    }

    ul li {
        min-width: 100px;
        padding: 15px 30px;
        cursor: pointer;
        display: flex;
        justify-content: center;
        align-items: center;
        background-color: var(--asc-txt-ui-sec-alt);
        -webkit-box-shadow: inset 0px 0px 90px -80px rgba(98, 68, 219, 1);
        -moz-box-shadow: inset 0px 0px 90px -80px rgba(98, 68, 219, 1);
        box-shadow: inset 0px 0px 90px -80px rgba(98, 68, 219, 1);
    }

    ul li.active {
        background-color: #FFF;
        box-shadow: none;
    }

    ul li:not(.active):hover {
        background-color: #eee;
    }

    #root-inner {
        padding: 20px 150px 0;
    }

    main {
        box-shadow: rgba(87, 32, 58, 0.08) 0px 30px 1.2rem;
        display: flex;
    }

    @media (min-width: 1920px){
        #root{
            max-width: 1740px;
            margin: 0 auto;
        }
    }

</style>