<template>
    <MobileNavigation :is-visible="isMobileMenuVisible" @close="isMobileMenuVisible = false" />

    <header>
        <div id="topbar">
            <Nuxt-link id="logo" to="/">moltaro.pl</Nuxt-link>
            <nav>
                <Nuxt-link to="/oferty">
                    Oferty pracy
                </Nuxt-link>

                <Nuxt-link to="/cv">Kreator CV</Nuxt-link>
            </nav>

            <div id="hamburger-menu" @click.stop="isMobileMenuVisible = true">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                    <path d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM64 256c0-17.7 14.3-32 32-32H480c17.7 0 32 14.3 32 32s-14.3 32-32 32H96c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z"/>
                </svg>
            </div>

            <div id="my-account">
                <div id="my-acc" @click.stop="account_dropdown_visible = !account_dropdown_visible">
                    Moje konto
                </div>

                <div id="my-account-dropdown" v-if="account_dropdown_visible" ref="dropDown" v-click-outside="hideDropdown">
                    <div id="dropdown-company-logged" v-if="company_logged">
                        <ul>
                            <li>
                                <Nuxt-link to="/firma/profil">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M48 0C21.5 0 0 21.5 0 48V464c0 26.5 21.5 48 48 48h96V432c0-26.5 21.5-48 48-48s48 21.5 48 48v80h96c26.5 0 48-21.5 48-48V48c0-26.5-21.5-48-48-48H48zM64 240c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V240zm112-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H176c-8.8 0-16-7.2-16-16V240c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H272c-8.8 0-16-7.2-16-16V240zM80 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H80c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16zm80 16c0-8.8 7.2-16 16-16h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H176c-8.8 0-16-7.2-16-16V112zM272 96h32c8.8 0 16 7.2 16 16v32c0 8.8-7.2 16-16 16H272c-8.8 0-16-7.2-16-16V112c0-8.8 7.2-16 16-16z"/>
                                        </svg>
                                        Profil firmy
                                    </span>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/powiadomienia" id="notifications">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v18.8c0 47-17.3 92.4-48.5 127.6l-7.4 8.3c-8.4 9.4-10.4 22.9-5.3 34.4S19.4 416 32 416H416c12.6 0 24-7.4 29.2-18.9s3.1-25-5.3-34.4l-7.4-8.3C401.3 319.2 384 273.9 384 226.8V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm45.3 493.3c12-12 18.7-28.3 18.7-45.3H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7z"/>
                                        </svg>

                                        Powiadomienia
                                    </span>

                                    <p v-if="notifications_counter > 0">{{ notifications_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/wiadomosci" id="messages">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M64 0C28.7 0 0 28.7 0 64V352c0 35.3 28.7 64 64 64h96v80c0 6.1 3.4 11.6 8.8 14.3s11.9 2.1 16.8-1.5L309.3 416H448c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H64z"/>
                                        </svg>

                                        Wiadomości
                                    </span>

                                    <p v-if="messages_counter > 0">{{ messages_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/firma/oferty">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M215.4 96H144 107.8 96v8.8V144v40.4 89L.2 202.5c1.6-18.1 10.9-34.9 25.7-45.8L48 140.3V96c0-26.5 21.5-48 48-48h76.6l49.9-36.9C232.2 3.9 243.9 0 256 0s23.8 3.9 33.5 11L339.4 48H416c26.5 0 48 21.5 48 48v44.3l22.1 16.4c14.8 10.9 24.1 27.7 25.7 45.8L416 273.4v-89V144 104.8 96H404.2 368 296.6 215.4zM0 448V242.1L217.6 403.3c11.1 8.2 24.6 12.7 38.4 12.7s27.3-4.4 38.4-12.7L512 242.1V448v0c0 35.3-28.7 64-64 64H64c-35.3 0-64-28.7-64-64v0zM176 160H336c8.8 0 16 7.2 16 16s-7.2 16-16 16H176c-8.8 0-16-7.2-16-16s7.2-16 16-16zm0 64H336c8.8 0 16 7.2 16 16s-7.2 16-16 16H176c-8.8 0-16-7.2-16-16s7.2-16 16-16z"/>
                                        </svg>
                                        Oferty firmy
                                    </span>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/ustawienia">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/>
                                        </svg>
                                        Ustawienia
                                    </span>
                                </Nuxt-link>
                            </li>
                        </ul>

                        <hr>

                        <button class="logout-button" @click="LogOut">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"/>
                            </svg>
                            Wyloguj się
                        </button>
                    </div>

                    <div id="dropdown-user-logged" v-if="user_logged">
                        <ul>
                            <li>
                                <Nuxt-link to="/profil">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z"/>
                                        </svg>
                                        Profil
                                    </span>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/powiadomienia" id="notifications">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M224 0c-17.7 0-32 14.3-32 32V51.2C119 66 64 130.6 64 208v18.8c0 47-17.3 92.4-48.5 127.6l-7.4 8.3c-8.4 9.4-10.4 22.9-5.3 34.4S19.4 416 32 416H416c12.6 0 24-7.4 29.2-18.9s3.1-25-5.3-34.4l-7.4-8.3C401.3 319.2 384 273.9 384 226.8V208c0-77.4-55-142-128-156.8V32c0-17.7-14.3-32-32-32zm45.3 493.3c12-12 18.7-28.3 18.7-45.3H224 160c0 17 6.7 33.3 18.7 45.3s28.3 18.7 45.3 18.7s33.3-6.7 45.3-18.7z"/>
                                        </svg>

                                        Powiadomienia
                                    </span>

                                    <p v-if="notifications_counter > 0">{{ notifications_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/wiadomosci" id="messages">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M64 0C28.7 0 0 28.7 0 64V352c0 35.3 28.7 64 64 64h96v80c0 6.1 3.4 11.6 8.8 14.3s11.9 2.1 16.8-1.5L309.3 416H448c35.3 0 64-28.7 64-64V64c0-35.3-28.7-64-64-64H64z"/>
                                        </svg>

                                        Wiadomości
                                    </span>

                                    <p v-if="messages_counter > 0">{{ messages_counter }}</p>
                                </Nuxt-link>
                            </li>

                            <li>
                                <Nuxt-link to="/ustawienia">
                                    <span class="list-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                            <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                            <path d="M495.9 166.6c3.2 8.7 .5 18.4-6.4 24.6l-43.3 39.4c1.1 8.3 1.7 16.8 1.7 25.4s-.6 17.1-1.7 25.4l43.3 39.4c6.9 6.2 9.6 15.9 6.4 24.6c-4.4 11.9-9.7 23.3-15.8 34.3l-4.7 8.1c-6.6 11-14 21.4-22.1 31.2c-5.9 7.2-15.7 9.6-24.5 6.8l-55.7-17.7c-13.4 10.3-28.2 18.9-44 25.4l-12.5 57.1c-2 9.1-9 16.3-18.2 17.8c-13.8 2.3-28 3.5-42.5 3.5s-28.7-1.2-42.5-3.5c-9.2-1.5-16.2-8.7-18.2-17.8l-12.5-57.1c-15.8-6.5-30.6-15.1-44-25.4L83.1 425.9c-8.8 2.8-18.6 .3-24.5-6.8c-8.1-9.8-15.5-20.2-22.1-31.2l-4.7-8.1c-6.1-11-11.4-22.4-15.8-34.3c-3.2-8.7-.5-18.4 6.4-24.6l43.3-39.4C64.6 273.1 64 264.6 64 256s.6-17.1 1.7-25.4L22.4 191.2c-6.9-6.2-9.6-15.9-6.4-24.6c4.4-11.9 9.7-23.3 15.8-34.3l4.7-8.1c6.6-11 14-21.4 22.1-31.2c5.9-7.2 15.7-9.6 24.5-6.8l55.7 17.7c13.4-10.3 28.2-18.9 44-25.4l12.5-57.1c2-9.1 9-16.3 18.2-17.8C227.3 1.2 241.5 0 256 0s28.7 1.2 42.5 3.5c9.2 1.5 16.2 8.7 18.2 17.8l12.5 57.1c15.8 6.5 30.6 15.1 44 25.4l55.7-17.7c8.8-2.8 18.6-.3 24.5 6.8c8.1 9.8 15.5 20.2 22.1 31.2l4.7 8.1c6.1 11 11.4 22.4 15.8 34.3zM256 336a80 80 0 1 0 0-160 80 80 0 1 0 0 160z"/>
                                        </svg>
                                        Ustawienia
                                    </span>
                                </Nuxt-link>
                            </li>
                        </ul>

                        <hr>

                        <button class="logout-button" @click="LogOut">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                                <!--!Font Awesome Free 6.5.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc. -->
                                <path d="M502.6 278.6c12.5-12.5 12.5-32.8 0-45.3l-128-128c-12.5-12.5-32.8-12.5-45.3 0s-12.5 32.8 0 45.3L402.7 224 192 224c-17.7 0-32 14.3-32 32s14.3 32 32 32l210.7 0-73.4 73.4c-12.5 12.5-12.5 32.8 0 45.3s32.8 12.5 45.3 0l128-128zM160 96c17.7 0 32-14.3 32-32s-14.3-32-32-32L96 32C43 32 0 75 0 128L0 384c0 53 43 96 96 96l64 0c17.7 0 32-14.3 32-32s-14.3-32-32-32l-64 0c-17.7 0-32-14.3-32-32l0-256c0-17.7 14.3-32 32-32l64 0z"/>
                            </svg>
                            Wyloguj się
                        </button>
                    </div>

                    <div v-if="user_logged === false && company_logged === false">
                        <h2>Zaloguj się, aby uzyskać dostęp do wszystkich funkcji portalu</h2>
                        <Nuxt-link to="/logowanie"><button id="login-button">Zaloguj się</button></Nuxt-link>
                        <h3>Lub</h3>
                        <Nuxt-link to="/rejestracja"><button id="register-button">Zarejestruj się</button></Nuxt-link>
                    </div>
                </div>
            </div>
        </div>
    </header>
</template>

<script setup>
    const user_logged = ref(false);
    const company_logged = ref(false);
    const account_dropdown_visible = ref(false);
    const isMobileMenuVisible = ref(false);

    async function LogOut() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/LogOut.php', { method: 'post', credentials: 'include', responseType: 'json' });

        if (response == 'success') {
            const router = useRouter();
            
            user_logged.value = false;
            company_logged.value = false;

            router.push({ path: "/" });
        }
    }

    async function CheckIfUserLogged() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/user/CheckIfLogged.php', { credentials: 'include', responseType: 'json' });

        if(response) {
            user_logged.value = response.logged;
        }
    }

    async function CheckIfCompanyLogged() {
        const response = await $fetch('http://localhost/advertising-system/backend/api/company/CheckIfLogged.php', { credentials: 'include', responseType: 'json' });

        if(response) {
            company_logged.value = response.logged;
        }
    }

    function hideDropdown() {
        account_dropdown_visible.value = false;
    }

    onMounted(() => {
        CheckIfUserLogged();
        CheckIfCompanyLogged();
    });
</script>

<style scoped>
    header{
        box-shadow: 0px 1px 5px 0px rgba(0, 0, 0, 0.15);
        z-index: 999;
        position: relative;
        background-color: var(--asc-bg-alt);
    }

    #topbar{
        height: 60px;
        padding: 0 150px;
        display: flex;
        align-items: center;
    }   

    #topbar a{
        text-decoration: none;
    }

    nav{
        flex: 1;
    }

    a#logo{
        color: var(--asc-txt);
        font-size: 35px;
        font-weight: 700;
    }

    nav a{
        padding: 0 0 0 60px;
        color: var(--asc-txt-ui);
        font-weight: 700;
        font-size: 15px;
    }

    #my-account{
        background-color: var(--asc-bg);
        border-radius: 2px;
        color: var(--asc-txt-alt);
        width: 160px;
        height: 40px;
    }

    #hamburger-menu {
        display: none;
    }

    #my-acc{
        cursor: pointer;
        width: 100%;
        height: 100%;
        border-radius: 2px;
        display: flex;
        justify-content: center;
        align-items: center;
    }

    #my-account-dropdown{
        position: absolute;
        min-width: 100px;
        top: 58px;
        right: 150px;
        background-color: var(--asc-bg-alt);
        border: 1px solid var(--asc-bg-border);
        border-radius: 2px;
        padding: 10px 15px;
    }

    #my-account-dropdown p{
        color: var(--asc-txt-ui-alt);
    }

    #my-account-dropdown p > span{
        font-weight: 700;
    }

    #my-account-dropdown > div{
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 300px;
    }

    #my-account-dropdown > div h2{
        color: var(--asc-txt-ui-alt);
        font-size: 15px;
        margin: 10px 0 15px;
        width: 280px;
    }

    #my-account-dropdown > div button{
        cursor: pointer;
        font-size: 18px;
        padding: 10px;
        width: 280px;
        height: 45px;
        border-radius: 3px;
    }

    #dropdown-user-logged, #dropdown-company-logged{
        width: 240px !important;
    }

    #dropdown-user-logged button, #dropdown-company-logged button{
        width: 240px !important;
        border: 3px solid var(--asc-bg-border-alt);
        color: var(--asc-txt);
    }

    #dropdown-user-logged ul, #dropdown-company-logged ul{
        width: 100%;
        list-style-type: none;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
    }

    #dropdown-user-logged ul li a, #dropdown-company-logged ul li a{
        width: calc(100% - 20px);
        height: 100%;
        display: block;
        cursor: pointer;
        color: var(--asc-txt-ui-alt);
        padding: 20px 10px;
        display: flex;
        justify-content: start;
        align-items: center;
        position: relative;
        z-index: 1;
        transition: color .2s ease-in-out;
    }

    li:hover {
        background-color: #eee;
    }

    #notifications p, #messages p{
        border-radius: 2px;
        position: absolute;
        right: 5px;
        background-color: #FF5252;
        padding: 5px;
        height: 15px;
        width: 15px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: var(--asc-txt-alt);
        margin: 0;
    }

    #login-button{
        background-color: var(--asc-bg);
        color: var(--asc-txt-alt);
    }

    #register-button{
        border: 3px solid var(--asc-bg-border-alt);
        color: var(--asc-txt);
        margin-bottom: 10px;
        background-color: transparent;
    }

    #my-account-dropdown > div h3{
        color: var(--asc-txt-ui-alt);
        font-size: 18px;
        margin: 10px 0;
    }

    hr{
        margin-top: 30px;
        border: none;
        height: 1px;
        background-color: var(--asc-bg-border);
        width: 100%;
    }

    .list-flex {
        display: flex;
        align-items: center;
        gap: 10px;
    }

    .list-flex svg {
        width: 15px;
        fill: var(--asc-txt-ui-sec);
    }

    .logout-button{
        border: none !important;
        background-color: #fff;
        color: #ff3333 !important;
        padding: 10px !important;
        height: auto !important;
        display: flex;
        justify-content: center;
        align-items: center;
        gap: 10px;
    }

    .logout-button svg {
        width: 20px;
        transform: rotate(180deg);
        fill: #ff3333;
    }

    @media (min-width: 1920px){
        #topbar{
            max-width: 1440px;
            margin: 0 auto;
        }
    }

    @media (max-width: 1300px) {
        #topbar {
            padding: 0 60px;
        }

        #my-account-dropdown{
            right: 60px;
        }
    }

    @media (max-width: 1015px) {
        #topbar {
            padding: 0 20px;
        }

        #my-account-dropdown{
            right: 20px;
        }
    }

    @media (max-width: 896px) {
        #my-account, #topbar > nav {
            display: none;
        }

        #topbar #logo {
            flex: 1;
        }

        #hamburger-menu {
            display: block;
            width: 35px;
            height: 35px;
            cursor: pointer;
            fill: #231d2b;
        }
    }
    
</style>