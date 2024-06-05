<template>
    <Transition>
        <div id="mobile-menu" v-if="isVisible">
            <div id="menu-top">
                <Nuxt-link id="logo" to="/">moltaro.pl</Nuxt-link>

                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" @click="$emit('close')">
                    <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M342.6 150.6c12.5-12.5 12.5-32.8 0-45.3s-32.8-12.5-45.3 0L192 210.7 86.6 105.4c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L146.7 256 41.4 361.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0L192 301.3 297.4 406.6c12.5 12.5 32.8 12.5 45.3 0s12.5-32.8 0-45.3L237.3 256 342.6 150.6z"/>
                </svg>
            </div>

            <nav>
                <ul>
                    <li>
                        <NuxtLink :to="'/oferty/'">
                            Oferty pracy
                        
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                            </svg>
                        </NuxtLink>
                    </li>

                    <li>
                        <NuxtLink :to="'/kreator/'">
                            Kreator CV

                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 512">
                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M310.6 233.4c12.5 12.5 12.5 32.8 0 45.3l-192 192c-12.5 12.5-32.8 12.5-45.3 0s-12.5-32.8 0-45.3L242.7 256 73.4 86.6c-12.5-12.5-12.5-32.8 0-45.3s32.8-12.5 45.3 0l192 192z"/>
                            </svg>
                        </NuxtLink>
                    </li>
                </ul>
            </nav>
        </div>
    </Transition>
</template>

<script setup>
    defineProps(['isVisible']);
</script>

<style scoped>
    #mobile-menu {
        display: none;
    }

    @media (min-width: 1920px){

    }

    @media (max-width: 1300px) {

    }

    @media (max-width: 1015px) {

    }

    @media (max-width: 896px) {
        #mobile-menu {
            display: block;
            position: fixed;
            width: 100%;
            height: 100%;
            z-index: 9999;
            background-color: var(--asc-bg-alt);
        }

        #menu-top {
            position: relative;
            height: 70px;
            display: flex;
            align-items: center;
            padding: 0 20px;
            justify-content: space-between;
        }

        #menu-top #logo{
            color: var(--asc-txt);
            font-size: 35px;
            font-weight: 700;
        }

        #menu-top svg {
            width: 35px;
            cursor: pointer;
            fill: var(--asc-txt-sec);
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            margin-top: 80px;
        }

        ul li a {
            font-size: 8vw;
            padding: 10px 20px;
            display: block;
            height: 100%;
            width: calc(100% - 40px);
            display: flex;
            justify-content: space-between;
            color: var(--asc-txt-sec);
        }

        ul li:hover {
            background-color: #eee;
            cursor: pointer;
        }

        ul li svg {
            width: 5vw;
            fill: var(--asc-txt-sec)
        }
    }

    .v-enter-active,
    .v-leave-active {
        transition: transform .4s cubic-bezier(0.48,0.04,0,0.97);
    }

    .v-enter-from,
    .v-leave-to {
        transform: translateX(100%);
    }
</style>